
import Foundation
import SwiftUI
import AVKit

struct ChaosScene: View {
    var body: some View {
        ZStack {
            Color("blue_sky").ignoresSafeArea()
        }
    }
}

struct ChaosScene_Preview: PreviewProvider
{
    static var previews: some View {
        ChaosScene()
    }
}
