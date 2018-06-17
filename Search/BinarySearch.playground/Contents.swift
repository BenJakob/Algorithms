//: Playground - noun: a place where people can play

import UIKit


func search(for num: Int, in numbers: [Int]) -> Bool {
    
    var leftIndex = 0
    var rightIndex = numbers.count - 1
    
    while leftIndex <= rightIndex {
        
        let midIndex = (leftIndex + rightIndex) / 2
        let midValue = numbers[midIndex]
        
        if midValue == num {
            return true
        }
        
        else if num < midValue {
            rightIndex = midIndex - 1
        }
        
        else if num > midValue {
            leftIndex = midIndex + 1
        }
    }
    return false
}

var numbers = [Int](1...1000)

print(search(for: 42, in: numbers))

