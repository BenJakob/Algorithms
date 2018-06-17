//: Playground - noun: a place where people can play

import UIKit

func getMostCommonName(in names: [String]) -> String {
    
    var counts = [String: Int]()
    
    for name in names {
        if let count = counts[name] {
            counts[name] = count + 1
        } else {
            counts[name] = 1
        }
    }
    
    var mostCommonName = ""
    
    for key in counts.keys {
        if mostCommonName == "" {
            mostCommonName = key
        } else {
            if counts[key]! > counts[mostCommonName]! {
                mostCommonName = key
            }
        }
    }
    
    return mostCommonName
}

var names = ["Ben", "Anna", "Bob", "Anna", "John"]

print(getMostCommonName(in: names))

