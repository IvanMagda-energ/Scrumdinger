//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Ivan Magda on 08.01.2025.
//

import Foundation

@Observable
final class ScrumStore {
    
    var scrums: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false
        )
        .appendingPathComponent("scrums.data")
    }
    
    /// Loads DailyScrum data from a file, decodes it, and assigns it to the scrums property on the main actor.
    func load() async throws {
        let task = Task<[DailyScrum], Error> {
            let fileURL = try Self.fileURL()
            
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            
            let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: data)
            return dailyScrums
        }
        let scrums = try await task.value
        await MainActor.run {
            self.scrums = scrums
        }
    }
}
