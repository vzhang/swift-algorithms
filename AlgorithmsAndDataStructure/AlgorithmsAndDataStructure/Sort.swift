//
//  Sort.swift
//  AlgorithmsAndDataStructure
//
//  Created by Ming Zhang on 2019/8/11.
//  Copyright © 2019 Ming Zhang. All rights reserved.
//

import Foundation

/// 十大排序算法实现
class SortImplementation<Element: Comparable>
{
    /// 1. 冒泡排序(bubble sort)
    /// wiki: 它重複地走訪過要排序的數列，一次比較兩個元素，如果他們的順序錯誤就把他們交換過來。
    /// 走訪數列的工作是重複地進行直到沒有再需要交換，也就是說該數列已經排序完成。
    /// 算法步骤：
    /// 1. 比較相鄰的元素。如果第一個比第二個大，就交換他們兩個。
    /// 2. 對每一對相鄰元素作同樣的工作，從開始第一對到結尾的最後一對。這步做完後，最後的元素會是最大的數。
    /// 3. 針對所有的元素重複以上的步驟，除了最後一個。
    /// 4. 持續每次對越來越少的元素重複上面的步驟，直到沒有任何一對數字需要比較。
    /// 算法时间复杂度：
    /// 最好时间复杂度：O(n)
    /// 最差时间复杂度：O(n²)
    /// 平均时间复杂度：O(n²)
    func bubbleSort(arr: inout Array<Element>) {
        let count = arr.count
        // 如果数据只有一个，说明已经有序
        if count <= 1 {
            return
        }
        
        // 冒泡排序需要遍历数组长度次数，当n-1次有序时候，已经有序了
        for i in 0..<count - 1 {
            var flag = false
            for k in 0..<count - i - 1 {
                if arr[k] > arr[k + 1] {
                    arr.swapAt(k, k + 1)
                    // 发生数据交换
                    flag = true
                }
            }
            // 如果没发生数据交换，证明是有序
            if !flag {
                return
            }
        }
    }
    
    /* 2. 插入排序(insertion sort)
     * wiki: 通过构建有序序列，对于未排序数据，在已排序序列中从后向前扫描，找到相应位置并插入。
     * 算法步骤：
     * 1. 从第一个元素开始，该元素可以认为已经被排序
     * 2. 取出下一个元素，在已经排序的元素序列中从后向前扫描
     * 3. 如果该元素（已排序）大于新元素，将该元素移到下一位置
     * 4. 重复步骤3，直到找到已排序的元素小于或者等于新元素的位置
     * 5. 将新元素插入到该位置后
     * 6. 重复步骤2~5
     * 算法时间复杂度：
     * 最好时间复杂度：O(n)
     * 最差时间复杂度：O(n²)
     * 平均时间复杂度：O(n²)
     */
    func insertionSort(arr: inout Array<Element>) {
        let count = arr.count
        if count <= 1 {
            return
        }
        
        // 第一个数有序，因此，从第二个数开始比较
        for i in 1..<count {
            let value = arr[i]
            // 和有序数列进行比较，有序数列的索引范围是0...i-1
            // 插入排序是从后面往前插入，因此需要reversed
            var insertIndex = i
            for j in (0...i-1).reversed() {
                // 如果待比较数小于当前数，则当前数往后移动一位
                if value < arr[j] {
                    arr[j + 1] = arr[j]
                    insertIndex = j
                }
                else {
                    // 如果待比较数>=当前数，那么就在当前数后面进行插入
                    insertIndex = j + 1
                    break
                }
            }
            arr[insertIndex] = value
        }
    }
    
    /* 3. 选择排序
     * wiki: 首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置，然后，再从剩余未排序元素中继续寻找最小（大）元素，
     * 然后放到已排序序列的末尾。以此类推，直到所有元素均排序完毕
     * 算法步骤：
     * 从第一个元素开始遍历整个序列，找到最小的数和第一个元素进行交换
     * 接着从第二个元素开始，找到最小的数和第二个元素进行交换
     * 以此类推，直到全部有序
     * 算法时间复杂度：
     * 最好时间复杂度：O(n²)
     * 最差时间复杂度：O(n²)
     * 平均时间复杂度：O(n²)
     */
    func selectionSort(arr: inout Array<Element>) {
        let count = arr.count
        if count <= 1 {
            return
        }
        
        for i in 0..<count-1 {
            var minIndex = i
            for j in i+1..<count {
                if arr[j] < arr[minIndex] {
                    minIndex = j
                }
            }
            // 交换
            if i != minIndex {
                arr.swapAt(i, minIndex)
            }
        }
    }
    
    /* 3.1 希尔排序
     * wiki：減增量排序算法
     * 希爾排序是基於插入排序的以下兩點性質而提出改進方法的：
     * 1. 插入排序在對幾乎已經排好序的數據操作時，效率高，即可以達到線性排序的效率
     * 2. 但插入排序一般來說是低效的，因為插入排序每次只能將數據移動一位
     */
    func shellSort(arr: inout Array<Element>) {
        let count = arr.count
        if count <= 1 {
            return
        }
        
        // 步长直接取半
        var step = count >> 1
        while step > 0 {
            // 每次分组，对分组使用插入排序
            for i in 0..<step {
                // 插入排序
                for j in stride(from: i + step, to: count, by: step) {
                    let currentValue = arr[j]
                    var pos = j
                    while pos >= step && arr[pos - step] > currentValue {
                        arr[pos] = arr[pos - step]
                        pos -= step
                    }
                    
                    arr[pos] = currentValue
                }
            }
            
            step >>= 1
        }
    
    }
}
