// Bubble Sort
// A simple sorting algorithm that repeatedly steps through the list to be sorted, compares each pair of adjacent items and swaps them if they are in the wrong order. The pass through the list is repeated until no swaps are needed, which indicates that the list is sorted. The algorithm, which is a comparison sort, is named for the way smaller or larger elements "bubble" to the top of the list. Although the algorithm is simple, it is too slow and impractical for most problems even when compared to insertion sort.[2] Bubble sort can be practical if the input is in mostly sorted order with some out-of-order elements nearly in position.
//
// Performance:
// Worst-case performance       О(n2) comparisons, О(n2) swaps
// Best-case performance        О(n) comparisons, О(1) swaps
// Average performance          О(n2) comparisons, О(n2) swaps
// Worst-case space complexity  O(1), O(1) auxiliary
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
        var i = 0
        var isSwapped = true
        
        while isSwapped {
            i = 0
            isSwapped = false
            
            while i < array.count - 1 {
                if array[i + 1] < array[i] {
                    array.swapAt(i, i + 1)
                    isSwapped = true
                }
                i += 1
            }
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
