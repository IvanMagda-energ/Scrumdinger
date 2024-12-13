//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Ivan Magda on 02.12.2024.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    
    @State private var isPresentingNewScrumView = false
    
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink {
                    DetailView(scrum: $scrum)
                } label: {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button {
                    isPresentingNewScrumView = true
                } label: {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
            .sheet(isPresented: $isPresentingNewScrumView) {
                NewScrumSheet(
                    isPresentingNewScrumView: $isPresentingNewScrumView,
                    scrums: $scrums
                )
            }
        }
    }
}

#Preview {
    let scrums = DailyScrum.sampleData
    ScrumsView(scrums: .constant(DailyScrum.sampleData))
}
