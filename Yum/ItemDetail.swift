//
//  ItemDetail.swift
//  Yum
//
//  Created by Damian Jardim on 3/4/25.
//

import SwiftUI

struct ItemDetail: View {
    
    let item: MenuItem
    
    // similar to an optional
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
                    
                    
            }
            
            Text("description: \(item.description)")
                .padding()
        }
        .navigationTitle(item.name)
         .onAppear{logMe()}
        
        Button("Order This"){
            order.add(item: item)
        }
        .buttonStyle(.borderedProminent)
        
        Spacer()
    }
    
    func logMe(){
        print("ItemDetail loaded: \(item.name)")
    }
    
        
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ItemDetail(item: MenuItem.example).environmentObject(Order())
        }
    }
}
