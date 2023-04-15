import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
              Onboarding()
            }
            .navigationViewStyle(.stack)

        }
    }
}
