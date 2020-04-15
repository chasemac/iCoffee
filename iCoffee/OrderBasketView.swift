//
//  OrderBasketView.swift
//  iCoffee
//
//  Created by Chase McElroy on 4/14/20.
//  Copyright © 2020 ChaseMcElroy. All rights reserved.
//

import SwiftUI

struct OrderBasketView: View {
    @ObservedObject var basketListener = BasketListener()
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(self.basketListener.orderBasket?.items ?? []) {
                        drink in
                        HStack {
                            Text(drink.name)
                            Spacer()
                            Text("$\(drink.price.clean)")
                        } // End of HStack
                    } // End of ForEach
                        .onDelete { (indexSet) in
                            self.deleteItems(at: indexSet)
                    }
                }
                Section {
                    NavigationLink(destination: HomeView()) {
                        Text("Place Order")

                    }
                }
                .disabled(self.basketListener.orderBasket?.items.isEmpty ?? true)
            } // End of list
            .navigationBarTitle("Order")
            .listStyle(GroupedListStyle())
        } // end of navigation view
    }
    
    func deleteItems(at offsets: IndexSet) {
        self.basketListener.orderBasket.items.remove(at: offsets.first!)
        self.basketListener.orderBasket.saveBasketToFirestore()
    }
}

struct OrderBasketView_Previews: PreviewProvider {
    static var previews: some View {
        OrderBasketView()
    }
}
