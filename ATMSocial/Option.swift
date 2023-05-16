//
//  Option.swift
//  atmsocial
//
//  Created by Thomas Niezyniecki on 4/28/23.
//

import SwiftUI

struct Option: View {
    @State private var isShowingOptionView = true
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    Image("ATMSocial")
                        .resizable()
                        .frame(width: geometry.size.width * 0.6, height: geometry.size.width * 0.6)
                        .padding()
                    NavigationLink("Chat") {
                        ChatGuest()
                    }
                    .frame(width: 250, height: 100)
                    .background(.gray)
                    .foregroundColor(.black)
                    .font(.custom("American Typewriter", size: 25))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
//                    VStack {
//                        NavigationLink("Sign Up") {
//                            SignUp()
//                        }
//                        .frame(width: 250, height: 100)
//                        .background(.gray)
//                        .foregroundColor(.black)
//                        .font(.custom("American Typewriter", size: 25))
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                        .padding()
//                        NavigationLink("Log In") {
//                            LogIn()
//                        }
//                        .frame(width: 250, height: 100)
//                        .background(.gray)
//                        .foregroundColor(.black)
//                        .font(.custom("American Typewriter", size: 25))
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                        .padding()
//                    }
                }
            }
            .navigationViewStyle(.stack)
        }
    }
}
