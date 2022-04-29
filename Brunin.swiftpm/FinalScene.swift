
import Foundation
import SwiftUI
import AVKit

struct FinalScene: View {
    @State var ballonAnimation: Bool = false
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
            Color("blue_sky").ignoresSafeArea()
            
            HStack {
                //island
                Image ("final")
                    .scaleEffect(0.9)
                    .frame(width: 40, height: 40, alignment: .center)
                    .offset(x: 80, y: 20)
                
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
                .offset(x: -120, y: -400)
            
            //talking brunin
            Gif (resourceName: "talking_brunin")
                .scaleEffect(0.28)
                .position(x: 400, y: 675)
            
            //ballon
            Image ("ballon")
                .scaleEffect(0.13)
                .frame(width: 40, height: 40, alignment: .center)
                .offset(x: 0, y: ballonAnimation ? -80 : -50)
                .onTapGesture {
                    showingAlert = true
                }
                .alert("In the end, I made it safely to the surface and now I'm with you as your ambassador.\n\nHappy ending!", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                
                }
                    
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                withAnimation(.default .speed(0.3) .repeatForever(autoreverses: true)) {
                                    ballonAnimation.toggle()
                                }
                            }
                        }
            
            //main button
                NavigationLink(destination: MainScreen(), label: {
                    Image ("main")
                        .scaleEffect(0.25)
                        .frame(width: 40, height: 40, alignment: .center)
                })
                .offset(x: 30, y: 400)
            
        } .navigationBarHidden(true)
    }
}

struct FinalScene_Preview: PreviewProvider
{
    static var previews: some View {
        FinalScene()
    }
}
