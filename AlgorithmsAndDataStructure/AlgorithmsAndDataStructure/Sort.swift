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


    /* 4. 归并排序
     * wiki：是建立在归并操作上的一种有效的排序算法
     * 归并操作（merge），也叫归并算法，指的是将两个已经排序的序列合并成一个序列的操作。归并排序算法依赖归并操作。
     * 算法步骤：递归法
     * 1. 申请空间，使其大小为两个已经排序序列之和，该空间用来存放合并后的序列
     * 2. 设定两个指针，最初位置分别为两个已经排序序列的起始位置
     * 3. 比较两个指针所指向的元素，选择相对小的元素放入到合并空间，并移动指针到下一位置
     * 4. 重复步骤3直到某一指针到达序列尾
     * 5. 将另一序列剩下的所有元素直接复制到合并序列尾
     * 算法复杂度：
     * 最好时间复杂度：
     */
    func mergeSort(arr: inout Array<Element>) {
        let count = arr.count
        if count <= 1 {
            return
        }
        
        // 定义一个长度等于待排序数组的长度的数组，省去每次开辟新的空间
        var tempArr = Array<Element>(repeating: arr[0], count: count)
        p_mergeSort(arr: &arr, tempArr: &tempArr, startIndex: 0, endIndex: count - 1)
    }
    
    private func p_mergeSort(arr: inout Array<Element>, tempArr: inout Array<Element>, startIndex: Int, endIndex: Int) {
        // 首先找到递归终止条件
        if startIndex >= endIndex {
            return
        }
        
        let mid: Int = (startIndex + endIndex) / 2
        p_mergeSort(arr: &arr, tempArr: &tempArr, startIndex: startIndex, endIndex: mid)
        p_mergeSort(arr: &arr, tempArr: &tempArr, startIndex: mid + 1, endIndex: endIndex)
        
        mergeArr(arr: &arr, tempArr: &tempArr, low: startIndex, mid: mid, high: endIndex)
        
    }
    
    private func mergeArr(arr: inout Array<Element>, tempArr: inout Array<Element>, low: Int, mid: Int, high: Int) {
        
        var j = low
        var k = mid + 1
        
        for i in low...high {
            
            if j > mid {
                // 左边数组已全部排序好
                tempArr[i...high] = arr[k...high]
                break
            }
            else if k > high {
                // 右边数组已全部排序好
                tempArr[i...high] = arr[j...mid]
                break
            }
            
            let lowValue = arr[j]
            let highValue = arr[k]
            
            if lowValue < highValue {
                tempArr[i] = lowValue
                j += 1
            }
            else {
                tempArr[i] = highValue
                k += 1
            }
        }
        
        
        arr[low...high] = tempArr[low...high]
    }
    
    /* 4.1 归并排序
     * 算法步骤：迭代法
     * 1. 将序列每相邻两个数字进行归并操作，形成ceil(n/2)个序列，排序后每个序列包含两/一个元素
     * 2. 若此时序列数不是1个则将上述序列再次归并,形成ceil(n/4)个序列，每个序列包含四/三个元素
     * 3. 重复步骤2，直到所有元素排序完毕，即序列数为1
     */
    func mergeSortInteration(arr: inout Array<Element>) {
        let count = arr.count
        if count <= 1 {
            return
        }
        
        var tempArr = Array<Element>(repeating: arr[0], count: count)
        var step = 1
        while step < count {
            for i in stride(from: 0, to: count, by: step * 2) {
                var pos = i

                var low = i
                var high = i + step

                let lowMax = min(low + step, count)
                let highMax = min(high + step, count)

                while low < lowMax && high < highMax {
                    if arr[low] < arr[high] {
                        tempArr[pos] = arr[low]
                        low += 1
                    }
                    else {
                        tempArr[pos] = arr[high]
                        high += 1
                    }

                    pos += 1
                }

                

                if low < lowMax {
                    tempArr[pos..<highMax] = arr[low..<lowMax]
                }

                if high < highMax {
                    tempArr[pos..<highMax] = arr[high..<highMax]
                }
                
            }
            arr[0..<count] = tempArr[0..<count]

            step <<= 1
        }
    }
    
    
    /* 5. 快速排序
     * wiki: 快速排序使用分治法（Divide and conquer）策略來把一個序列（list）分為较小和较大的2个子序列，然后递归地排序两个子序列。
     * 算法步骤：
     * 1. 挑选基准值：從數列中挑出一個元素，稱為「基準」（pivot）
     * 2. 分割：重新排序數列，所有比基準值小的元素擺放在基準前面，所有比基準值大的元素擺在基準後面（与基准值相等的數可以到任何一邊）。在這個分割結束之後，对基准值的排序就已经完成
     * 3. 递归排序子序列：递归地将小於基准值元素的子序列和大於基准值元素的子序列排序。
     */
    
    func quickSort(arr: inout Array<Element>) {
        let count = arr.count
        if count <= 1 {
            return
        }
        
        //
        p_quickSort(arr: &arr, low: 0, high: count - 1)
    }
    
    private func p_quickSort(arr: inout Array<Element>, low: Int, high: Int) {
        // 终止条件，只有一个元素
        if low >= high {
            return
        }
        
        // 对数列进行分区
        let p = p_partition(arr: &arr, low: low, high: high)
        
        p_quickSort(arr: &arr, low: low, high: p - 1)
        p_quickSort(arr: &arr, low: p + 1, high: high)
    }
    
    // 分区函数,找到pivot的index
    private func p_partition(arr: inout Array<Element>, low: Int, high: Int) -> Int {
        let pivot = arr[high]
        
        var i = low
        
        for j in low...high {
            if arr[j] < pivot {
                arr.swapAt(i, j)
                i += 1
            }
        }
        
        arr.swapAt(i, high)
        
        return i
    }
    
    private func p_partitionDescend(arr: inout Array<Element>, low: Int, high: Int) -> Int {
        let pivot = arr[high]
        
        var i = low
        for j in low...high {
            if arr[j] > pivot {
                arr.swapAt(i, j)
                i += 1
            }
        }
        
        arr.swapAt(i, high)
        
        return i
    }
    
    /// 编程实现O(n)时间复杂度内找到一组数据的第K大元素
    /// 分区找到pivot的位置p，如果p+1=K，则说明，当前p的位置对应的值是所需要找的，
    /// 如果k>p+1, 那么证明需要在A[p+1, n]里面继续查找，反之在A[0, p - 1]里面查找
    func findKLargestElement(arr: inout Array<Element>, k: Int) -> Element? {
        let count = arr.count
        
        if k > count {
            return nil
        }
    
        return p_findKLargestElement(arr: &arr, k: k, low: 0, high: count - 1)
    }
    
    private func p_findKLargestElement(arr: inout Array<Element>, k: Int, low: Int, high: Int) -> Element? {
        let p = p_partitionDescend(arr: &arr, low: low, high: high)
        if k == p + 1 {
            return arr[p]
        }
        
        if k < p + 1 {
            return p_findKLargestElement(arr: &arr, k: k, low: low, high: p - 1)
        }
        else {
            return p_findKLargestElement(arr: &arr, k: k, low: p + 1, high: high)
        }
    }
    
}
