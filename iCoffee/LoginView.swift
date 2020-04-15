//
//  LoginView.swift
//  iCoffee
//
//  Created by Chase McElroy on 4/15/20.
//  Copyright © 2020 ChaseMcElroy. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State var showingSignup = false
    @State var showingFinishReg = false
    
    @Environment(\.presentationMode) var presentationMode

    @State var email = ""
    @State var password = ""
    @State var repeatPassword = ""
    var body: some View {
        VStack {
            Text(showingSignup ? "Sign Up" : "Sign In")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .padding([.bottom,.top], 20)
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label))
                        .opacity(0.75)
                    TextField("Enter your email", text: $email)
                    Divider()
                    Text("Password")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label))
                        .opacity(0.75)
                    TextField("Enter your password", text: $password)
                    Divider()
                    
                    if showingSignup {
                        Text("Repeat Password")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(Color.init(.label))
                            .opacity(0.75)
                        TextField("Enter your password", text: $repeatPassword)
                        Divider()
                    }
                }
                .padding(.bottom, 15)
                .animation(.easeOut(duration: 0.3))
                // end of vstack
                HStack {
                    Spacer()
                    Button(action: {
                        self.resetPassword()
                    }) {
                        Text("Forgot Password?")
                            .foregroundColor(Color.gray.opacity(0.5))
                    }
                }
                
                // end of hstack
            }.padding(.horizontal, 6)
            // end of vstack
            
            Button(action: {
                self.showingSignup ? self.signUpUser() : self.loginUser()
            }) {
                Text(showingSignup ? "Sign Up" : "Sign In")
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 120)
                    .padding()
                
            }
            .background(Color.blue)
            .clipShape(Capsule())
            .padding(.top, 45)
            // end of button
            
            SignUpView(showingSignup: $showingSignup)
        } // end of vstack
            .sheet(isPresented: $showingFinishReg) {
                FinishRegistrationView()
        }
    } // end of body
    
    private func loginUser() {
        if email != "" && password != "" {
            FUser.loginUserWidth(email: email, password: password) { (error, isEmailVerified) in
                if error != nil {
                    print("error logging in user: ", error!.localizedDescription)
                    return
                }
                if FUser.currentUser() != nil && FUser.currentUser()!.onBoarding {
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    self.showingFinishReg.toggle()
                }
            }
            
        }

    }
    
    private func signUpUser() {
        if email != "" && password != "" && repeatPassword != "" {
            if password == repeatPassword {
                
                FUser.registerUserWith(email: self.email, password: self.password) { (error) in
                    if error != nil {
                        print("Error registering user: ", error!.localizedDescription)
                        return
                    }
                    print("user has been set up")
                    //
                }

            } else {
                print("Passwords don't match")
            }
        } else {
            print("Email and Password must be set")
        }
        
    }
    
    private func resetPassword() {
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct SignUpView: View {
    @Binding var showingSignup: Bool
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 8) {
                Text("Don't have an account?")
                    .foregroundColor(Color.gray.opacity(0.5))
                Button(action: {
                    self.showingSignup.toggle()
                }) {
                    Text(!showingSignup ? "Sign Up" : "Sign In")
                        .foregroundColor(.blue)
                }
            } // end of hstack
                .padding(.top, 25)
        } // end of vstack
    }
}
