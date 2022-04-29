
import Foundation
import SwiftUI
import AVKit

struct BoatScene: View {
    
    @State var isAnimation: Bool = true
    @State var ballonAnimation: Bool = false
    @State private var showingAlert = false
    
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
            
            //snake
            Image ("snake")
                .scaleEffect(0.12)
                .position(x: 470, y: 720)
            
            //snake
            Image ("ballon")
                .scaleEffect(0.13)
                .frame(width: 40, height: 40, alignment: .center)
                .offset(x: 70, y: ballonAnimation ? 40 : 20)
                .onTapGesture {
                    showingAlert = true
                } .alert("Our friend Brunin's trip was going very well, until a huge boulder caused panic and chaos for all passengers.\n\nGo to the next page.", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
            }
            
            //screaming_brunin
            Gif (resourceName: "screaming_brunin")
                .scaleEffect(0.2)
                .position(x: isAnimation ? -120 : 950, y: 840)
            
            
            //boat
            Image ("floating")
                .scaleEffect(0.12)
                .position(x: isAnimation ? -100 : 1000, y: 850)
            
            //right button
                NavigationLink(destination: SwimmingScene(), label: {
                    Image ("right")
                        .scaleEffect(0.3)
                        .frame(width: 40, height: 40, alignment: .center)
                })
                .offset(x: 350, y: -420)
            
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.default .speed(0.3) .repeatForever(autoreverses: true)) {
                    ballonAnimation.toggle()
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.default .speed(0.05)) {
                    isAnimation.toggle()
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct BoatScene_Preview: PreviewProvider
{
    static var previews: some View {
        BoatScene()
    }
}
