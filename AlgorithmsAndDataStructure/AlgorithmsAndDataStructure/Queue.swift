//
//  Queue.swift
//  AlgorithmsAndDataStructure
//
//  Created by Ming Zhang on 2019/8/13.
//  Copyright © 2019 Ming Zhang. All rights reserved.
//

import Foundation

/// 队列：用数组实现一个顺序队列
class Queue<Element>: CustomStringConvertible {
    var items: [Element]
    var head: Int = 0
    var tail: Int = 0
    var capacity: Int
    var defaultElement: Element
    
    init(defaultElement: Element, capacity: Int) {
        self.defaultElement = defaultElement
        self.capacity = capacity
        self.items = [Element](repeating: defaultElement, count: capacity)
    }
    
    /// 出队
    func dequeue() -> Element? {
        // 空数据
        if head == tail {
            return nil
        }
        
        // 获取队头数据
        let value = items[head]
        // 移除队头数据
        items[head] = defaultElement
        // 队头索引前进
        head += 1
        return value
    }
    
    /// 入队
//    func enqueue(value: Element) -> Bool {
//        // 没有空间
//        if tail == capacity {
//            return false
//        }
//
//        items[tail] = value
//        tail += 1
//
//        return true
//    }
    
    /// 优化入队
    func enqueue(value: Element) -> Bool {
        if tail == capacity {
            // 数据满了
            if head == 0 {
                return false
            }
            else {
                // 搬移数据
                for i in head..<tail {
                    items[i - head] = items[i]
                    items[i] = defaultElement
                }
                
                tail -= head
                head = 0
            }
        }
        
        items[tail] = value
        tail += 1
        return true
    }
    
    var description: String {
        return items.description
    }
}

/// 循环队列
/// 循环队列判空为head == tail，表明无数据，因此，循环队列中，满数据的判定是head + 1 = tail，留一个空位置，用于区分无数据和满数据场景
/// 例：队列长度为6,数据 1,2,3,4,5,6，
/// 出队三次_,_,_,4,5,6, head = 3, tail = 7
/// 考虑几个满值场景， head=3, tail = 4， 1,2,3,_,5,6,
/// 满数据场景，是(tail+1)%capacity == head
class CycleQueue<Element>: CustomStringConvertible {
    var items: [Element]
    var head: Int = 0
    var tail: Int = 0
    var capacity: Int
    
    init(defaultElement: Element, capacity: Int) {
        self.items = Array<Element>(repeating: defaultElement, count: capacity)
        self.capacity = capacity
    }
    
    func enqueue(item: Element) -> Bool {
        // 满数据
        if (tail + 1) % capacity == head {
            return false
        }
        
        self.items[tail] = item
        tail = (tail + 1) % capacity
        
        return false
    }
    
    func dequeue() -> Element? {
        // 空数据
        if head == tail {
            return nil
        }
       
        let item = self.items[head]
        head = (head + 1) % capacity
        return item
    }
    
    var description: String {
        return items.description
    }
}

/// 队列：用链表实现一个链式队列

class LinkedQueue<Element: Comparable> {
    var linkedList: SinglyLinkedList<Element> = SinglyLinkedList<Element>()
    
    func enqueue(item: Element) {
        linkedList.append(value: item)
    }
    
    func dequeue() -> Element? {
        if let node = linkedList.first() {
            _ = linkedList.delete(node: node)
            return node.data
        }
        return nil
    }
}
