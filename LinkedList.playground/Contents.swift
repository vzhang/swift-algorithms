import UIKit
import Foundation

// 单链表
class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode<T>?
    
    init(_ value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    typealias Node = LinkedListNode<T>
    private var head: Node?
    
    func isEmpty() -> Bool {
        if head == nil {
            return true
        }
        
        return false
    }
    
    func first() -> Node? {
        return head
    }
    
    func last() -> Node? {
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        
        return node
    }
    
    func append(_ value: T) {
        let newNode = Node(value)
        if let tail = last() {
            tail.next = newNode
        }
        else {
            head = newNode
        }
    }
    
    func node(atIndex index: Int) -> Node? {
        if index <= 0 {
            return head
        }
        
        var node = head!.next
        for _ in 1..<index {
            node = node?.next
            if node == nil {
                break
            }
        }
        
        return node
    }
}


var linkedList = LinkedList<Int>()
linkedList.append(1)
linkedList.append(2)
linkedList.append(3)
linkedList.append(4)
linkedList.append(5)

linkedList.isEmpty()
linkedList.first()?.value
linkedList.node(atIndex: 2)?.value
linkedList.node(atIndex: 8)?.value
linkedList.last()?.value


// 双向链表
class DoublyLinkedListNode<T> {
    var value: T
    weak var prev: DoublyLinkedListNode<T>?
    var next: DoublyLinkedListNode<T>?
    
    init(_ value: T) {
        self.value = value
    }
}

class DoublyLinkedList<T> {
    typealias Node = DoublyLinkedListNode<T>
    private var head: Node?
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func first() -> Node? {
        return head
    }
    
    func last() -> Node? {
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        
        return node
    }
    
    func append(_ value: T) {
        let newNode = Node(value)
        if let node = last() {
            newNode.prev = node
            node.next = newNode
        }
        else {
            head = newNode
        }
    }
    
    func node(atIndex index: Int) -> Node? {
        if index <= 0 {
            return head
        }
        
        var node = head!.next
        for _ in 1..<index {
            node = node?.next
            if node == nil {
                break
            }
        }
        
        return node
    }
}


var doublyLinkedList = DoublyLinkedList<Int>()
doublyLinkedList.isEmpty()

doublyLinkedList.append(1)
doublyLinkedList.append(2)
doublyLinkedList.append(3)
doublyLinkedList.append(4)
doublyLinkedList.append(5)

doublyLinkedList.isEmpty()

doublyLinkedList.node(atIndex: 2)?.value
doublyLinkedList.node(atIndex: 2)?.prev?.value
doublyLinkedList.node(atIndex: 2)?.next?.value

// 约瑟夫环问题

// LRU基础实现

// 单链表实现判断一个字符串是否是回文串？

// 判断是否是回文palindrom
func isPalindrome(_ value: String) -> Bool {
    let stringLinkedList = LinkedList<String>()
    for charc in value {
        stringLinkedList.append(String(charc))
    }
    
    return false
}

isPalindrome("abccba")
isPalindrome("abcba")
isPalindrome("abcdba")
