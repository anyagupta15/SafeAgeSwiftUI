import SwiftUI

struct ContentView: View {
    @State private var pageIndex = 0
    @State private var showingNextScreen = false
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()

    var body: some View {
        NavigationView {
            TabView(selection: $pageIndex) {
                ForEach(pages) { page in
                    VStack {
                        Spacer()
                        PageView(page: page)
                        Spacer()

                        if page == pages.last {
                            Button("Sign up", action: {
                                showingNextScreen.toggle()
                            })
                            .foregroundColor(.white)
                            .frame(width: 201, height: 44)
                            .background(Color.blue)
                            .cornerRadius(10)

                            NavigationLink(destination: LoginView(), isActive: $showingNextScreen) {
                                EmptyView()
                            }
                        } else {
                            Button("SKIP", action: {
                                // showNextScreen.toggle()
                                // ^ This line was causing an issue, commented it out
                                showingNextScreen.toggle()
                            })
                            .foregroundColor(.blue)
                            .frame(width: 40, height: 44)
                            .background(Color.white)
                            .cornerRadius(10)

                            NavigationLink(destination: LoginView(), isActive: $showingNextScreen) {
                                EmptyView()
                            }
                        }

                        Spacer()
                    }
                    .tag(page.tag)
                }
            }
            .animation(.easeInOut, value: pageIndex)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            .onAppear {
                dotAppearance.currentPageIndicatorTintColor = .black
                dotAppearance.pageIndicatorTintColor = .gray
            }
        }
    }
}



