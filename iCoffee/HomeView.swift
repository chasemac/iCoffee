//
//  ContentView.swift
//  iCoffee
//
//  Created by Chase McElroy on 4/14/20.
//  Copyright © 2020 ChaseMcElroy. All rights reserved.
//

import SwiftUI


struct HomeView: View {
    
    var categories: [String : [Drink]] {
        .init(grouping: drinkData,
              by: {$0.category.rawValue}
        )
    }
    
    var body: some View {
        NavigationView {
            List(categories.keys.sorted(), id: \String.self) { key in
                DrinkRow(categoryName: "\(key) Drink".uppercased(), drinks: self.categories[key]!)
                    .frame(height: 320)
                    .padding(.top)
                    .padding(.bottom)
                
            }
            .navigationBarTitle(Text("iCoffee"))
            .navigationBarItems(leading:
                Button(action: {
                    //code
                    print("Log out")
                }, label: {
                    Text("Log Out")
                })
                
                , trailing:
                Button(action: {
                    //code
                    print("Check out")
                }, label: {
                    Image("basket")
                })
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}