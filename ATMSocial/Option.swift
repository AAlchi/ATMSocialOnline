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
                    VStack {
                        Text("ATM Social")
                            .font(.system(size: 60))
                            .padding()
                        Text("YOUR most secure way to chat")
                            .font(.system(size: 16))
                            
                    }
                    .padding()
                    .foregroundColor(.white)
                    NavigationLink("Chat Now") {
                        ChooseChat()
                    }
                    .frame(width: geometry.size.width * 0.40, height: 60)
                    .background(.blue)
                    .foregroundColor(.white)
                    .font(.custom("American Typewriter", size: 25))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    .foregroundColor(Color.white)
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .background(Image("Background"))
            }
            .navigationViewStyle(.stack)
            
            

        }
    }
}
