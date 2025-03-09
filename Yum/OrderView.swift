//
//  OrderView.swift
//  Yum
//
//  Created by Damian Jardim on 3/4/25.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                    ForEach(order.items){item in
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                }
                
                Section {
                    NavigationLink("Place Order"){
                        CheckoutView()
                    }
                }
            }
            .navigationTitle("Order")
        }
    }
}



