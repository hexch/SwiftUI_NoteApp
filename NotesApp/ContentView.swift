//
//  ContentView.swift
//  NotesApp
//
//  Created by XIAOCHUAN HE on R 5/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
