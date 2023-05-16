//
//  Option.swift
//  atmsocial
//
//  Created by Thomas Niezyniecki on 4/28/23.
//

import SwiftUI

struct Option: View {
    @State private var isShowingOptionView = true
    @State private var popoverPre = false
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    HStack {
                        Image("ATMSocial")
                            .resizable()
                            .frame(width: geometry.size.width * 0.15, height: geometry.size.width * 0.15)
                            .padding()
                            .cornerRadius(50)
                        Text("ATM Social").font(.system(size: 20))
                    }
                    
                    NavigationLink("Chat Now") {
                        ChatGuest()
                    }
                    .frame(width: geometry.size.width * 0.40, height: 70)
                    .background(.gray)
                    .foregroundColor(.black)
                    .font(.custom("American Typewriter", size: 25))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    .foregroundColor(Color.white)
                    
                }
            }
            .navigationViewStyle(.stack)
        }
    }
}
