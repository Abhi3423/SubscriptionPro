import SwiftUI

@available(iOS 17.0, *)
struct ContentView: View {
    @State private var isShowing = true
    @State private var shouldAnimate = false
    @State private var isTrue = true
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                
                VStack {
                    // First Section
                    ZStack{
                        
                        Image("bg")
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 1000, height: 200)
                            .edgesIgnoringSafeArea(.all)
                        
                        ZStack {
                            
                            VStack {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color(hex: "B2F042"), lineWidth: 10)
                                    
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.white)
                                        .overlay(
                                            Text("SUBSCRIPTION")
                                                .fontWeight(.bold)
                                                .foregroundColor(.black)
                                                .font(.title)
                                                .multilineTextAlignment(.center)
                                                .tracking(4)
                                                .padding()
                                        )
                                }
                                .frame(width: 357, height: 80)    .rotationEffect(Angle.degrees(-10))
                                .padding(.bottom, 60.0)
                                
                                
                                if shouldAnimate {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color(hex: "B286FD"), lineWidth: 10)
                                        
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.white)
                                            .overlay(
                                                Text("TRACKER")
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.black)
                                                    .font(.title)
                                                    .multilineTextAlignment(.center)
                                                    .tracking(4)
                                                    .padding()
                                            )
                                    }
                                    .frame(width: 285, height: 75)
                                    .transition(.move(edge: .top))
                                    .animation(.interpolatingSpring(stiffness: 50, damping: 15, initialVelocity: 2))
                                }
                                
                                
                            }
                            
                            Image("stars")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 400, height: 400)
                                .clipped()
                            
                            if isShowing {
                                Image("stars")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 400, height: 400)
                                    .blur(radius: 6.0)
                                    .clipped()
                                    .transition(.opacity) // Apply transition for fade in and out
                            }
                        }
                        .padding()
                    }
                    
                    
                    
                    // Second Section
                    ZStack {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(hex: "#B2F042"))
                            .frame(width: 170, height: 25)
                            .overlay(
                                Text("Subscription Tracker")
                                    .foregroundColor(.black)
                                    .font(Font.system(size: 13, weight: .bold))
                                    .bold()
                                    .padding()
                            )
                            .offset(x: -112)
                        HStack{
                            Text("Track.")
                                .foregroundColor(.black)
                                .offset(x: -3, y: -1)
                                .overlay(
                                    Text("Track.")
                                        .foregroundColor(Color(hex: "#E55733"))
                                )
                            Text("Manage.")
                                .foregroundColor(.black)
                                .offset(x: -3, y: -1)
                                .overlay(
                                    Text("Manage.")
                                        .foregroundColor(Color.white)
                                )
                            Text("Enjoy.")
                                .foregroundColor(.black)
                                .offset(x: -3, y: -1)
                                .overlay(
                                    Text("Enjoy.")
                                        .foregroundColor(Color(hex: "#B286FD"))
                                )
                        }
                        .font(Font.system(size: 40, weight: .bold))
                        .shadow(color: .black, radius: 1)
                        .offset(y: 25)
                        
                    }
                    .padding(.bottom, 22.0)
                    
                    
                    // Third Section
                    VStack {
                        VStack{
                            Text("Welcome to Your")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            
                            Text("Subscription Tracker!")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                        .font(Font.system(size: 18, weight: .bold))
                        .padding()
                        
                            
                        NavigationLink {
                                ProfileContainer()
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(hex: "#B2F042"))
                                    .frame(width: 300, height: 50)
                                    .overlay(Text("Let's Start!")
                                        .foregroundColor(.black)
                                        .padding()
                                        .bold()
                                        .cornerRadius(10))
                            }
                        
                    }
                    .padding()
                }
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                    withAnimation {
                        self.isShowing.toggle()
                        self.shouldAnimate = true
                    }
                }
            }
        }
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}



@available(iOS 17.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

