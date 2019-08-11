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

/// 单链表实现
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
    
    /// 单链表反转-非递归方法
    func reverse() -> SinglyLinkedList<Element> {
        let reverseLinkedList = SinglyLinkedList<Element>()
        
        var prev:Node?
        var node = head
        while node != nil {
            let nextNode = node?.next
            node?.next = prev
            prev = node
            node = nextNode
        }
        
        if let prev = prev {
            reverseLinkedList.append(node: prev)
        }
        return reverseLinkedList
    }
    
    /// 单链表反转，递归
    func reverseRecursion() -> SinglyLinkedList<Element> {
        let reverseLinkedList = SinglyLinkedList<Element>()
        if let head = head {
            if let node = reverseNode(head) {
                reverseLinkedList.append(node: node)
            }
        }
        return reverseLinkedList
    }
    
    /*
     * 思想：head.next = nil, head.next.next = head, head.next.next.next = head.next...
     */
    private func reverseNode(_ node: Node?) -> Node? {
        // 首先找到停止条件
        if node?.next == nil {
            return node
        }
        
        let newNode = reverseNode(node?.next)
        node?.next?.next = node
        node?.next = nil
        return newNode
    }
    
    /// 检测链表是否有环
    /// 链表的尾结点指向了链表中的某个节点
    /// 解法1：快慢指针，快指针p一次两步，慢指针q一次一步，如果出现p=q,则证明有环
    func checkCircle() -> Bool {
        var fast = head
        var slow = head
        while fast != nil && slow != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if fast === slow {
                return true
            }
        }
        
        return false
    }
    
    /// 解法2： 使用两个指针p，q，p总是向前走，但q节点每次都从头开始走，对于每个节点，看p走的步数和q是否一致
    func checkCircle2() -> Bool {
        var p = head
        var pIndex = 0
        while p != nil {
            var q = head
            var qIndex = 0
            pIndex += 1
            while q != nil {
                qIndex += 1
                if p === q {
                    if qIndex == pIndex {
                        break
                    }
                    else {
                        return true
                    }
                }
                
                q = q?.next
            }
            
            p = p?.next
        }
        
        return false
    }
    
    /// 两个有序列表合并
    func merge(_ with: SinglyLinkedList<Element>) -> SinglyLinkedList<Element> {
        let mergeLinkedList = SinglyLinkedList<Element>()
        var p = head
        var q = with.head
        
        while p != nil && q != nil {
            if p!.data < q!.data {
                if let appendNode = p {
                    p = p?.next
                    appendNode.next = nil
                    mergeLinkedList.append(node: appendNode)
                }
            }
            else {
                if let appendNode = q {
                    q = q?.next
                    appendNode.next = nil
                    mergeLinkedList.append(node: appendNode)
                }
            }
        }
        
        if let p = p {
            mergeLinkedList.append(node: p)
        }
        
        if let q = q {
            mergeLinkedList.append(node: q)
        }
        
        return mergeLinkedList
    }
    
    /// 删除链表倒数第 n 个结点
    /// 只允许遍历一次
    /// 解题思路，两个指针，一个指针比另外一个快n步，这样当快指针走到尾结点的时候，慢指针就是结果
    func deleteFromLast(_ index: Int) -> Node? {
        
        var prev: Node?
        var fast = head
        var slow = head
        var pos = 0
        
        while fast != nil {
            fast = fast?.next
            if pos == index {
                prev = slow
                slow = slow?.next
            }
            else {
                pos += 1
            }
        }
        
        // 删除节点
        if prev != nil {
            prev?.next = slow?.next
        }
        else {
            head = slow?.next
        }
        return slow
    }
    
    /// 链表的中间结点
    /// 解题思路：快慢指针，快指针一次两步，慢指针一次一步
    func middleNode() -> Node? {
        var slow = head
        var fast = head
        
        while fast?.next != nil && fast?.next?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        return slow
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
