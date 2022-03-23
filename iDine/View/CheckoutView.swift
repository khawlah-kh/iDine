//
//  CheckoutView.swift
//  iDine
//
//  Created by khawlah khalid on 23/03/2022.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order : Order
    @State private var paymentType = PaymentType.cash
    @State private var addLoyaltyDetails = false
   @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    let tipAmounts = [10, 15, 20, 25, 0]
    let paymentTypes : [PaymentType]=[.cash,.creditCard,.iDinePoints]
    
    var body: some View {
        Form{
            Section{
                Picker("Payment Method", selection:$paymentType){
                    ForEach(paymentTypes, id: \.self) {
                        Text($0.rawValue) }
                }
                Toggle("Add iDine loyalty card", isOn:
                $addLoyaltyDetails.animation())
                if addLoyaltyDetails{
               TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
          
         
            }
            
            Section(header: Text("Add a tip?")) {
               Picker("Percentage:", selection: $tipAmount) {
                  ForEach(tipAmounts, id: \.self) {
                     Text("\($0)%")
            } }
               .pickerStyle(.segmented)
            }
            
            Section(header:
               Text("TOTAL: $100")
            ){
            Button("Confirm order") {
                  // place the order
            } }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        CheckoutView()
        }
    }
}
