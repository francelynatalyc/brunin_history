import Foundation
import SwiftUI
import AVKit

struct WalkingScene: View {
    
    @State var isAnimation: Bool = true
    
    var body: some View {
        ZStack {
            Color("blue_sky").ignoresSafeArea()
            
                HStack {
                
                //trail
                Image ("trail")
                    .scaleEffect(0.9)
                    .frame(width: 40, height: 40, alignment: .center)
                    .offset(x: 0, y: 20)
                }
            
            //walking brunin
            Gif (resourceName: "walking_brunin")
                .scaleEffect(0.4)
            
            //first cloud
            Image ("cloud_1")
                .scaleEffect(0.4)
                .frame(width: 40, height: 40, alignment: .center)
                .offset(x: 300, y: -350)
            
            //second cloud
            Image ("cloud_2")
                .scaleEffect(0.4)
                .frame(width: 40, height: 40, alignment: .center)
                .offset(x: -100, y: -200)
            
            //third cloud
            Image ("cloud_3")
                .scaleEffect(0.4)
                .frame(width: 40, height: 40, alignment: .center)
                .offset(x: -300, y: 70)
            

            //front boat
            Image ("front")
                .scaleEffect(0.55)
                .frame(width: 40, height: 40, alignment: .center)
                .offset(x: 250, y: isAnimation ? 365 : 355)
        }
        
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.default.repeatForever() .speed(0.4)) {
                    isAnimation.toggle()
                }
            }
        }.navigationBarHidden(true)
    }
}

struct WalkingScene_Preview: PreviewProvider
{
    static var previews: some View {
        WalkingScene()
    }
}
