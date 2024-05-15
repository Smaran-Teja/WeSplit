//
//  ContentView.swift
//  WeSplit
//
//  Created by Smaran Teja on 13/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberPeopleIdx = 0 // 2 people by default
    @State private var tipPercentage = 20
    
    private let tipPercentages = [0, 5, 10, 15, 20]
    
    var totalPerPerson: Double {
        let numPeople = numberPeopleIdx + 2
        let totalAmt = checkAmount + (Double(tipPercentage)/100.0) * checkAmount
        return totalAmt/Double(numPeople)
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section ("Total amount"){
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                }
                
                Section ("Number of people") {
                    Picker("Number of people", selection: $numberPeopleIdx) {
                        ForEach(2..<20) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.wheel)
                }
                
                Section ("Tip percentage") {
                    Picker("Number of people", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0,format: .percent)

                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("You need to pay...") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }.navigationTitle("WeSplit")
        }
    }
}

#Preview {
    ContentView()
}
