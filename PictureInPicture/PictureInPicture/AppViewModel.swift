//
//  AppViewModel.swift
//  PictureInPicture
//
//  Created by Macbook Pro on 10/02/2024.
//

import SwiftUI

class AppViewModel: ObservableObject {
    let mediaService: MediaServiceProtocol
    
    init(mediaService: MediaServiceProtocol) {
        self.mediaService = mediaService
    }
    
    func createPlayerViewModel() -> AVPlayerViewModel {
        return AVPlayerViewModel(mediaService: mediaService)
    }
}
