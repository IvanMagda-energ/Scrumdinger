//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Ivan Magda on 09.01.2025.
//

import SwiftUI

struct MeetingTimerView: View {
    let speakers: [ScrumTimer.Speaker]
    let isRecording: Bool
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
                    
                    Image(systemName: isRecording ? "mic" : "mic.slash")
                        .font(.title)
                        .padding(.top)
                        .accessibilityLabel(isRecording ? "with transcription" : "without transcription")
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
            .overlay {
                ForEach(speakers) { speaker in
                    if speaker.isCompleted, let index = speakers.firstIndex(where: { $0.id == speaker.id }) {
                        SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                            .rotation(Angle(degrees: -90))
                            .stroke(theme.mainColor, lineWidth: 12)
                    }
                }
            }
            .padding(.horizontal)
    }
}

#Preview {
    var speakers: [ScrumTimer.Speaker] {
        [
            ScrumTimer.Speaker(name: "Bill", isCompleted: true),
            ScrumTimer.Speaker(name: "Cathy", isCompleted: false)
        ]
    }
    
    MeetingTimerView(
        speakers: speakers,
        isRecording: true,
        theme: .orange
    )
}
