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
                  
                    Text("")
                        .padding()
                   
            }
                .frame(width: geometry.size.width * 1)
        }
    }
}
