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
    
    mutating func peek() -> Element? {
        if count == 0 {
            return nil
        }
        
        return items[count - 1]
    }
}

/// 链式栈：基于链表实现
class LinkedStack<Element: Comparable> {
    var linkedList: SinglyLinkedList<Element> = SinglyLinkedList<Element>()
    
    func push(item: Element) {
        linkedList.append(value: item)
    }
    
    func pop() -> Element? {
        if let node = linkedList.first() {
            _ = linkedList.delete(node: node)
            return node.data
        }
        return nil
    }
}

/// 编程模拟实现一个浏览器的前进、后退功能
class Browse {
    var stack: Stack<String> = Stack<String>(defaultElement: "", capacity: 100)
    var unusedStack: Stack<String> = Stack<String>(defaultElement: "", capacity: 100)
    
    /// 前进
    func next() -> Bool {
        if let url = unusedStack.pop() {
            return stack.push(item: url)
        }
        
        return false
    }
    
    /// 后退
    func back() -> Bool {
        if let url = stack.pop() {
            return unusedStack.push(item: url)
        }
        
        return false
    }
    
    /// 打开新网页
    func newPage(url: String) -> Bool {
        return stack.push(item: url)
    }
    
    var currentPage: String? {
        return stack.peek()
    }
}
