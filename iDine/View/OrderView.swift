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
            {
                EmptyCart()
            }
            
         else {
                List {
                    Section {
                        ForEach(order.items) { item in
                            HStack {
                                Text(item.name)
                                Spacer()
                                Text("$\(item.price)")
                            }
                            
                        }
                    }
                    Section {
                        NavigationLink(destination: Text("Check out")) {
                            Text("Place Order")
                        }
                    }
                    
                }
            .listStyle(.insetGrouped)
            }
        }
         .navigationTitle("Order")
  
        
        }
        
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
