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
                  
                    Text("You currently don't have the authority needed in order to infringe this project because it's ours and not yours. The code was made by us and therefor cannot be infringed or copied by others in accordance to us.")
                        .padding()
                   
            }
                .frame(width: geometry.size.width * 1)
        }
    }
}
