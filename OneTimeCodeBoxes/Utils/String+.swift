//
//  String+.swift
//  OneTimeCodeBoxes
//
//  Created by HikingWithSwift on 2021-04-18.
//

import Foundation

extension String {
    
    var isBackspace: Bool {
        let char = self.cString(using: String.Encoding.utf8)!
        return strcmp(char, "\\b") == -92
    }
    
    /// - returns: a string has only 1 character
    func stringAt(index: Int) -> String {
        let stringIndex = self.index(self.startIndex, offsetBy: index)
        return String(self[stringIndex])
    }
    
}
