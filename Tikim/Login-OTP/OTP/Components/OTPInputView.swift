//
//  OTPInputView.swift
//  Tikim
//
//  Created by Rashad on 11.03.26.
//

import SwiftUI

struct OTPInputView: View {
    @State var text: String = ""
    @FocusState var inputFocused: Bool
    @Binding var inputModel: [OTPInputModel]
    
    var body: some View {
        ZStack {
            TextField("Enter the input", text: $text)
                .keyboardType(.numberPad)
                .focused($inputFocused)
                .opacity(0)
            
            HStack(spacing: 10) {
                ForEach(inputModel) { input in
                    OTPInput(model: input)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            inputFocused = true
                        }
                }
            }
            .onChange(of: text) { oldValue, newValue in
                // Finding index to add value
                let emptyCharIndex: Int = inputModel.firstIndex { input in
                    input.number == nil
                } ?? inputModel.count - 1
                
                // Finding index to change its "focused" State
                let filledCharIndex: Int = inputModel.lastIndex(where: { $0.number != nil}) ?? 0
                
                // Reseting "focused" states
                let newModel: [OTPInputModel] = inputModel.map { input in
                    var input = input
                    input.isFocused = false
                    return input
                }
                
                inputModel = newModel
                
                if newValue > oldValue {
                    // Type action. Adding the value to the field and making it focused
                    inputModel[emptyCharIndex].number = text.last
                    inputModel[emptyCharIndex].isFocused = true
                    
                    
                    // Check if the field is filled
                    let filteredResult = inputModel.filter { input in
                        input.number == nil
                    }
                    
                    // Dismiss keyboard after filling all fields
                    if filteredResult.isEmpty {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            inputFocused = false
                        }
                    } else {
                        inputFocused = true
                    }
                    
                    
                } else {
                    // Delete action. Delete the last number and remove its "focused" state
                    inputModel[filledCharIndex].number = nil
                    inputModel[filledCharIndex > 0 ? filledCharIndex - 1 : 0].isFocused = true
                }
            }
        }
        
    }
}

#Preview {
    OTPInputView(inputModel: .constant([.init(number: "1", isFocused: false)]))
}
