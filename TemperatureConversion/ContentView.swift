//
//  ContentView.swift
//  TemperatureConversion
//
//  Created by Shun Le Yi Mon on 01/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var inputUnit = ""
    @State private var outputUnit = ""
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var calculatedValue: Double {
        let inputValue = Double(inputValue)
        let c2f = (inputValue * 9/5) + 32.0
        let c2k = inputValue + 273.15
        let f2c = (inputValue - 32.0) * 5/9
        let f2k = 5/9 * (inputValue - 32 ) + 273.15
        let k2c = inputValue - 273.15
        let k2f = (inputValue - 273.15 ) * 9/5 + 32.0
        let same = inputValue


        if (inputUnit == "Celsius"){
            if (outputUnit == "Fahrenheit"){
                return c2f
            }
            else if (outputUnit == "Kelvin"){
                return c2k
            }
            else {
                return same
            }
        }
        else if (inputUnit == "Fahrenheit"){
            if (outputUnit == "Celsius"){
                return f2c
            }
            else if (outputUnit == "Kelvin"){
                return f2k
            }
            else {
                return same
            }
        }
        else if (inputUnit == "Kelvin"){
            if (outputUnit == "Celsius"){
                return k2c
            }
            else if (outputUnit == "Fahrenheit"){
               return k2f
            }
            else {
                return same
            }
        }
        return 0.0
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("From", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }.pickerStyle(.menu)
                    }
                    TextField("Enter value", value: $inputValue, format: .number).keyboardType(.decimalPad)
                }
                Section {
                    Picker("To", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }.pickerStyle(.menu)
                    }
                    Text(calculatedValue, format:.number)
                }
            }.navigationTitle("Temp. conversion")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
