//
//  ContentView.swift
//  WeSplit
//
//  Created by Smaran Teja on 13/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State 
    private var nameText = ""
    
    
    @State
    private var hobbyText = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Enter name here", text: $nameText)
                Text((nameText != "") ? "Your name is \(nameText)" : "")
            }
            Section {
                TextField("Enter hobby here", text: $hobbyText)
                Text((hobbyText != "") ? "Your hobby is \(hobbyText)" : "")
            }
        }
    }
}

#Preview {
    ContentView()
}
