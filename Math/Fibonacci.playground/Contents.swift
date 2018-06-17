//: Playground - noun: a place where people can play

import UIKit

func fibonacci(steps: Int) -> [Int] {

    var sequence = [0, 1]
    
    for i in 0...steps - 3 {
        sequence.append(sequence[i] + sequence[i + 1])
    }
    
    return sequence
}

print(fibonacci(steps: 10))
