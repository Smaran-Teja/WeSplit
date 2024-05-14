//
//  ContentView.swift
//  WeSplit
//
//  Created by Smaran Teja on 13/05/24.
//

import SwiftUI

struct ContentView: View {
    @State
    private var tapCount = 1438791

    var body: some View {
        Button("Tap Count: \(tapCount)") {
            if tapCount.isMultiple(of: 2) {
                tapCount /= 2
            }
            else {
                tapCount = 3 * tapCount + 1
            }
        }
    }
}

#Preview {
    ContentView()
}
