//: Playground - noun: a place where people can play

import UIKit

func factorial(of value: Int) -> Int {
    
    if value == 0 {
        return 1
    }
    
    return value * factorial(of: value - 1)
}

print(factorial(of: 5))
