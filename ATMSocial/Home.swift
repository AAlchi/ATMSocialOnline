//
//  Home.swift
//  atmsocial
//
//  Created by Ali Alchikh Ibrahim on 4/28/23.
//

import SwiftUI
import FirebaseCore
import FirebaseDatabase
import UserNotifications

struct Chat: Hashable {
    let id = UUID()
    let dateSent: String
    let receiver: String
    let sender: String
    let text: String
    let type: String
}

struct Home: View {
    
    
    
    func notify() {
        let content = UNMutableNotificationContent()
        content.title = "ATM Social Message"
        content.body = "You Have A New Chat on ATM Social"
        content.sound = UNNotificationSound.default
        
        let trig = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let req = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trig)
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            UNUserNotificationCenter.current().add(req) { (error) in
                print("We Got To This Point Of The Code")
            }
        }
    }
    
    @State var chats: [Chat] = []
    @State var bool = false
    @Namespace var bottomPageScroll
    @Namespace var topPageScroll
    
    @AppStorage("displayName") var displayName = ""
    
    
    
    
    
    func loadDataFromFirebase() {
        let database = Database.database().reference()
        database.child("chats").observe(.value) { snapshot in
            
            chats.removeAll()
            
            if let snapShotArray = snapshot.children.allObjects as? [DataSnapshot] {
                for child in snapShotArray {
                    if let data = child.value as? [String: Any],
                       let text = data["text"] as? String,
                       let receiver = data["reciever"] as? String,
                       let dateSent = data["dateSent"] as? String,
                       let sender = data["sender"] as? String,
                       let type = data["type"] as? String {
                        
                        let chat = Chat(dateSent: dateSent, receiver: receiver, sender: sender, text: text, type: type)
                        
                        
                        chats.append(chat)
                        
                        
                        
                        
                    }
                }
            }
            
            //            print("These are now the chats: \(chats)")
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
                ScrollViewReader { proxy in
                    
                    ScrollView(){
                        Spacer()
                        VStack {
                            
                            Button("Push") {
                                notify()
                            }
                            .id(bottomPageScroll)
                            
                            ForEach(chats, id: \.self) { messages in
                                HStack {
                                    if (messages.sender != displayName) {
                                        HStack {
                                            
                                            Text("\(date)")
                                            Text("\(messages.sender): \(messages.text)")
                                                .frame(width: 500)
                                                .padding()
                                                .font(.system(size: 20))
                                                .foregroundColor(.white)
                                                .background(Color.green)
                                                .flippedUpsideDown()
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
                                                .foregroundColor(.white)
                                                .background(Color.blue)
                                                .flippedUpsideDown()
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
                            .flippedUpsideDown()
                            .padding()
                            .onAppear {
                                //                                chats.removeAll() has betrayed us
                                withAnimation {
                                    proxy.scrollTo(chats.last?.id, anchor: .bottom)
                                }
                                
                                loadDataFromFirebase()
                            }
                            
                            Button("") {
                            }
                            .id(bottomPageScroll)
                            
                        }
                        .onTapGesture {
                            withAnimation {
                                proxy.scrollTo(bottomPageScroll)
                            }
                            
                        }
                        .padding()
                        .onAppear {
                            
                            
                            chats.removeAll()
                            
                            
                            
                            withAnimation {
                                proxy.scrollTo(chats.last?.id, anchor: .bottom)
                            }
                            
                            loadDataFromFirebase()
                        }
                        
                        Button("") {
                        }
                        .id(bottomPageScroll)
                        
                    }
                    .onTapGesture {
                        withAnimation {
                            proxy.scrollTo(bottomPageScroll)
                        }
                    }
                    .onAppear {
                        chats.removeAll()
                        
                        
                        withAnimation {
                            proxy.scrollTo(bottomPageScroll)
                        }
                        
                        
                    }
                    
                    
                    
                }
                HStack {
                    TextField("Chat Away", text: $message)
                        .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.3)
                        .font(.custom("American Typewriter", size: 20))
                        .textFieldStyle(.roundedBorder)
                        .onSubmit {
                            let timedate = Date()
                            let allTheData = ["reciever": "\(chattingWith)", "sender": "\(displayName)", "text": "\(message)", "dateSent": "\(timedate)", "type": "1"]
                            let newthedb = thedb.child("chats")
                            let newnewthedb = newthedb.childByAutoId()
                            newnewthedb.setValue(allTheData)
                            message = ""
                        }
                    ZStack {
                        Button(action: {
                            let timedate = Date()
                            
                            
                            let allTheData = ["reciever": "\(chattingWith)", "sender": "\(displayName)", "text": "\(message)", "dateSent": "\(timedate)", "type": "1"]
                            
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
                        .padding()
                        
                    }
                }
                
                
                
            }
        }
        
    }
}

struct FlippedUpsideDown: ViewModifier {
    func body(content: Content) -> some View {
        content
            .rotationEffect(.radians(.pi))
            .scaleEffect(x: -1, y: 1, anchor: .center)
    }
}
extension View{
    func flippedUpsideDown() -> some View{
        self.modifier(FlippedUpsideDown())
    }
}
