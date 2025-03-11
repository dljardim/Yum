//
//  OrderView.swift
//  Yum
//
//  Created by Damian Jardim on 3/4/25.
//

import SwiftUI

struct OrderView: View {
    
    func deleteItems(at offsets: IndexSet){
        order.items.remove(atOffsets: offsets)
    }
    
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
                    .onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink("Place Order"){
                        CheckoutView()
                    }
                }
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("Order")
            .toolbar{
                EditButton()
            }
        }
    }
}



