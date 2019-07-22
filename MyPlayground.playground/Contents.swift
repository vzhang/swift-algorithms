import UIKit

var array = [6, 5,10, 4, 3, 2, 1,7,8,9]


func selectionSort(_ array: inout Array<Int>){
    
    for i in 0..<array.count {
        
        var minIndex = i;
        let startIndex = i + 1
        for j in startIndex..<array.count {
            if array[j] < array[minIndex]{
                minIndex = j
            }
        }
        
        if array[i] > array[minIndex] {
             swap(&array, i, minIndex)
        }
    }
    
}

func swap(_ array: inout Array<Int>, _ idx1:Int, _ idx2:Int){
    let temp = array[idx1]
    array[idx1] = array[idx2]
    array[idx2] = temp
}


func insertionSort(_ array: inout Array<Int>){
    
    for i in 1..<array.count {
        
        let key = array[i]
    
        var backIndex = i - 1
        
        while backIndex > 0 && array[backIndex] > key {
            array[backIndex + 1] = array[backIndex]
            backIndex = backIndex - 1
        }
        
        array[backIndex + 1] = key
    }
    
}

func shellInsertionSort(_ array: inout Array<Int>){
    
    var step = array.count / 2
    
    while step > 0 {
        
        for group in 0..<step {
            
            for i in stride(from: group + step, to: array.count - 1, by: step) {
                
                let key = array[i]
                
                var backIndex = i - step
                
                while backIndex >= 0 && array[backIndex] > key {
                    array[backIndex + step] = array[backIndex]
                    backIndex -= step
                }
                
                array[backIndex + step] = key
            }
        }
        step = step / 2;
    }
}


func binInsertionSort(_ array: inout Array<Int>){
    
    for i in 1..<array.count {
        
        var low = 0;
        var high = i - 1
        
        var mid = 0
        
        while high >= low {
            mid = (high + low) / 2
            if array[i] < array[mid]{
                high = mid - 1
            }else{
                low = mid + 1
            }
        }
        
        
        let key = array[i]
        
        for j in stride(from: i, to: low, by: -1){
            array[j] = array[j - 1]
        }
        
        array[low] = key
    }
    
}


array = [6, 5, 4, 10, 3, 2, 1,7,8,9]

func heapSort(_ array: inout Array<Int>){
    // 1. 建堆
    let midIndex = array.count / 2
    
    for i in stride(from: midIndex, to: -1 , by: -1) {
        buillMaxHeap(&array, i, array.count)
    }
    
    for i in stride(from: array.count - 1, to: 0, by: -1) {
        swap(&array, 0, i)
        buillMaxHeap(&array, 0, i)
    }
}


// 建立大顶堆
func buillMaxHeap(_ array: inout Array<Int>, _ topIndex:Int, _ arrayLen:Int){
    
    let leftIndex = 2 * topIndex + 1 // 左子
    let rightIndex = 2 * topIndex + 2 // 右子
    
    var largestIndex = topIndex;
    
    if  leftIndex < arrayLen && array[largestIndex] < array[leftIndex]{
        largestIndex = leftIndex
    }
    
    if  rightIndex < arrayLen && array[largestIndex] < array[rightIndex]{
        largestIndex = rightIndex
    }
    
    if topIndex != largestIndex{
        swap(&array, topIndex, largestIndex)
        buillMaxHeap(&array, largestIndex, arrayLen)
    }
}




