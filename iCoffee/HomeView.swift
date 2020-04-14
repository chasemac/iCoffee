//
//  ContentView.swift
//  iCoffee
//
//  Created by Chase McElroy on 4/14/20.
//  Copyright © 2020 ChaseMcElroy. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView {
            
            Text("Hi")
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
