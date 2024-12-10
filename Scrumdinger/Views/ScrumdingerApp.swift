//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Ivan Magda on 06.11.2024.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
