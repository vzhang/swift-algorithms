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
    
    // 如何编程实现“求一个数的平方根”？要求精确到小数点后 6 位
    func square(value: Double) -> Double {
        var low = 0.0
        var high = value
        
        var mid = low + (high - low) / 2.0
        while fabs(low - high) > 1e-6 {
            if mid * mid - value < 1e-6 {
                low = mid
            }
            else if mid * mid == value {
                return mid
            }
            else {
                high = mid
            }
            
            mid = low + (high - low) / 2.0
        }
        
        return mid
    }
    
    // 查找第一个值等于给定值的元素，包含重复元素
    func search2(arr: Array<Element>, value: Element) -> Int? {
        let count = arr.count
        var low = 0
        var high = count - 1
        
        while low <= high {
            let mid = low + ((high - low) >> 1)
            if arr[mid] >= value {
                high = mid - 1
            }
            else {
                low = mid + 1
            }
            
            if low < count && arr[low] == value {
                return low
            }
        }
        
        return nil
    }
    
    func search3(arr: Array<Element>, value: Element) -> Int? {
        let count = arr.count
        var low = 0
        var high = count - 1
        while low <= high {
            let mid = low + ((high - low)) >> 1
            if arr[mid] > value {
                high = mid - 1
            }
            else if arr[mid] < value {
                low = mid + 1
            }
            else {
                if mid == 0 || arr[mid - 1] != value {
                    return mid
                }
                else {
                    high = mid - 1
                }
            }
        }
        
        return nil
    }
    
    /// 查找最后一个值等于给定值的元素
    func search4(arr: Array<Element>, value: Element) -> Int? {
        let count = arr.count
        var low = 0
        var high = count - 1
        while low <= high {
            let mid = low + ((high - low) >> 1)
            if arr[mid] > value {
                high = mid - 1
            }
            else if arr[mid] < value {
                low = mid + 1
            }
            else {
                if mid == count - 1 || (arr[mid + 1] != value) {
                    return mid
                }
                else {
                    low = mid + 1
                }
            }
        }
        
        return nil
    }
    
    /// 查找第一个大于等于给定值的元素
    func search5(arr: Array<Element>, value: Element) -> Int? {
        let count = arr.count
        var low = 0
        var high = count - 1
        while low <= high {
            let mid = low + ((high - low) >> 1)
            if arr[mid] >= value {
                if mid == 0 || (arr[mid - 1] < value) {
                    return mid
                }
                else {
                    high = mid - 1
                }
            }
            else {
                low = mid + 1
            }
        }
        
        return nil
    }
    
    /// 查找最后一个小于等于给定值的元素
    func search6(arr: Array<Element>, value: Element) -> Int? {
        let count = arr.count
        var low = 0
        var high = count - 1
        while low <= high {
            let mid = low + ((high - low) >> 1)
            if arr[mid] <= value {
                if mid == count - 1 || (arr[mid + 1] > value) {
                    return mid
                }
                else {
                    low = mid + 1
                }
            }
            else {
                high = mid - 1
            }
        }
        
        return nil
    }
    
    /// 思考题
    /// 如果有序数组是一个循环有序数组，比如 4，5，6，1，2，3
    /// 针对这种情况，如何实现一个求“值等于给定值”的二分查找算法呢
    /// 解题思路
    /// 因为数组是有序的，因此我们首要的目标是判断mid左边区间和右边区间哪个是全有序
    /// 如果mid大于右边区间最后一个数，表明mid左边区间是全有序，右边未知，反之，右边区间全有序
    /// 比如: **4, 5, 6, 7**1,2,3,mid = 3, 因此mid[3] > arr[length - 1], 所左边有序，然后判断target值是否在有序区间里面，
    /// 存在，则返回，不存在则在右边区间继续查找
    func search7(arr: Array<Element>, target: Element) -> Int? {
        let count = arr.count
        var low = 0
        var high = count - 1
        while low <= high {
            let mid = low + ((high - low) >> 1)
            if arr[mid] == target {
                return mid
            }
            else if (arr[mid] < arr[high]) {
                if arr[mid] < target && target <= arr[high] {
                    low = mid + 1
                }
                else {
                    high = mid - 1
                }
            }
            else {
                if arr[low] < target && target < arr[mid] {
                    high = mid - 1
                }
                else {
                    low = mid + 1
                }
            }
        }
        
        return nil
    }
}


