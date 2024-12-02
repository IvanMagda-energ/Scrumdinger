//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Ivan Magda on 02.12.2024.
//

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let scrum = DailyScrum.sampleData[0]
    NavigationStack {
        DetailView(scrum: scrum)
    }
}
