//
//  ContentView.swift
//  Shared
//
//  Created by Yogesh Singh on 06/01/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello World")
                NavigationLink(destination: DetailView()) {
                    Text("Do Something")
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
