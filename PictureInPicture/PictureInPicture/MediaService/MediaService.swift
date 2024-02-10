//
//  MediaService.swift
//  PictureInPicture
//
//  Created by Macbook Pro on 10/02/2024.
//

import Foundation
protocol MediaServiceProtocol {
    func loadMediaURL(completion: @escaping (String?) -> Void)
}

class MediaService: MediaServiceProtocol {
    func loadMediaURL(completion: @escaping (String?) -> Void) {
        // Simulate loading media URL from a service
        let mediaURL = VEDIO_URL
        completion(mediaURL)
    }
}
