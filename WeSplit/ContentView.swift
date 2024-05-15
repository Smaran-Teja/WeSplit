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
    @FocusState private var amountIsFocused: Bool
    
    private let tipPercentages = [0, 5, 10, 15, 20]
    
    
    var totalWithTip: Double {
        checkAmount + (Double(tipPercentage)/100.0) * checkAmount
    }
    var totalPerPerson: Double {
        let numPeople = numberPeopleIdx + 2
        return totalWithTip/Double(numPeople)
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section ("Check amount"){
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                
                Section ("Tip percentage") {
                    Picker("Number of people", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0,format: .percent)

                        }
                    }
                    .pickerStyle(.segmented)
                    
                    if (checkAmount != 0 && tipPercentage != 0) {
                        Text("Total bill: \(totalWithTip, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                    }
                }
            
                
                Section ("Number of people") {
                    Picker("Number of people", selection: $numberPeopleIdx) {
                        ForEach(2..<20) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.wheel)
                }
                
                Text("You need to pay: \(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")

            }.navigationTitle("WeSplit")
             .toolbar {
                 if amountIsFocused {
                    Button("Done") {
                        amountIsFocused.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
