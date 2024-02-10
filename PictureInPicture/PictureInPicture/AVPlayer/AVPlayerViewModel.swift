//
//  AVPlayerViewModel.swift
//  PictureInPicture
//
//  Created by Macbook Pro on 10/02/2024.
//

import Foundation
import SwiftUI
import Combine
import AVKit

class AVPlayerViewModel: ObservableObject {
    @Published var pipStatus: PipStatus = .undefined
    @Published var mediaURL: String?
    @Published var isPlayerVisible: Bool = false
    
    let player = AVPlayer()
    
    private let mediaService: MediaServiceProtocol
    
    init(mediaService: MediaServiceProtocol) {
        self.mediaService = mediaService
        setAudioSessionCategory(to: .playback)
    }
    
    func play() {
        player.play()
    }
    
    func pause() {
        player.pause()
    }
    
    func togglePlayerVisibility() {
        isPlayerVisible.toggle()
        if isPlayerVisible {
            play()
        } else {
            pause()
        }
    }
    
    func loadMedia() {
        mediaService.loadMediaURL { [weak self] mediaURL in
            guard let mediaURL = mediaURL else { return }
            self?.mediaURL = mediaURL
            guard let url = URL(string: mediaURL) else { return }
            DispatchQueue.main.async {
                self?.player.replaceCurrentItem(with: AVPlayerItem(url: url))
            }
        }
    }    
    
    private func setAudioSessionCategory(to value: AVAudioSession.Category) {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(value)
        } catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }
    }
}
