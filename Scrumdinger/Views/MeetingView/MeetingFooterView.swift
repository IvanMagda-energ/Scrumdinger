//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Ivan Magda on 10.12.2024.
//


import SwiftUI


struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    let skipAction: () -> Void
    
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else {
            return nil
        }
        return index + 1
    }
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
    }
    private var speakerText: String {
        guard let speakerNumber else {
            return "No more speakers"
        }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(isLastSpeaker ? "Last Speaker" : speakerText)
                Spacer()
                Button {
                    skipAction()
                } label: {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next speaker")
            }
        }
        .padding([.bottom, .horizontal])
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers) {}
}
