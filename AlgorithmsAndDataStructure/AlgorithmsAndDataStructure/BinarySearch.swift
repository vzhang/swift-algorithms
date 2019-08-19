//
//  BinarySearch.swift
//  AlgorithmsAndDataStructure
//
//  Created by Ming Zhang on 2019/8/19.
//  Copyright © 2019 Ming Zhang. All rights reserved.
//

import Foundation

/// 二分查找
class BinarySearch<Element: Comparable> {
    
    // 顺序方式查找，非递归
    func search(arr: Array<Element>, value: Element) -> Int {
        var low = 0
        var high = arr.count - 1
        
        while low <= high {
            let mid = low + (high - low) >> 1
            if arr[mid] == value {
                return mid
            }
            else if (arr[mid] < value) {
                low = mid + 1
            }
            else {
                high = mid - 1
            }
        }
        
        return -1
    }
    
    /// 递归版本实现
    func searchRecursion(arr: Array<Element>, value: Element) -> Int {
        return p_searchRecursion(arr: arr, value: value, low: 0, high: arr.count - 1)
    }
    
    private func p_searchRecursion(arr: Array<Element>, value: Element, low: Int, high: Int) -> Int {
        if low > high {
            return -1
        }
        
        let mid = low + (high - low) >> 1
        if arr[mid] == value {
            return mid
        }
        else if arr[mid] < value {
            return p_searchRecursion(arr: arr, value: value, low: mid + 1, high: high)
        }
        else {
            return p_searchRecursion(arr: arr, value: value, low: low, high: mid - 1)
        }
        
    }
}


// 如何编程实现“求一个数的平方根”？要求精确到小数点后 6 位

// 
