//
//  AVPlayer+Extensions.swift
//  Scrumdinger
//
//  Created by Ivan Magda on 13.12.2024.
//

import AVFoundation

extension AVPlayer {
    static let sharedDingPlayer: AVPlayer = {
        guard let url = Bundle.main.url(forResource: "ding", withExtension: "wav") else { fatalError("Failed to find sound file.") }
        return AVPlayer(url: url)
    }()
}
