//
//  ContentView.swift
//  Learning App
//
//  Created by Uday Sidhu on 27/01/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("First Commit!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
