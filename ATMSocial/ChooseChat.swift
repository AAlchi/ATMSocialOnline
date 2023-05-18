//
//  ChooseChat.swift
//  atmsocial
//
//  Created by Ali Alchikh Ibrahim on 5/4/23.
//

import SwiftUI

struct ChooseChat: View {
    @State private var people = ["Group Chat", "Option", "Option"]
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
                            Button {
                                gestureOnOne = true
                            } label: {
                                Text("Log Out")
                            }
                            .frame(width: 100, height: 45)
                            .border(.gray)
                            .font(.custom("American Typewriter", size: 20))
                            .foregroundColor(.white)
                            .padding()
                            .alert(isPresented: $gestureOnOne) {
                                Alert(
                                    title: Text("Are You Sure?"),
                                    primaryButton: .destructive(Text("Yes"), action: {
                                        gestureOnOne = false
                                        displayName = ""
                                    }),
                                    secondaryButton:  .cancel(Text("No"), action: {
                                        gestureOnOne = false
                                    })
                                )
                            }
                        }
                        Divider()
//                        HStack {
//                            Text("Friends")
//                                .font(.custom("American Typewriter", size: 20))
//                                .padding()
//                            Spacer()
//                            NavigationLink("Add Friend") {
//                                AddPerson()
//                            }
//                            .navigationBarBackButtonHidden(true)
//                            .frame(width: 100, height: 45)
//                            .border(.gray)
//                            .font(.custom("American typewriter", size: 19))
//                            .foregroundColor(.white)
//                            .padding()
//                        }
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
