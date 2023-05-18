//
//  AddPerson.swift
//  ATMSocial
//
//  Created by Thomas Niezyniecki on 5/18/23.
//

import SwiftUI


struct AddPerson: View {
//    @AppStorage("Friends") var friends: [String] = []
    @State var newPerson = ""
    var body: some View {
        TextField("Enter username here", text: $newPerson)
            .textFieldStyle(.roundedBorder)
            .padding()
        NavigationLink("Add Friend") {
            ChooseChat()
        }
        .background(
            Button(action: {
//                friends.append("New String")
            }, label: {
                
            })
        )
    }
}
