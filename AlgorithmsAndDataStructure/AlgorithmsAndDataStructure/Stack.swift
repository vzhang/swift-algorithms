//
//  Stack.swift
//  AlgorithmsAndDataStructure
//
//  Created by Ming Zhang on 2019/8/11.
//  Copyright © 2019 Ming Zhang. All rights reserved.
//

import Foundation

/// 顺序栈，基于数组实现
/// 时间复杂度：O(1)
/// 空间复杂度：O(1)
struct Stack<Element> {
    var items: [Element]
    var count: Int
    let capacity: Int
    
    init(defaultElement: Element, capacity: Int) {
        self.items = Array(repeating: defaultElement, count: capacity)
        self.capacity = capacity
        count = 0
    }
    
    mutating func push(item: Element) -> Bool {
        if count == capacity {
            return false
        }
        
        items[count] = item
        count += 1
        return true
    }
    
    mutating func pop() -> Element? {
        if count == 0 {
            return nil
        }
        
        let tmp = items[count - 1]
        count -= 1
        return tmp
    }
}
