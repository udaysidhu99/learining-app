//
//  Learning_AppApp.swift
//  Learning App
//
//  Created by Uday Sidhu on 27/01/23.
//

import SwiftUI

@main
struct Learning_AppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(ContentModel())
        }
    }
}
