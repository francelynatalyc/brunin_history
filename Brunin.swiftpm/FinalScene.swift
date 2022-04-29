
import Foundation
import SwiftUI
import AVKit

struct FinalScene: View {
    var body: some View {
        ZStack {
            Color("blue_sky").ignoresSafeArea()
            
            HStack {
                Image ("final")
                    .scaleEffect(0.9)
                    .frame(width: 40, height: 40, alignment: .center)
                    .offset(x: 80, y: 20)
                
            }
            
            //Gif
            
        }.navigationBarHidden(true)
    }
}

struct FinalScene_Preview: PreviewProvider
{
    static var previews: some View {
        FinalScene()
    }
}
