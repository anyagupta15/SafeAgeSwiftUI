import Foundation

struct Page: Identifiable , Equatable{
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(name: "Title Example", description: "This is a sample description for the purpose of debugging", imageUrl: "lab book", tag: 0)
    
    static var samplePages: [Page] = [
    Page(name: "Real time tracking", description: "Track your vitals with us", imageUrl: "vitals", tag: 0),
    Page(name: "Sharing", description: "Share your everyday vitals with your friends and family", imageUrl: "sharing", tag: 1),
    Page(name: "Inteliggent Alerts", description: "Get your intelligent alert when any of the vitals ges above the range with promtable actions such as call the ambulance or call the emergency saved contact.", imageUrl: "alerts", tag: 2),
    ]
}
