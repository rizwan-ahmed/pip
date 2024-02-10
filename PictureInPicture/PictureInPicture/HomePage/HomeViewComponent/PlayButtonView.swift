//
//  PlayButtonView.swift
//  PictureInPicture
//
//  Created by Macbook Pro on 10/02/2024.
//

import Foundation
import SwiftUI

struct PlayButtonView: View {
    @ObservedObject var viewModel: AVPlayerViewModel
    
    var body: some View {
        Button(action: {
            viewModel.togglePlayerVisibility()
        }) {
            HStack {
                Text("Play Video")
                    .foregroundColor(.white)
                Image(systemName: "play.circle.fill")
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.red)
            .cornerRadius(10)
        }
    }
}
