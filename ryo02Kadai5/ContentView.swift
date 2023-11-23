//
//  ContentView.swift
//  ryo02Kadai5
//
//  Created by 大田涼介 on 2023/10/07.
//

import SwiftUI

struct ContentView: View {
    
    @State var displayleftNumber = ""
    @State var displayrightNumber = ""
    @State var resultNumber = 0.0
    @State var showAlert = false
    @State var alertMessage = ""
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    TextFieldView(displayNumber: $displayleftNumber)
                    Text("÷")
                    TextFieldView(displayNumber: $displayrightNumber)
                }
                Button {
                    calculate()
                } label: {
                    Text("計算")
                }
                .alert("課題5", isPresented: $showAlert) {
                    Button("OK") {
                    }
                } message: {
                    Text(alertMessage)
                }
            }
            .padding()
            HStack {
                Text(String(resultNumber))
            }
        }
    }
    
    func calculate() {
        guard let leftNumber = Double(displayleftNumber) else {
            showAlert = true
            alertMessage  = "割られる数を入力してください"
            return
        }
        
        guard let rightNumber = Double(displayrightNumber) else {
            showAlert = true
            alertMessage = "割る数を入力してください"
            return
        }
        
        if rightNumber == 0 {
            showAlert = true
            alertMessage = "割る数には0を入力しないでください"
            return
        }
        
        resultNumber = leftNumber / rightNumber
    }
    
}

struct TextFieldView: View {
    @Binding var displayNumber: String
    var body: some View {
        TextField("", text: $displayNumber)
            .keyboardType(.numberPad)
            .padding()
            .border(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
