//
//  ChoosePerson.swift
//  ATMSocial
//
//  Created by Ali Alchikh Ibrahim on 5/17/23.
//

import SwiftUI

struct ChoosePerson: View {
    @State var people = ["Hello"]
    @AppStorage("displayName") var displayName = ""
    @State var displaysName = ""
    @State private var AddPersonPage = false
    @State var contract = false
    @State var contractOn = false
    
    var body: some View {
        
        if (AddPersonPage == true) {

                
                
                    GeometryReader { geometry in
                            
                            VStack {
                                
                                
                                    VStack {
                                        HStack {
                                            Text("Create Profile")
                                                .font(.system(size: geometry.size.width * 0.1))
                                                .padding()
                                        }
                                        HStack {
                                            Text("Choose a Display Name")
                                                .font(.system(size: geometry.size.width * 0.05))
                                                .padding()
                                        }
                                        HStack {
                                            TextField("", text: $displaysName)
                                                .frame(width: geometry.size.width * 0.7)
                                                .textFieldStyle(.roundedBorder)
                                                .border(Color.gray)
                                                .foregroundColor(.black)
                                        }
                                        .foregroundColor(.black)
                                        .padding()
                                        
                                        Button("Create") {
                                            displayName = displaysName
                                            contractOn = true
                                            AddPersonPage = false
                                            people.append(displaysName)
                                            
                                        }
                                        .frame(width: geometry.size.width * 0.4, height: 25)
                                        .foregroundColor(.white)
                                        .font(.custom("American Typewriter", size: 20))
                                        .padding()
                                        .border(Color.gray)
                                        .popover(isPresented: $contractOn) {
                                            Terms()
                                            Button("Agree") {
                                                contractOn = false
                                                contract = true
                                            }
                                            .foregroundColor(.black)

                                        }
                                        
                                    }
                                    .frame(width: geometry.size.width * 1, height: geometry.size.height * 1)
                                    .ignoresSafeArea()

                              
                            
                                
                        }
                            .frame(width: geometry.size.width * 1)
                            .background(Image("Background"))
                            .foregroundColor(.white)
                        
                    }
    

        } else {
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
                    HStack {
                        Button {
                            AddPersonPage = true
                        } label: {
                            Text("Add People")
                        }
                        .frame(width: 100, height: 35)
                        .foregroundColor(.white)
                        .font(.custom("American Typewriter", size: 15))
                        .padding()
                        .border(Color.gray)
                        .popover(isPresented: $contractOn) {
                            Terms()
                            Button("Agree") {
                                contractOn = false
                                contract = true
                            }
                            .foregroundColor(.black)

                        }
                        
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
}
