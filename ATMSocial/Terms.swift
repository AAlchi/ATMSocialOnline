//
//  Terms.swift
//  atmsocial
//
//  Created by test on 5/15/23.
//

import SwiftUI

struct Terms: View {
    var body: some View {
        GeometryReader { geometry in
                
                VStack {
                    HStack {
                        Text("Terms & Conditions")
                            .font(.system(size: geometry.size.width * 0.1))
                            .padding()
                    }
                  
                    Text("Copyright @2023. ATM Social is to be used by those who use it wisely and logically. Anyone can and will be caught using the app for bad intent or malicious purposes. You currently don't have the authority needed in order to infringe this project because it's ours and not yours. The code was made by us and therefor cannot be infringed or copied by others in accordance to us.")
                        .padding()
                   
            }
                .frame(width: geometry.size.width * 1)
                .foregroundColor(.black)
        }
    }
}
