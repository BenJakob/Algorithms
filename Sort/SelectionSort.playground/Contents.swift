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
        
        for i in 0..<array.count {
            var minPos = i
            var minValue = array[i]
            
            for j in i+1..<array.count {
                if array[j] < minValue {
                    minValue = array[j]
                    minPos = j
                }
            }
            array.swapAt(i, minPos)
        }
        return array
    }
}

let array = (1...300).shuffled()
print("Unsorted Array:")
print(array)

let start = Date()
let sortedArray = array.sort()
let duration = String(format: "%.3f", start.timeIntervalSinceNow * -1)

print("\nSorted Array:")
print(sortedArray)
print("\nDuration: \(duration) Seconds")
