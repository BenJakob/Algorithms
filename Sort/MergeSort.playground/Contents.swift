// Merge Sort
// An efficient, general-purpose, comparison-based sorting algorithm. Most implementations produce a stable sort, which means that the implementation preserves the input order of equal elements in the sorted output. Merge sort is a divide and conquer algorithm that was invented by John von Neumann in 1945.
//
// Performance:
// Worst-case performance       O(n log n)
// Best-case performance        O(n log n) typical, O(n) natural variant
// Average performance          O(n log n)
// Worst-case space complexity  О(n) total with O(n) auxiliary, O(1) auxiliary with linked lists
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

func merge(_ leftPile: [Int], _ rightPile: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    var orderedPile = [Int]()
    
    if orderedPile.capacity < leftPile.count + rightPile.count {
        orderedPile.reserveCapacity(leftPile.count + rightPile.count)
    }
    
    while true {
        guard leftIndex < leftPile.endIndex else {
            orderedPile.append(contentsOf: rightPile[rightIndex..<rightPile.endIndex])
            break
        }
        guard rightIndex < rightPile.endIndex else {
            orderedPile.append(contentsOf: leftPile[leftIndex..<leftPile.endIndex])
            break
        }
        
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        } else {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }
    return orderedPile
}

func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftArray, rightArray)
}

extension Sequence where Iterator.Element == Int {
    
    func sort() -> [Int] {
        return mergeSort(Array(self))
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

