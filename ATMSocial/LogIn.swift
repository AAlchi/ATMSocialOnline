//
//  LogIn.swift
//  atmsocial
//
//  Created by Thomas Niezyniecki on 5/8/23.
//

import SwiftUI

struct LogIn: View {
    @State var username = ""
    @State private var password = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Text("Log In")
                    .font(.custom("American Typewriter", size: 25))
                
                VStack {
                    TextField("Enter Username", text: $username)
                        .frame(width: geometry.size.width * 0.95, height: geometry.size.width * 0.08)
                        .font(.custom("American Typewriter", size: 25))
                        .textFieldStyle(.roundedBorder)
                        .padding()
                }
                .padding()
                
                VStack {
                    SecureField("Enter Password", text: $password)
                        .frame(width: geometry.size.width * 0.95, height: geometry.size.width * 0.08)
                        .font(.custom("American Typewriter", size: 25))
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
                
                
                NavigationLink(destination: ChooseChat()
                    .navigationBarBackButtonHidden(true)
                ) {
                    Text("Log In")
                        .frame(width: 150, height: 75)
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
