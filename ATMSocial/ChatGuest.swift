import SwiftUI

struct ChatGuest: View {
    @AppStorage("contraclt") var contract = false
    @State var contractOn = false
    @AppStorage("displayName") var displayName = ""
    
    var body: some View {
        GeometryReader { geometry in
                
                VStack {
                    
                    
                    if contract == false {
                        
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
                            TextField("", text: $displayName)
                                .frame(width: geometry.size.width * 0.7)
                                .textFieldStyle(.roundedBorder)
                                .border(Color.gray)
                        }
                        .padding()
                        
                        Button("Chat Now") {
                            contractOn = true
                        }
                        .frame(width: geometry.size.width * 0.4, height: 25)
                        .foregroundColor(.black)
                        .font(.custom("American Typewriter", size: 20))
                        .padding()
                        .border(Color.black)
                        .popover(isPresented: $contractOn) {
                            Terms()
                            Button("Agree") {
                                contractOn = false
                                contract = true
                            }
                        }
                        
                    } else {
                        ChooseChat()
                    }
                    
            }
                .frame(width: geometry.size.width * 1)
        }
    }
}


