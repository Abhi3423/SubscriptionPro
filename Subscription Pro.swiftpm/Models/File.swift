import SwiftUI
import Foundation

struct EachSubModel: Identifiable {
    let id = UUID()
    var subname: String
    var startdate: Date
    var enddate: Date
    var isRemind = false
    var image: Image
    var cost: String
}

extension EachSubModel {
    static var example: EachSubModel {
        EachSubModel(
            subname: "New Platform",
            startdate: Date(),
            enddate: Date(),
            isRemind: true,
            image: Image("netflix"),
            cost: "29.99"
        )
    }
}
