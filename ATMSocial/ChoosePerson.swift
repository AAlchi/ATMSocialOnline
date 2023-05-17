//
//  ChoosePerson.swift
//  ATMSocial
//
//  Created by Ali Alchikh Ibrahim on 5/17/23.
//

import SwiftUI

struct ChoosePerson: View {
    @State private var people = ["Dude", "Person 2", "Dude 3"]
    @AppStorage("displayName") var displayName = ""
    var body: some View {
            
            HStack {
                VStack {
                    
                    HStack {
                        
                        Text("Welcome, who are you?")
                            .font(.custom("American Typewriter", size: 25))
                            .padding()
                        Spacer()
                        
                    }
                    Divider()
                    
                    HStack {
                        
                        Text("Registered People")
                            .font(.custom("American Typewriter", size: 20))
                            .padding()
                        
                        Spacer()
                        
                        
                    }
                }
                .foregroundColor(.white)
            }
            List(people, id: \.self) { people in
                Button {
                    displayName = people
                } label: {
                    Text(people)
                        .font(.custom("American Typewriter", size: 15))
                        .foregroundColor(.black)
                }
                .frame(width: 100)
                .padding()
                .background(
                    NavigationLink(destination: ChooseChat()) {
                        Text("")
                    }
                )
            }
    }
}
