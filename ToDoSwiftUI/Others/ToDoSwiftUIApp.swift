import SwiftUI
import FirebaseCore

@main
struct ToDoSwiftUIApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
