//
//  MenuView.swift
//  iDine
//
//  Created by khawlah khalid on 21/03/2022.
//

import SwiftUI

struct MenuView: View {
    let menu = Bundle.main.decode([MenuSection].self, from:"menu.json")
    var body: some View {
        NavigationView{
            List(menu,id:\.id){ section in
                Section(header: Text("\(section.name)")){
                    ForEach(section.items,id:\.id){ item in
                        NavigationLink {
                            ItemDetail(item: item)
                        } label: {
                            ItemRow(item: item)
                        }
                        
                    }
                    
                }
                
            }
            .listStyle(.grouped)
            .navigationTitle("Menu")
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
