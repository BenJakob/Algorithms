//: Playground - noun: a place where people can play

import UIKit

extension String {
    func reverseEveryOtherWord() -> String {
        let words = self.components(separatedBy: " ")
        var reversedSentence = ""
        
        for (index, word) in words.enumerated() {
            if index % 2 == 1 {
                reversedSentence += word.reversed()
            } else {
                reversedSentence += word
            }
            
            if index != words.count - 1 {
                reversedSentence += " "
            }
        }
        return reversedSentence
    }
}

var sentence = "Hello my wonderful World"

print(sentence.reverseEveryOtherWord())
