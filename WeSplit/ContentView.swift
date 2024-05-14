//
//  ContentView.swift
//  WeSplit
//
//  Created by Smaran Teja on 13/05/24.
//

import SwiftUI

struct ContentView: View {
    var students = ["A", "B", "C"]
    
    
    @State
    private var selectedStudent = "A"
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
