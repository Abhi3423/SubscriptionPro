
import SwiftUI



@available(iOS 17.0, *)
struct ProfileContainer: View {
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                VStack{
                    Text("Your All Platform Info at one Place!!")
                        .font(.custom("Fixel Display Semi Bold", size: 20))
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .padding(.bottom,30.0)
                    VStack {
                        ProfileComponent(imageName: "prime", name: "Amazon Prime Video") {
                            addTapped(name: "Amazon Prime", imageName: "prime")
                        }
                        
                        ProfileComponent(imageName: "netflix", name: "Netflix") {
                            addTapped(name: "Netflix", imageName: "netflix")
                        }
                        
                        ProfileComponent(imageName: "sony", name: "SonyLiv") {
                            addTapped(name: "SonyLiv", imageName: "sony")
                        }
                        
                        ProfileComponent(imageName: "voot", name: "Voot") {
                            addTapped(name: "Voot", imageName: "voot")
                        }
                        
                        ProfileComponent(imageName: "disney", name: "Disney+") {
                            addTapped(name: "Disney+", imageName: "disney")
                        }
                    }.padding(.bottom, 30.0)
                    
                    
                    NavigationLink(
                        destination: SubscriptionList(subscriptionList: .constant(SubList.example)),
                        label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(#colorLiteral(red: 0.09166666865348816, green: 0.09166666865348816, blue: 0.09166666865348816, alpha: 1)))
                                .frame(width: 360, height: 71)
                            HStack {
                                Image("add")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                Spacer()
                                Text("Show All Subscriptions")
                                    .font(.custom("Fixel Display Semi Bold", size: 20))
                                    .foregroundColor(Color(#colorLiteral(red: 0.7, green: 0.94, blue: 0.26, alpha: 1)))
                                    .offset(x:-20)
                            }
                            .padding(.horizontal, 40)
                        }

                    })
                    
//                    Button(action: {
//                        addTapped(name: "", imageName: "")
//                    }) {
//                    }

                    
                    Spacer()
                    
                }
            }
            
        }
        
    }
    
    func addTapped(name: String, imageName: String) {
        // Perform action when add button is tapped for each profile
        print("Add button tapped for \(name) with image \(imageName)")
    }
}


@available(iOS 17.0, *)
struct ProfileComponent: View {
    let imageName: String
    let name: String
    let onAddTapped: () -> Void
    
    var body: some View {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(#colorLiteral(red: 0.09166666865348816, green: 0.09166666865348816, blue: 0.09166666865348816, alpha: 1)))
                    .frame(width: 360, height: 71)
                
                HStack {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 5.49))
                        .frame(width: 50, height: 50)
                    
                    Spacer()
                    
                    Text(name)
                        .font(.custom("Fixel Display Semi Bold", size: 16))
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    
                    Spacer()
                    
                    Button(action: {
                        onAddTapped()
                    }) {
                        Image("add")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
                .padding(.horizontal, 40)
            }.padding(.bottom,10.0)
            
    }
}

