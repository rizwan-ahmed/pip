//
//  BannerImageView.swift
//  PictureInPicture
//
//  Created by Macbook Pro on 10/02/2024.
//

import Foundation
import SwiftUI
struct BannerImageView: View {
    var body: some View {        
        Image("banner")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(20)
            .frame(height: 200)
    }
    
}
