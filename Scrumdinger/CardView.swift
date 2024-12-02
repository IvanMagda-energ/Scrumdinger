//
//  CardView.swift
//  Scrumdinger
//
//  Created by Ivan Magda on 02.12.2024.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
            
            Spacer()
            
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                
                Spacer()
                
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
            }
        }
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 60)) {
    let scrum = DailyScrum.sampleData[0]
    
    CardView(scrum: scrum)
        .background(scrum.theme.mainColor)
}
