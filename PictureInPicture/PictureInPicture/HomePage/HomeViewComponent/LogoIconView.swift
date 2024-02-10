//
//  LogoIconView.swift
//  PictureInPicture
//
//  Created by Macbook Pro on 10/02/2024.
//

import Foundation
import SwiftUI
struct LogoIconView: View {
    var body: some View {        
        Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
    }
}
