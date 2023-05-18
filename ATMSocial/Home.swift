//
//  Home.swift
//  atmsocial
//
//  Created by Ali Alchikh Ibrahim on 4/28/23.
//

import SwiftUI
import FirebaseCore
import FirebaseDatabase


struct Home: View {
    
    func loadDataFromFirebase() {
        
        let database = Database.database().reference()
        
        
        
        database.child("chats").observe(.value) { snapShot  in
            
            let snapShotArray = snapShot.children.allObjects as! [DataSnapshot]
           
//            let dateSent = snapShotArray[0].value
//
//            let reciever = snapShotArray[1].value as! String
//
//            let sender = snapShotArray[2].value as! String
//
//            let text = snapShotArray[3].value as! String
//
//            let type = snapShotArray[4].value as! String
//
//
//            self.allMessagesTwo = [ChatFunction(reciever: "\(reciever)", sender: "\(sender)", text: "\(text)", dateSent: "\(dateSent)", type: "\(type)")]
            
           
            let allDataChat = ChatFunction(reciever: "Hello", sender: "Hello", text: "Hello", dateSent: Date(), type: "one")
            
        }
    }
    
    
    
    
    //database
    let thedb = Database.database().reference()
    
    //normal code
    @State var message = ""
    @State private var allMessagesTwo: [ChatFunction] = []
    
    
    @State var chattingWith:String
    @State var date = ""
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Text("Chatting with \(chattingWith)")
                        .font(.custom("American Typewriter", size: 25))
                        .padding()
                    Spacer()
                }
                Divider()
                ScrollView(){
                    Spacer()
                    VStack {
                        ForEach(allMessagesTwo) {messages in
                            HStack {
                                if (messages.type == "one") {
                                    HStack {
                                        
                                        Text("\(date)")
                                        Text("\(messages.text)")
                                            .frame(width: 500)
                                            .padding()
                                            .font(.system(size: 20))
                                            .foregroundColor(Color.white)
                                            .background(Color.green)
                                            .cornerRadius(20)
                                            .gesture(
                                                DragGesture()
                                                    .onEnded { action in
                                                        withAnimation {
                                                            
                                                            if action.translation.width > 0 {
                                                                date = "Date: \(messages.dateSent)"
                                                            } else {
                                                                date = ""
                                                            }
                                                        }
                                                        
                                                    }
                                            )
                                        
                                    }
                                    .padding()
                                    Spacer()
                                } else {
                                    HStack {
                                        Spacer()
                                        Text("\(messages.text)")
                                            .frame(width: 500)
                                            .padding()
                                            .font(.system(size: 20))
                                            .foregroundColor(Color.white)
                                            .background(Color.blue)
                                            .cornerRadius(20)
                                            .gesture(
                                                DragGesture()
                                                    .onEnded { action in
                                                        withAnimation {
                                                            
                                                            
                                                            if action.translation.width < 0 {
                                                                date = "Date: \(messages.dateSent)"
                                                            } else {
                                                                date = ""
                                                            }
                                                        }
                                                    }
                                            )
                                        Text("\(date)")
                                        
                                    }
                                    
                                    
                                }
                            }
                        }
                        .padding()
                        Spacer()
                    }
                    .padding()
                    .onAppear {
                        loadDataFromFirebase()
                        
                        
                    }
                }
                HStack {
                    TextField("Chat Away", text: $message)
                        .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.3)
                        .font(.custom("American Typewriter", size: 20))
                        .textFieldStyle(.roundedBorder)
                    ZStack {
                        Button(action: {
                            let timedate = Date()
                            
                            
                            let allTheData = ["reciever": "You", "sender": "\(chattingWith)", "text": "\(message)", "dateSent": "\(timedate)", "type": "1"]
                            
                            let newthedb = thedb.child("chats")
                            let newnewthedb = newthedb.childByAutoId()
                            newnewthedb.setValue(allTheData)
                            message = ""
                            
                        }, label: {
                            Image(systemName: "arrow.up")
                                .font(.system(size: geometry.size.width * 0.04))
                        })
                        .frame(width: geometry.size.width * 0.06, height: geometry.size.width * 0.06)
                        .background(.blue)
                        .cornerRadius(geometry.size.width * 1)
                        .foregroundColor(.white)
                    }
                }
//                Button("Send Other") {
//
//                }
//                .font(.custom("American Typewriter", size: 30))
//                .background(.blue)
//                .foregroundColor(.black)
//                .cornerRadius(5)
            }
        }
    }
    
}
