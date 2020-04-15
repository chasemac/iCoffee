//
//  FinishRegistrationView.swift
//  iCoffee
//
//  Created by Chase McElroy on 4/15/20.
//  Copyright © 2020 ChaseMcElroy. All rights reserved.
//

import SwiftUI

struct FinishRegistrationView: View {
    
    @State var name = ""
    @State var lastName = ""
    @State var telephone = ""
    @State var address = ""
    
    var body: some View {
        Form {
            Section() {
                Text("Finish Registration")
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .padding([.top, .bottom], 20)
                TextField("Name", text: $name)
                TextField("Last Name", text: $lastName)
                TextField("Telephone", text: $telephone)
                TextField("Address", text: $address)

            } // end of section
            
            Section() {
                Button(action: {
                    self.finishRegistration()
                }) {
                    Text("Finish Registration")
                }
            }.disabled(!self.fieldsCompleted())
            
            
        } // end of form
    } // end of body
    
    private func fieldsCompleted() -> Bool {
        return self.name != "" && self.lastName != "" && self.telephone  != "" && self.address != ""
    }
    
    private func finishRegistration() {
        
    }
}

struct FinishRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        FinishRegistrationView()
    }
}
