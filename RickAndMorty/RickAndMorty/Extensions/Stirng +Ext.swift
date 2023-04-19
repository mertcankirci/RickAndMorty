//
//  Stirng +Ext.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 19.04.2023.
//

import SwiftUI

extension String {
    func numbersAtEnd() -> [Int] {
        var numbers: [Int] = []
        let regex = try! NSRegularExpression(pattern: "\\d+$", options: [])
        let range = NSRange(location: 0, length: self.utf16.count)
        let matches = regex.matches(in: self, options: [], range: range)
        
        for match in matches {
            if let range = Range(match.range, in: self) {
                if let number = Int(self[range]) {
                    numbers.append(number)
                }
            }
        }
        
        return numbers
    }
}
