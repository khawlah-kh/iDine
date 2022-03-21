//
//  iDineApp.swift
//  iDine
//
//  Created by khawlah khalid on 19/03/2022.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
        }
    }
}
