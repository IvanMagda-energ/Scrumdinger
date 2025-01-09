//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Ivan Magda on 09.01.2025.
//

import SwiftUI

struct MeetingTimerView: View {
    let speakers: [ScrumTimer.Speaker]
    let theme: Theme
    
    private var currentSpeaker: String {
        speakers.first { !$0.isCompleted }?.name ?? "Somebody"
    }
    
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {
                VStack {
                    Text(currentSpeaker)
                        .font(.title)
                    
                    Text("is speaking")
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
    }
}

#Preview {
    var speakers: [ScrumTimer.Speaker] {
        DailyScrum.sampleData.first?.attendees.speakers ?? []
    }
    
    MeetingTimerView(
        speakers: speakers,
        theme: .orange
    )
}
