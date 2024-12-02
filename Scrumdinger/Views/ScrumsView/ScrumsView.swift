//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Ivan Magda on 02.12.2024.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    
    var body: some View {
        List(scrums, id: \.title) { scrum in
            CardView(scrum: scrum)
                .listRowBackground(scrum.theme.mainColor)
        }
    }
}

#Preview {
    let scrums = DailyScrum.sampleData
    ScrumsView(scrums: scrums)
}
