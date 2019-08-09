//
//  SinglyLinkedList.swift
//  AlgorithmsAndDataStructure
//
//  Created by Ming Zhang on 2019/8/9.
//  Copyright © 2019 Ming Zhang. All rights reserved.
//

import Foundation

/// 节点
class LinkedListNode<Element> {
    public var data: Element
    public var next: LinkedListNode<Element>?
    
    init(_ data: Element) {
        self.data = data
    }
    
    init(_ data: Element, next: LinkedListNode<Element>?) {
        self.data = data
        self.next = next
    }
}

class SinglyLinkedList<Element: Comparable>: CustomStringConvertible {
    public typealias Node = LinkedListNode<Element>
    // 头节点
    private var head: Node?
    
    public var size: Int {
        guard var node = head else {
            return 0
        }
        
        var count = 1
        while let next = node.next {
            count += 1
            node = next
        }
        
        return count
    }
    
    /// 判断链表是否为空
    func isEmpty() -> Bool {
        if (head == nil) {
            return true
        }
        
        return false
    }
    
    /// 第一个节点
    func first() -> Node? {
        return head
    }
    
    /// 最后一个节点
    func last() -> Node? {
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        
        return node
    }
    
    /// 增加节点
    func append(node: Node) {
        guard let tail = last() else {
            head = node
            return
        }
        
        tail.next = node
    }
    
    func append(value: Element) {
        let newNode = Node(value)
        self.append(node: newNode)
    }
    
    /// 插入节点
    func insert(node: Node, at index: NSInteger) -> Bool {
        if (index == 0) {
            node.next = head
            head = node
            return true
        }
        
        var currentNode = head
        var _index = 0
        
        /// index是要插入的位置，因此查找出index-1的节点数据
        for i in 1...index-1 {
            _index = i
            if (currentNode != nil) {
                currentNode = currentNode?.next
            }
            else {
                break
            }
        }
        
        if (_index == index-1 && currentNode != nil) {
            node.next = currentNode?.next
            currentNode?.next = node
            return true
        }
        
        return false
    }
    
    func insert(value: Element, at index: NSInteger) -> Bool {
        let newNode = Node(value)
        return self.insert(node: newNode, at: index)
    }
    
    /// 删除节点
    func delete(node:Node) -> Bool {
        var currentNode:Node? = head
        var previousNode:Node?
        
        while currentNode != nil {
            // 相等，删除
            if (currentNode === node) {
                if (previousNode == nil) {
                    head = currentNode?.next
                }
                else {
                    previousNode?.next = currentNode?.next
                }
                
                return true
            }
            
            previousNode = currentNode
            currentNode = currentNode?.next
        }
        
        return false
    }
    
    /// 删除首个配置值节点
    func delete(value: Element) -> Bool {
        var currentNode:Node? = head
        var previousNode:Node?
        
        while currentNode != nil {
            // 相等，删除
            if (currentNode?.data == value) {
                if (previousNode == nil) {
                    head = currentNode?.next
                }
                else {
                    previousNode?.next = currentNode?.next
                }
                
                return true
            }
            
            previousNode = currentNode
            currentNode = currentNode?.next
        }
        
        return false
    }
    
    // 查找节点
    func node(at index: Int) -> Node? {
        if index <= 0 {
            return head
        }
        
        var node: Node?
        for i in 0...index {
            if i == 0 {
                node = head
            }
            else {
                node = node?.next
            }
            
            if (node == nil) {
                break
            }
        }
        
        return node
    }
    
    var description: String {
        guard var node = head else {
            return "[]"
        }
        
        var result = "[\(node.data)"
        while let next = node.next {
            node = next
            result = "\(result), \(node.data)"
        }
        result = "\(result)]"
        return result
    }
}