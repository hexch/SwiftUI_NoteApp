//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by XIAOCHUAN HE on R 5/03/22.
//

import SwiftUI

@main
struct NotesAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }
#if os(macOS)
        .windowStyle(HiddenTitleBarWindowStyle())
#endif
    }
}
