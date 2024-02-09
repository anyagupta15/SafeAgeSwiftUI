import SwiftUI

struct HeartRateHistoryView: View {
    struct HeartRateEntry {
        let time: String
        let rate: Double
    }

    let todaysHeartRateData: [HeartRateEntry] = [
        HeartRateEntry(time: "8 AM", rate: 72),
        HeartRateEntry(time: "12 PM", rate: 80),
        HeartRateEntry(time: "6 PM", rate: 92),
        HeartRateEntry(time: "10 PM", rate: 78),
    ]

    let weeklyHeartRateData: [HeartRateEntry] = [
        HeartRateEntry(time: "Mon", rate: 70),
        HeartRateEntry(time: "Tue", rate: 72),
        HeartRateEntry(time: "Wed", rate: 75),
        HeartRateEntry(time: "Thu", rate: 78),
        HeartRateEntry(time: "Fri", rate: 80),
        HeartRateEntry(time: "Sat", rate: 85),
        HeartRateEntry(time: "Sun", rate: 88),
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    Text("Today's Heart Rate").font(.title).bold()

                    TodayHeartRateGraph(data: todaysHeartRateData)
                        .frame(height: 200)

                    HStack(spacing: 0) {
                        ForEach(todaysHeartRateData, id: \.time) { entry in
                            Text(entry.time)
                                .frame(width: UIScreen.main.bounds.width / CGFloat(todaysHeartRateData.count), alignment: .center)
                        }
                    }
                    .padding(.horizontal)

                    Text("Weekly Heart Rate").font(.title).bold()

                    WeeklyHeartRateGraph(data: weeklyHeartRateData)
                        .frame(height: 200)

                    HStack(spacing: 0) {
                        ForEach(weeklyHeartRateData, id: \.time) { entry in
                            Text(entry.time)
                                .frame(width: UIScreen.main.bounds.width / CGFloat(weeklyHeartRateData.count), alignment: .center)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding()
                .navigationBarTitle("Heart Rate History", displayMode: .inline)
            }
        }
    }
}

struct TodayHeartRateGraph: View {
    let data: [HeartRateHistoryView.HeartRateEntry]

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let minY = data.map { $0.rate }.min() ?? 0
                let maxY = data.map { $0.rate }.max() ?? 100

                for i in 0..<data.count {
                    let x = CGFloat(i) * geometry.size.width / CGFloat(data.count - 1)
                    let y = (1 - CGFloat((data[i].rate - minY) / (maxY - minY))) * geometry.size.height

                    if i == 0 {
                        path.move(to: CGPoint(x: x, y: y))
                    } else {
                        path.addLine(to: CGPoint(x: x, y: y))
                    }
                }
            }
            .stroke(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.blue.opacity(0.3)]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
        }
        .padding(.horizontal)
    }
}

struct WeeklyHeartRateGraph: View {
    let data: [HeartRateHistoryView.HeartRateEntry]

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let minY = data.map { $0.rate }.min() ?? 0
                let maxY = data.map { $0.rate }.max() ?? 100

                for i in 0..<data.count {
                    let x = CGFloat(i) * geometry.size.width / CGFloat(data.count - 1)
                    let y = (1 - CGFloat((data[i].rate - minY) / (maxY - minY))) * geometry.size.height

                    if i == 0 {
                        path.move(to: CGPoint(x: x, y: y))
                    } else {
                        path.addLine(to: CGPoint(x: x, y: y))
                    }
                }
            }
            .stroke(LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.7), Color.green.opacity(0.3)]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
        }
        .padding(.horizontal)
    }
}

struct HeartRateHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HeartRateHistoryView()
    }
}

