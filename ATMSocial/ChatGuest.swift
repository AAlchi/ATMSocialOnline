//
//  ChatGuest.swift
//  ATM Social
//
//  Created by Thomas Niezyniecki on 5/11/23.
//

import SwiftUI

struct ChatGuest: View {
    @State var displayName = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Text("Display Name")
                    .font(.custom("American Typewriter", size: 25))
                
                VStack {
                    TextField("Enter Display Name", text: $displayName)
                        .frame(width: geometry.size.width * 0.95, height: geometry.size.width * 0.08)
                        .font(.custom("American Typewriter", size: 25))
                        .textFieldStyle(.roundedBorder)
                        .padding()
                }
                .padding()
                
                NavigationLink(destination: ChooseChat()
                    .navigationBarBackButtonHidden(true)
                ) {
                    Text("Chat")
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


