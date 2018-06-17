// Insertion Sort
// A simple sorting algorithm that builds the final sorted array (or list) one item at a time.
// It is much less efficient on large lists than more advanced algorithms such as quicksort, heapsort, or merge sort.
//
// Performance:
// Worst-case performance       О(n^2) comparisons, swaps
// Best-case performance        O(n)   comparisons, O(1) swaps
// Average performance          О(n^2) comparisons, swaps
// Worst-case space complexity  О(n)   total, O(1) auxiliary
//
// Source: https://en.wikipedia.org/wiki/Insertion_sort

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
        var i = 1
        var j = 1
        
        while i < array.count {
            j = i
            
            while j > 0 && array[j - 1] > array[j] {
                array.swapAt(j, j-1)
                j -= 1
            }
            
            i += 1
        }
        return array
    }
}

let array = (1...100).shuffled()
print("Unsorted Array", array)

let sortedArray = array.sort()
print("\nSorted Array", sortedArray)
