// Selection Sort
// A sorting algorithm, specifically an in-place comparison sort. It has O(n2) time complexity, making it inefficient on large lists, and generally performs worse than the similar insertion sort. Selection sort is noted for its simplicity, and it has performance advantages over more complicated algorithms in certain situations, particularly where auxiliary memory is limited.
//
// Performance:
// Worst-case performance       О(n^2) comparisons, О(n) swaps
// Best-case performance        О(n^2) comparisons, О(n) swaps
// Average performance          О(n^2) comparisons, О(n) swaps
// Worst-case space complexity  O(1) auxiliary
//
// Source: https://en.wikipedia.org/wiki/Selection_sort

import UIKit

extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}

extension Sequence where Iterator.Element == Int {
    
    func sort() -> [Int] {
        var array = Array(self)
        var i = 0
        var j = 0
        var minPos = 0
        var minValue = array[0]
        
        while i < array.count {
            j = i + 1
            minPos = i
            minValue = array[i]
            
            while j < array.count {
                if array[j] < minValue {
                    minValue = array[j]
                    minPos = j
                }
                j += 1
            }
            
            array.swapAt(i, minPos)
            i += 1
        }
        return array
    }
}

let array = (1...100).shuffled()
print("Unsorted Array:")
print(array)

let sortedArray = array.sort()
print("\nSorted Array:")
print(sortedArray)
