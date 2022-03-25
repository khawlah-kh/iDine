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
    @State private var showingPaymentAlert = false
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
                        Text("TOTAL: \(totalPrice)")
            ){
                Button("Confirm order") {
                    showingPaymentAlert.toggle()
                } }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Your total was \(totalPrice) – thank you!"),
                  dismissButton: .default(Text("OK")))
        }
    }
    
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        
        return formatter.string(from: NSNumber(value: total +
                                               tipValue)) ?? "$0"
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CheckoutView()
        }
    }
}
