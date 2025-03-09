//
//  CheckoutView.swift
//  Yum
//
//  Created by Damian Jardim on 3/7/25.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    
    @State private var paymentType = "Cash"
    let paymentTypes = ["Cash", "Credit Card", "Yum Points"]
    
    @State private var addLoytaltyDetails = false
    @State private var loyaltyNumber = ""
    
    let tipAmounts = [10, 15, 20, 25, 0]
    @State private var tipAmount = 15
    
    @State private var showingPaymentAlert = false
    
    var totalPrice:String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    

    var body: some View {
        Form{
            Section{
                Picker("Payment", selection: $paymentType){
                    ForEach(paymentTypes, id: \.self){
                        Text($0)
                    }
                }
                
                Toggle("Add Yump loyalty card", isOn: $addLoytaltyDetails.animation())
                
                if(addLoytaltyDetails){
                    TextField("Enter your Yum ID", text: $loyaltyNumber)
                }
            }
            
            Section("Add a tip?"){
                Picker("Percentages:", selection: $tipAmount){
                    ForEach(tipAmounts, id: \.self){
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Total: \(totalPrice)"){
                Button("Confirm order"){
                    print("click")
                    showingPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order confirmed", isPresented: $showingPaymentAlert){
            // add buttons here
        } message: {
            Text("Your total was \(totalPrice) - thank you!")
        }

    }
}

struct CheckoutView_Previews: PreviewProvider{
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
            .preferredColorScheme(.dark)

    }
}

