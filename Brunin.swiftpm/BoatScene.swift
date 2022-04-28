
import Foundation
import SwiftUI
import AVKit

struct BoatScene: View {
    var body: some View {
        ZStack {
            Color("blue_sky").ignoresSafeArea()
            
            HStack {
                //river
                Image ("river")
                    .scaleEffect(0.9)
                    .frame(width: 40, height: 40, alignment: .center)
                    .offset(x: 0, y: 20)
                
            }
            
        }.navigationBarHidden(true)
    }
}

struct BoatScene_Preview: PreviewProvider
{
    static var previews: some View {
        BoatScene()
    }
}
