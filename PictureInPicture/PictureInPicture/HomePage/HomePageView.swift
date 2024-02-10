//
//  HomePageView.swift
//  PictureInPicture
//
//  Created by Macbook Pro on 10/02/2024.
//

import Foundation
import SwiftUI

struct HomePageView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @StateObject var viewModel: AVPlayerViewModel
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    init(appViewModel: AppViewModel) {
        let playerViewModel = appViewModel.createPlayerViewModel()
        _viewModel = StateObject(wrappedValue: playerViewModel)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    LogoIconView()
                    BannerImageView()
                    PlayButtonView(viewModel: viewModel)
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
                if viewModel.isPlayerVisible {
                    AVVideoPlayer(viewModel: viewModel)
                        .opacity((viewModel.pipStatus == .didStart ) ? 0 : 1)
                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                }
            }
            .onAppear {
                viewModel.loadMedia()
            }
            .onDisappear {
                viewModel.pause()
            }
            .onChange(of: verticalSizeClass) { newVerticalSizeClass in
                // Handle changes in size class (portrait/landscape)
                // We may need to adjust our layout here
                print("Size class changed: \(String(describing: newVerticalSizeClass))")
            }
        }
    }
}
