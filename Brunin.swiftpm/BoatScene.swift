
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
                .offset(x: -250, y: -150)
            
            //second cloud
            Image ("cloud_2")
                .scaleEffect(0.4)
                .frame(width: 40, height: 40, alignment: .center)
                .offset(x: 120, y: -100)

            //snake
            Image ("snake")
                .scaleEffect(0.12)
                .position(x: 200, y: 720)
            
            //right button
                NavigationLink(destination: SwimmingScene(), label: {
                    Image ("right")
                        .scaleEffect(0.3)
                        .frame(width: 40, height: 40, alignment: .center)
                })
                .offset(x: 350, y: -420)
            
            //ballon
            Image ("ballon")
                .scaleEffect(0.13)
                .frame(width: 40, height: 40, alignment: .center)
                .offset(x: -200, y: ballonAnimation ? 40 : 20)
                .onTapGesture {
                    showingAlert = true
                }
                .alert("Friend Bruninho's trip is going very well. Getting close to the place, the boat hit a rock causing chaos for all the passengers.\n\nGo to the next page.", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                    
                }
            
            //screaming_brunin
            Gif (resourceName: "screaming_brunin")
                .scaleEffect(0.2)
                .position(x: isAnimation ? -120 : 950, y: 940)
            
            
            //boat
            Image ("floating")
                .scaleEffect(0.12)
                .position(x: isAnimation ? -100 : 1000, y: 950)
            
            //rock
            Image ("rock")
                .scaleEffect(0.9)
                .position(x: 750, y: 950)
            
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
