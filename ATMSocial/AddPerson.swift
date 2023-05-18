//
//  AddPerson.swift
//  ATMSocial
//
//  Created by Thomas Niezyniecki on 5/18/23.
//

import SwiftUI

struct AddPerson: View {
    @AppStorage("NewPerson") var newPerson = ""
    var body: some View {
        TextField("Enter username here", text: $newPerson)
            .textFieldStyle(.roundedBorder)
            .padding()
        NavigationLink("Add Friend") {
            ChooseChat()
        }
    }
}
