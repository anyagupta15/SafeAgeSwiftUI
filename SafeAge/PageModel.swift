import Combine
import SwiftUI

struct Page: Identifiable , Equatable{
    

    
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int// Use PassthroughSubject for skip action

    static var samplePage = Page(name: "Title Example", description: "This is a sample description for the purpose of debugging", imageUrl: "lab book", tag: 0)

    
    static var samplePages: [Page] = [
        Page(name: "Real time tracking", description: "Track your vitals with us.", imageUrl: "vitals", tag: 0 ),
        Page(name: "Sharing", description: "Share your everyday vitals with your friends and family.", imageUrl: "sharing", tag: 1),
        Page(name: "Intelligent Alerts", description: "Receive intelligent alerts for abnormal vitals and take prompt actions for your health.", imageUrl: "Alert 1", tag: 2),
    ]
}
