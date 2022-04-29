

import Foundation
import SwiftUI
import AVKit

struct SwimmingScene: View {

    @State var isAnimation: Bool = true
    @State var ballonAnimation: Bool = false
    @State private var showingAlert = false


    var body: some View {
        ZStack {
            Color("blue_sky").ignoresSafeArea()
            

            //coral
            Image ("coral_1")
                .scaleEffect(0.2)
                .frame(width: 40, height: 40, alignment: .center)
                .offset(x: 350, y: 450)
            
            //coral
            Image ("coral_2")
                .scaleEffect(0.3)
                .frame(width: 40, height: 40, alignment: .center)
                .offset(x: -350, y: 450)
                
            //coral
            Image ("coral_2")
                .scaleEffect(0.3)
                .frame(width: 40, height: 40, alignment: .center)
                .offset(x: -310, y: 450)
            
            //right button
            NavigationLink(destination: SwimmingScene(), label: {
                Image ("right")
                        .scaleEffect(0.3)
                        .frame(width: 40, height: 40, alignment: .center)
                })
                .offset(x: 350, y: -420)
            

            //fish
            Image ("fish_1")
                .scaleEffect(0.3)
                .frame(width: 40, height: 40, alignment: .center)
                .offset(x: -210, y: 250)
            
            //fish
            Image ("fish_2")
                .scaleEffect(0.3)
                .frame(width: 40, height: 40, alignment: .center)
                .offset(x: 210, y: 10)
            
            //bubbles
            Image ("bubbles_1")
                .scaleEffect(0.3)
                .frame(width: 40, height: 40, alignment: .center)
                .offset(x: -210, y: 210)
            
            //swimming brunin
            Gif (resourceName: "swimming_brunin")
                .scaleEffect(0.45)
                .offset (x: 0, y: isAnimation ? 450 : -700)

            //ballon
            Image ("ballon")
                .scaleEffect(0.2)
                .frame(width: 40, height: 40, alignment: .center)
                .offset(x: 240, y: ballonAnimation ? -160 : -140)
                .onTapGesture {
                    showingAlert = true
                } .alert("Brunin swam and swam to the surface.\n\nGo to the next page.", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.default .speed(0.5) .repeatForever(autoreverses: true)) {
                    ballonAnimation.toggle()
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.default .speed(0.05)) {
                    isAnimation.toggle()
                }
            }
            

        }.navigationBarHidden(true)

    }
}

struct SwimmingScene_Preview: PreviewProvider
{
    static var previews: some View {
        SwimmingScene()
    }
}
