//
//  ChatFunction.swift
//  atmsocial
//
//  Created by Ali Alchikh Ibrahim on 5/2/23.
//

import SwiftUI
import Foundation
import FirebaseDatabase
import FirebaseCore

struct ChatFunction: Identifiable {
    let id = UUID()
    let reciever: String
    let sender: String
    let text: String
    let dateSent: Date
    let type: String
}

