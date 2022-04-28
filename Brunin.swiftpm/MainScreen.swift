
import Foundation
import SwiftUI
import AVKit

struct MainScreen: View {
    
    @State var isAnimation: Bool = true

    var body: some View {
        ZStack {
            //background
            Color("blue_sky").ignoresSafeArea()
                
                HStack {
                    //first cloud
                    Image ("cloud_1")
                        .scaleEffect(0.7)
                        .frame(width: 40, height: 40, alignment: .center)
                        .offset(x: isAnimation ? -500 : 500, y: -200)
                    
                    //second cloud
                    Image ("cloud_2")
                        .scaleEffect(0.9)
                        .frame(width: 40, height: 40, alignment: .center)
                        .offset(x: isAnimation ? 500 : -500, y: 10)
                    
                    //third cloud
                    Image ("cloud_3")
                        .scaleEffect(0.8)
                        .frame(width: 40, height: 40, alignment: .center)
                        .offset(x: isAnimation ? 500 : -500, y: 300)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation(.default.repeatForever() .speed(0.02)) {
                            isAnimation.toggle()
                        }
                    }
                }
            
            //brunin stories
            Image ("main_brunin")
                .scaleEffect(1)
                .frame(width: 300, height: 300, alignment: .center)
                .offset(x: 0, y: -100)
            
            
            //start button
                NavigationLink(destination: WalkingScene(), label: {
                    Image ("start_button")
                        .scaleEffect(0.1)
                        .frame(width: 40, height: 40, alignment: .center)
                })
                .offset(x: 0, y: 350)

            }.navigationBarHidden(true)
        
    }
}

struct MainScreen_Preview: PreviewProvider
{
    static var previews: some View {
        MainScreen()
    }
}

