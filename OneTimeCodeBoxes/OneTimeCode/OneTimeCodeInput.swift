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
        
    }
    
    func makeCoordinator() -> Coordinator {
        .init()
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
