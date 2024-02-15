import Foundation
import SwiftUI
import UserNotifications

struct SubList: Identifiable {
    let id = UUID()
    var dataList = [EachSubModel]()
}

extension SubList {
    static var example: SubList {
        SubList(dataList: [EachSubModel.example])
    }
}

//var exampleLists: [SubList] {
//        var out = [SubList]()
//        out.append(SubList(name: "Reminders", dataList: [EachSubModel.example]))
//        return out
//    }




class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notifications authorization granted")
            } else {
                print("Notifications authorization denied")
            }
        }

        return true
    }
}

