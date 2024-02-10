import SwiftUI

struct ContentView: View {
    let appViewModel: AppViewModel
    
    init() {
        let mediaService = MediaService()
        self.appViewModel = AppViewModel(mediaService: mediaService)
    }
    
    var body: some View {
        let contentView = HomePageView(appViewModel: appViewModel)
            .environmentObject(appViewModel)
        contentView
    }
}
