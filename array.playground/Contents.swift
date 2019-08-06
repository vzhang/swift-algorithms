import UIKit
import Foundation

/*
 * 数组
 */

/*
 * 1. 实现一个支持动态扩容的数组
 */

struct MutableArray<Element> {
    private var data: [Element]
    private var capacity = 0
    private var count = 0
    private var defaultElement: Element
    
    /// 构造方法
    /// - parameter defaultElement: 默认元素
    /// - parameter capacity: 数组长度
    init(defaultElement:Element, capacity: Int) {
        self.defaultElement = defaultElement
        data = [Element](repeating: defaultElement, count: capacity)
        self.capacity = capacity
    }
    
    /// 添加元素
    /// - parameter value: 插入元素
    /// - returns: 操作结果，true: 成功，false:失败，数组满了
    mutating func add(value: Element) -> Bool {
        if (count >= capacity) {
            // 扩容
            var newData = [Element](repeating: self.defaultElement, count: capacity * 2)
            self.capacity = capacity * 2;
            // 复制数据
            for i in 0..<count {
                newData[i] = data[i]
            }
            
            data = newData
        }
        
        guard count < capacity else {
            return false
        }
        data[count] = value
        count += 1
        return true
    }
    
    /// 删除元素
    /// - parameter at: 元素索引位置
    /// - returns: 操作结果, true: 成功， false: 失败
    mutating func delete(at index: Int) -> Bool {
        guard index >= 0, index < count else {
            return false
        }
        
        // 移动操作
        for i in index...count-1 {
            data[i] = data[i+1]
        }
        
        count -= 1
        return true
    }
    
    /// 插入元素
    /// - parameter value: 插入元素值
    /// - parameter index: 插入索引位置
    /// - returns: 操作结果, true: 成功， false: 失败
    mutating func insert(_ value: Element, at index: Int) -> Bool {
        guard index >= 0, index < count, count < capacity else {
            return false
        }
        
        if (index == count) {
            self.add(value: value)
        }
        else {
            // 移动操作
            for i in (index...count-1).reversed() {
                data[i + 1] = data[i]
            }
            
            data[index] = value
        }
        
        count += 1
        
        return true
    }
    
    /// 查找元素
    /// - parameter index: 查找索引位置
    /// - returns: 操作结果Element
    mutating func find(at index: Int) -> Element? {
        guard index >= 0, index < count else {
            return nil
        }
        
        return data[index]
    }
}


var arr1 = MutableArray.init(defaultElement:0, capacity: 2)
arr1.add(value: 1)
print(arr1)
arr1.add(value: 2)
print(arr1)
arr1.add(value: 3)
print(arr1)
arr1.add(value: 4)
print(arr1)

/*
 * 2. 实现一个大小固定的有序数组，支持动态增删改操作
 */
struct ImmutableArray<Element> {
    private var data: [Element]
    private var capacity = 0
    private var count = 0
    
    /// 构造方法
    /// - parameter defaultElement: 默认元素
    /// - parameter capacity: 数组长度
    init(defaultElement:Element, capacity: Int) {
        data = [Element](repeating: defaultElement, count: capacity)
        self.capacity = capacity
    }
    
    /// 添加元素
    /// - parameter value: 插入元素
    /// - returns: 操作结果，true: 成功，false:失败，数组满了
    mutating func add(value: Element) -> Bool {
        guard count < capacity else {
            return false
        }
        data[count] = value
        count += 1
        return true
    }
    
    /// 删除元素
    /// - parameter at: 元素索引位置
    /// - returns: 操作结果, true: 成功， false: 失败
    mutating func delete(at index: Int) -> Bool {
        guard index >= 0, index < count else {
            return false
        }
        
        // 移动操作
        for i in index...count-1 {
            data[i] = data[i+1]
        }
        
        count -= 1
        return true
    }
    
    /// 插入元素
    /// - parameter value: 插入元素值
    /// - parameter index: 插入索引位置
    /// - returns: 操作结果, true: 成功， false: 失败
    mutating func insert(_ value: Element, at index: Int) -> Bool {
        guard index >= 0, index < count, count < capacity else {
            return false
        }
        
        if (index == count) {
            self.add(value: value)
        }
        else {
            // 移动操作
            for i in (index...count-1).reversed() {
                data[i + 1] = data[i]
            }
            
            data[index] = value
        }
        
        count += 1
        
        return true
    }
    
    /// 查找元素
    /// - parameter index: 查找索引位置
    /// - returns: 操作结果Element
    mutating func find(at index: Int) -> Element? {
        guard index >= 0, index < count else {
            return nil
        }
        
        return data[index]
    }
}


var arr2 = ImmutableArray.init(defaultElement:0, capacity: 10)
arr2.add(value: 1)
arr2.add(value: 2)
arr2.add(value: 3)
arr2.add(value: 4)
print(arr2)
arr2.delete(at: 2)
print(arr2)
arr2.insert(3, at: 2)
print(arr2)
let value = arr2.find(at: 2)
print(value ?? "")


/*
 * 实现两个有序数组合并为一个有序数组
 */

func merge<Element: Comparable>(sortedArr1: Array<Element>, sortedArr2: Array<Element>) -> Array<Element> {
    let count = sortedArr1.count + sortedArr2.count
    if (sortedArr1.count == 0) {
        return sortedArr2
    }
    else if (sortedArr2.count == 0) {
        return sortedArr1
    }
    
    var result = Array<Element>(repeating: sortedArr1.first!, count: count)
    
    var leftIndex = 0
    var rightIndex = 0
    
    for i in 0..<count {
        if (leftIndex >= sortedArr1.count) {
            result[i..<count] = sortedArr2[rightIndex..<sortedArr2.count]
            return result
        }
        else if (rightIndex >= sortedArr2.count) {
            result[i..<count] = sortedArr1[leftIndex..<sortedArr1.count]
            return result
        }
        
        let leftValue = sortedArr1[leftIndex]
        let rightValue = sortedArr2[rightIndex]
        if (leftValue <= rightValue) {
            result[i] = leftValue
            leftIndex += 1
        }
        else {
            result[i] = rightValue
            rightIndex += 1
        }
    }
    
    return result
}

let mergeArr1 = [1,3,5,7,9]
let mergeArr2 = [2,4,6,8,10,11,12,13]

let mergeArr = merge(sortedArr1: mergeArr1, sortedArr2: mergeArr2)
print(mergeArr)
