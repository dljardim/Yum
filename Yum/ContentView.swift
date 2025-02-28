//
//  ContentView.swift
//  Yum
//
//  Created by Damian Jardim on 2/27/25.
//

import SwiftUI

struct ContentView: View {
        
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(menu){ section in
                    Text(section.name)
                    
                    ForEach(section.items){ item in
                        Text(item.name)
                    }
                }
            }
        }
    }
    
}


#Preview {
    ContentView()
}
