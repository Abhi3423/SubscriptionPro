import SwiftUI
import PhotosUI

@available(iOS 17.0, *)
struct SubscriptionCardView: View {
    @Binding var subList: EachSubModel
    
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
            
            HStack(spacing: 20) {
                // Image
                subList.image
                    .resizable()
                    .frame(width: 90, height: 90)
                    .foregroundColor(.blue)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(lineWidth: 2).foregroundColor(.white))
                    .padding(.vertical)
                
                // Content
                VStack(alignment: .leading, spacing: 8) {
                    Text(subList.subname)
                        .font(.title2)
                        .bold()
                    
                    HStack(spacing: 8) {
                        Text("Started on:")
                        Text(subList.startdate, style: .date).font(.footnote)
                    }
                    HStack(spacing: 8) {
                        Text("Ends on:")
                        Text(subList.enddate, style: .date).font(.footnote)
                    }
                    
                    HStack(spacing: 1) {
                        // Cost
                        Text("$" + subList.cost)
                            .font(.title3)
                            .foregroundColor(.green)
                        
                        // Reminder toggle
                        //                        Toggle("", isOn: $subList.isRemind)
                        //                            .tint(.green)
                        
                    }
                }
            }
            .padding(.vertical)
            .padding(.horizontal)
            .frame(width: 350)
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(12)
            .shadow(color: Color.gray.opacity(0.2), radius: 5)
            
        }
    }
    
}

@available(iOS 17.0, *)
struct SubscriptionList: View {

    @Binding var subscriptionList:  SubList
    @State var isOpen = false
    @State private var subscriptionName = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var duration = 1
    @State private var cost = ""
    @State private var isReminderEnabled = false
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    @State private var isSubmitted = false
    @State private var localList = SubList.example

    var body: some View {
        
        VStack{
            VStack{
                HStack{
                    Spacer()
                    Text("Your Subscriptions")
                        .font(.custom("Fixel Display Semi Bold", size: 26))
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    
                    Spacer()
                    
                    Button(action: {
                        // Set isOpen to true to present the sheet
                        isOpen = true
                        isSubmitted = false
                        subscriptionName = ""
                        startDate = Date()
                        endDate = Date()
                        cost = ""
                        isReminderEnabled = false
                        selectedImage = nil
                    }) {
                        Image("add")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    .sheet(isPresented: $isOpen) {
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
                                            // Create a new instance of EachSubModel
                                            let newSubscription = EachSubModel(subname: subscriptionName, startdate: startDate, enddate: endDate, image: selectedImage!, cost: cost)
                                            
                                            print(localList)
                                            localList.dataList.append(newSubscription)
                                            
                                            // Now subList.dataList contains the new subscription
                                            print(localList)
                                            isOpen = false
                                            
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
                                            isOpen = false
                                        }) {
                                            Text("Show My Subscriptions")
                                                .foregroundColor(.green)
                                                .padding()
                                                .bold()
                                                .font(.custom("Fixel Display Semi Bold", size: 20))
                                                .cornerRadius(10)
                                                .frame(width: 300, height: 50)
                                            
                                        }.padding()
                                    }
                                    
                                    Spacer()
                                }
                                .padding()
                            }
                        }
                    }
                }
                
            }.padding(.horizontal).background(Color.black)
            ScrollView{
                VStack{
                    ForEach($localList.dataList) { $subsList in
                        SubscriptionCardView(subList: $subsList)
                    }
                }.background(Color.black)
            }
            
        }.background(Color.black).navigationBarBackButtonHidden(true)

    }
    
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
//            if granted {
//                print("Notifications authorization granted")
//            } else {
//                print("Notifications authorization denied")
//            }
//        }
//        
//        return true
//    }
    
}

@available(iOS 17.0, *)
struct SubscriptionList_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionList(subscriptionList: .constant(SubList.example))
    }
}
