import SwiftUI

struct ChatGuest: View {
    @State var contract = false
    @State var contractOn = false
    @AppStorage("displayName") var displayName = ""
    
    var body: some View {
        GeometryReader { geometry in
                
                VStack {
                    
                    
                    if contract == false {
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
                                TextField("", text: $displayName)
                                    .frame(width: geometry.size.width * 0.7)
                                    .textFieldStyle(.roundedBorder)
                                    .border(Color.gray)
                                    .foregroundColor(.black)
                            }
                            .foregroundColor(.black)
                            .padding()
                            
                            Button("Chat Now") {
                                contractOn = true
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

                        
                    }  else {
                        if (displayName == "") {
                            ChoosePerson()
                        }
                        
                        if (displayName != "") {
                            ChooseChat()
                        }
                    }
                    
                
                    
            }
                .frame(width: geometry.size.width * 1)
                .background(Image("Background"))
                .foregroundColor(.white)
                
        }
    }
}


