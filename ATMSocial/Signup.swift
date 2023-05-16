//
//  Signup.swift
//  atmsocial
//
//  Created by Ali Alchikh Ibrahim on 4/24/23.
//

import SwiftUI

struct SignUp: View {
    @State var username = ""
    @State var fullName = ""
    @State var email = ""
    @State private var password = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Sign Up")
                    .font(.custom("American Typewriter", size: 25))
                
                VStack {
                    TextField("Enter Full Name", text: $fullName)
                    .frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.08)
                        .font(.custom("American Typewriter", size: 25))
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
                
                VStack {
                    TextField("Enter Username", text: $username)
                    .frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.08)
                        .font(.custom("American Typewriter", size: 25))
                        .textFieldStyle(.roundedBorder)
                    
                    
                }
                .padding()
                
                VStack {
                    TextField("Enter Email", text: $email)
                        .frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.08)
                        .font(.custom("American Typewriter", size: 25))
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
                
                VStack {
                    SecureField("Enter Password", text: $password)
                    .frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.08)
                        .font(.custom("American Typewriter", size: 25))
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
                
                NavigationLink(destination: ChooseChat()
                    .navigationBarBackButtonHidden(true)
                ) {
                    Text("Sign Up")
                        .frame(width: 200, height: 75)
                        .background(.gray)
                        .foregroundColor(.black)
                        .font(.custom("American Typewriter", size: 25))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                }
            }
        }
    }
}
