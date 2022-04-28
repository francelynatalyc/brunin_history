import Foundation
import SwiftUI
import AVKit
import SpriteKit

struct WalkingScene: View {
    
    @State var isAnimation: Bool = true
    @State var ballonAnimation: Bool = false
    @State private var showingAlert = false

    var body: some View {
        
        ZStack {
            //background
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
                .scaleEffect(0.25)
                .position(x: isAnimation ? -100 : 600, y: 950)
            
            //first cloud
            Image ("cloud_1")
                .scaleEffect(0.5)
                .frame(width: 40, height: 40, alignment: .center)
                .offset(x: 300, y: -150)
            
            //second cloud
            Image ("cloud_2")
                .scaleEffect(0.4)
                .frame(width: 40, height: 40, alignment: .center)
                .offset(x: -120, y: -300)
            
            //third cloud
            Image ("cloud_3")
                .scaleEffect(0.5)
                .frame(width: 40, height: 40, alignment: .center)
                .offset(x: -300, y: 40)

            //front boat
            Image ("front")
                .scaleEffect(0.5)
                .frame(width: 40, height: 40, alignment: .center)
                .offset(x: 250, y: isAnimation ? 365 : 355)
            
            //right button
                NavigationLink(destination: BoatScene(), label: {
                    Image ("right")
                        .scaleEffect(0.3)
                        .frame(width: 40, height: 40, alignment: .center)
                })
                .offset(x: 350, y: -420)
        
            //ballon
            Image ("ballon")
                .scaleEffect(0.2)
                .frame(width: 40, height: 40, alignment: .center)
                .offset(x: 235, y: ballonAnimation ? 20 : 40)
                .onTapGesture {
                    showingAlert = true
                } .alert("This is Bruno, or Brunin.\n\n He is going on a trip to Tefé in a super cute little boat.\n\nGo to the next page.", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.default .speed(0.5) .repeatForever(autoreverses: true)) {
                    ballonAnimation.toggle()
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.default .speed(0.05)) {
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


