//: Playground - noun: a place where people can play

import UIKit

let numbers = [1, 2, 3, 4, 3, 3]

print(numbers.filter{$0 == 3})
print(numbers.filter{$0 % 2 == 0})

print(numbers.map{$0 * 2})

print(numbers.reduce(0, +))
