//
//  OrderView.swift
//  iDine
//
//  Created by khawlah khalid on 21/03/2022.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order : Order
    var body: some View {
        NavigationView {
            VStack{
                if order.items.isEmpty
                { EmptyCart() }
                else {
                    List {
                        Section {
                            ForEach(order.items) { item in
                                HStack {
                                    Text(item.name)
                                    Spacer()
                                    Text("$\(item.price)")
                                }
                                
                            } .onDelete(perform: deleteItems)
                        }
                        Section {
                            NavigationLink(destination: CheckoutView()) {
                                Text("Place Order")
                            }
                        }
                        
                    }
                    .listStyle(.insetGrouped)
                    .toolbar {
                        EditButton()
                    }
                }
            }
            .navigationTitle("Order")
            
            
        }
        
    }
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
    
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}

struct EmptyCart: View {
    var body: some View {
        Image("empty_cart")
            .resizable()
            .scaledToFit()
    }
}
