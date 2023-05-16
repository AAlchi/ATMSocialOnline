//
//  ChooseChat.swift
//  atmsocial
//
//  Created by Ali Alchikh Ibrahim on 5/4/23.
//

import SwiftUI

struct ChooseChat: View {
    @State private var people = ["Person 1", "Person 2", "Person 3"]
    @State var chattingWith = "Hello"
    @AppStorage("displayName") var displayName = ""
    var body: some View {
        HStack {
            VStack {
                
                HStack {
                    
                    Text("Welcome, \(displayName)")
                        .font(.custom("American Typewriter", size: 25))
                        .padding()
                    Spacer()
                    
                }
                Divider()
                
                HStack {
                    
                    Text("Friends")
                        .font(.custom("American Typewriter", size: 20))
                        .padding()
                    
                    Spacer()
                    NavigationLink(destination: ContentView()
                        .navigationBarBackButtonHidden(true)
                    ) {
                        Text("Log Out")
                            .frame(width: 100, height: 20)
                            .foregroundColor(.black)
                            .font(.custom("American Typewriter", size: 10))
                            .padding()
                            .border(Color.gray)
                    }
                    .padding()
                    
                }
            }
            
        }
        List(people, id: \.self) { people in
            Button {
                chattingWith = people
            } label: {
                Text(people)
                    .font(.custom("American Typewriter", size: 15))
                    .foregroundColor(.black)
            }
            .frame(width: 100)
            .padding()
            .background(
                NavigationLink(destination: Home(chattingWith: chattingWith)) {
                    Text("")
                }
            )
        }
    }
}
