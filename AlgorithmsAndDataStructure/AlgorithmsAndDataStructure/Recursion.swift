//
//  Recursive.swift
//  AlgorithmsAndDataStructure
//
//  Created by Ming Zhang on 2019/8/13.
//  Copyright © 2019 Ming Zhang. All rights reserved.
//

import Foundation


struct Recursion {
    /// 假设这里有n个台阶，每次你可以跨1个台阶或者2个台阶，请问走n个台阶有多少种走法
    static var hasSolvedList: Dictionary<Int, Int> = Dictionary<Int, Int>()
    static func findSolution(_ count: Int) -> Int {
        if count == 1 {
            return 1
        }
        
        if count == 2 {
            return 2
        }
        
        if hasSolvedList.keys.contains(count) {
            return hasSolvedList[count]!
        }
        
        let ret = findSolution(count - 1) + findSolution(count - 2)
        hasSolvedList[count] = ret
        return ret
    }
    
    /// 编程实现斐波那契数列求值f(n)=f(n-1)+f(n-2)
    static func fibonacci(_ count: Int) -> Int {
        if count == 1 {
            return 1
        }
        
        let ret = fibonacci(count - 1) + fibonacci(count - 2)
        return ret
    }
    
    /// 编程实现求阶乘n!
    static func factorial(_ count: Int) -> Int {
        if count == 1 {
            return 1
        }
        
        let ret = factorial(count - 1) * count
        return ret
    }
    
    /// 编程实现一组数据集合的全排列
    /// 假如有五个数字，12345，请列出所有的排列,结果不能重复.
    /// 12345,13245,13254......
    /// https://blog.csdn.net/jiaobuchong/article/details/85369970
    static func allPermutation(arr: inout Array<Int>, startIndex: Int, endIndex: Int) {
        // 终止条件
        if startIndex == endIndex {
            // 不做处理
            print(arr)
            return
        }
        
        for i in startIndex...endIndex {
            // 过滤重复数据
            if !jungeSwap(arr: &arr, startIndex: startIndex, i: i) {
                continue
            }
            arr.swapAt(startIndex, i)
            allPermutation(arr: &arr, startIndex: startIndex + 1, endIndex: endIndex)
            arr.swapAt(startIndex, i)
        }
    }
    
    private static func jungeSwap(arr: inout Array<Int>, startIndex: Int, i: Int) -> Bool {
        for j in startIndex..<i {
            /**
             * a[i] 是等待被交换的元素
             * 如果 startIndex == i 需要进行交换
             * 如果 在 [cursor, i) 范围里存在和 a[i] 相同的元素则不进行交换，说明这种情况已经存在了
             */
            if arr[j] == arr[i] {
                return false
            }
        }
        
        return true
    }
}




