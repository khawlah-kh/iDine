//
//  ContentView.swift
//  iDine
//
//  Created by khawlah khalid on 19/03/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
       MenuView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
        OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")                }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
