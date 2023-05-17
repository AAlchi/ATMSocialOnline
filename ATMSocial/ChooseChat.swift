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
    @State private var gestureOnOne = false
    @State private var gestureOnTwo = false
    var body: some View {
        VStack {
            if (displayName != "") {
                
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
                            
                            Button {
                                gestureOnOne = true
                            } label: {
                                Text("Log Out")
                            }
                            .frame(width: 100, height: 45)
                            .border(.gray)
                            .foregroundColor(.white)
                            .alert(isPresented: $gestureOnOne) {
                                Alert(
                                    title: Text("Are You Sure?"),
                                    primaryButton: .destructive(Text("Yup"), action: {
                                        gestureOnOne = false
                                        displayName = ""
                                    }),
                                    secondaryButton:  .cancel(Text("Nope"), action: {
                                        gestureOnOne = false
                                    })
                                )
                            }
                            
                        }
                    }
                    .foregroundColor(.white)
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
                
            } else {
                ChoosePerson()
            }
        }
        .background(Image("Background"))
        .foregroundColor(.white)
        
        
    }
}
