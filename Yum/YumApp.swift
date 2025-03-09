//
//  YumApp.swift
//  Yum
//
//  Created by Damian Jardim on 2/27/25.
//

import SwiftUI

@main
struct YumApp: App {
    // keeps order in memory no matter what view is being shown
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}



