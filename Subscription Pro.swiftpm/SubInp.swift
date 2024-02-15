import SwiftUI
import PhotosUI

@available(iOS 17.0, *)
struct SubscriptionFormView: View {
    @State private var subscriptionName = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var duration = 1
    @State private var cost = ""
    @State private var isReminderEnabled = false
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    @State private var isSubmitted = false
    
    @Binding var subLists: SubList
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    
                    
                    VStack {
                        if let image = selectedImage {
                            image
                                .resizable()
                                .scaledToFit()
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .padding()
                                .background()
                        }
                        PhotosPicker("Select a picture", selection: $pickerItem, matching: .images)
                    }
                    .onChange(of: pickerItem) { newValue in
                        Task {
                            selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
                        }
                    }
                    
                    
                    // Subscription Name
                    TextField("", text: $subscriptionName, prompt: Text("Subscription Name").foregroundColor(.white.opacity(0.8)))
                        .padding()
                        .background(Color(#colorLiteral(red: 0.09166666865348816, green: 0.09166666865348816, blue: 0.09166666865348816, alpha: 1)))
                        .cornerRadius(8)
                        .foregroundColor(Color.white)
                    
                    
                    // Start Date
                    DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                        .padding()
                        .background(Color(#colorLiteral(red: 0.09166666865348816, green: 0.09166666865348816, blue: 0.09166666865348816, alpha: 1)))
                        .cornerRadius(8)
                        .colorScheme(.dark)
                        .foregroundColor(Color.white)
                    
                    
                    // End Date
                    DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                        .padding()
                        .background(Color(#colorLiteral(red: 0.09166666865348816, green: 0.09166666865348816, blue: 0.09166666865348816, alpha: 1)))
                        .cornerRadius(8)
                        .colorScheme(.dark)
                        .foregroundColor(Color.white)
                    
                    
                    // Cost
                    TextField("Cost", text: $cost, prompt: Text("Cost").foregroundColor(.white.opacity(0.8)))
                        .padding()
                        .background(Color(#colorLiteral(red: 0.09166666865348816, green: 0.09166666865348816, blue: 0.09166666865348816, alpha: 1)))
                        .cornerRadius(8)
                        .foregroundColor(Color.white)
                    
                    
                    // Reminder
                    Toggle("Reminder", isOn: $isReminderEnabled)
                        .padding()
                        .foregroundColor(.white)
                    
                    if(isSubmitted == false){
                        
                        // Done Button
                        Button{
//                            subLists.dataList[0] = (EachSubModel(subname: subscriptionName, startdate: startDate, enddate: endDate, image: Image("\($selectedImage)"), cost: cost))
                            print("Updated subLists: \(subLists)")
                            isSubmitted = true
                            
                            
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(#colorLiteral(red: 0.6980392157, green: 0.9411764706, blue: 0.2588235294, alpha: 1)))
                                .frame(width: 300, height: 50)
                                .overlay(
                                    Text("Done!")
                                        .foregroundColor(.black)
                                        .padding()
                                        .bold()
                                        .cornerRadius(10)
                                )
                        }.padding()
                    }else{
                        
                        //Submitted Button
                        Button(action: {
                            
                        }) {
                               Text("Submitted Successfully")
                                        .foregroundColor(.green)
                                        .padding()
                                        .bold()
                                        .font(.custom("Fixel Display Semi Bold", size: 20))
                                        .cornerRadius(10)
                                        .frame(width: 300, height: 50)
                                
                        }.padding()
                        
                        NavigationLink(
                            destination: SubscriptionList(subscriptionList: .constant(SubList.example)),
                            label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(#colorLiteral(red: 0.6980392157, green: 0.9411764706, blue: 0.2588235294, alpha: 1)))
                                    .frame(width: 300, height: 50)
                                    .overlay(
                                        Text("View all Subscriptions")
                                            .foregroundColor(.black)
                                            .padding()
                                            .bold()
                                            .cornerRadius(10)
                                    )

                        })
                    }

                    Spacer()
                }
                .padding()
            }
        }
    }
}

//@available(iOS 17.0, *)
//struct SubscriptionFormView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubscriptionFormView(subLists: .constant(SubList.example))
//    }
//}
