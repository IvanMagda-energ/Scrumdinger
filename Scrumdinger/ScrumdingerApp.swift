//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Ivan Magda on 06.11.2024.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
