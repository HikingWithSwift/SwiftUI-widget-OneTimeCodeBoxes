//
//  OneTimeCodeInput.swift
//  OneTimeCodeBoxes
//
//  Created by HikingWithSwift on 2021-04-17.
//

import SwiftUI

struct OneTimeCodeInput: UIViewRepresentable {
    typealias UIViewType = UITextField
    
    let index: Int
    @Binding var codeDict: [Int: String]
    @Binding var firstResponderIndex: Int
    
    // MARK: - Internal Type
    
    class Coordinator: NSObject, UITextFieldDelegate {
        let index: Int
        @Binding var codeDict: [Int: String]
        @Binding var firstResponderIndex: Int
        
        init(index: Int, codeDict: Binding<[Int: String]>, firstResponderIndex: Binding<Int>) {
            self.index = index
            self._codeDict = codeDict
            self._firstResponderIndex = firstResponderIndex
        }
        
        func textField(_ textField: UITextField,
                       shouldChangeCharactersIn range: NSRange,
                       replacementString string: String) -> Bool
        {
            let currentText = textField.text ?? ""
            
            guard let stringRange = Range(range, in: currentText) else { return false }
            
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            
            // 3. deleting
            if string.isBackspace {
                codeDict.updateValue("", forKey: index)
                firstResponderIndex = max(0, index - 1)
                return false
            }
            
            // 1. typing
            // 2. pasting
            for i in index..<min(codeDict.count, index + string.count) {
                codeDict.updateValue(string.stringAt(index: i - index), forKey: i)
                firstResponderIndex = min(codeDict.count - 1, index + string.count)
            }
            
            
            return false
        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        .init(index: index, codeDict: $codeDict, firstResponderIndex: $firstResponderIndex)
    }
    
    // MARK: - Required Methods
    
    func makeUIView(context: Context) -> UITextField {
        let tf = UITextField()
        tf.delegate = context.coordinator
        tf.keyboardType = .numberPad
        tf.textContentType = .oneTimeCode
        tf.font = .preferredFont(forTextStyle: .largeTitle)
        tf.textAlignment = .center
        return tf
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = codeDict[index]
        
        if index == firstResponderIndex {
            uiView.becomeFirstResponder()
        }
    }
    
}
