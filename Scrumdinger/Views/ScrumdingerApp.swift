//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Ivan Magda on 06.11.2024.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var store = ScrumStore()
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums)
                .task {
                    do {
                        try await store.load()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
        }
    }
}
