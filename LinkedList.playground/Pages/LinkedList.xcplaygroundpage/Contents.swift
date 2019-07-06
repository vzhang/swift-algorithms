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
// N个人围成一圈，从第一个人开始报数，报到m的人出圈，剩下的人继续从1开始报数，报到m的人出圈；如此往复，直到所有人出圈。

// LRU基础实现

// 单链表实现判断一个字符串是否是回文串？
// 判断是否是回文palindrom
// 时间复杂度是O(n)
// 空间复杂度是O(1)
func isPalindrome(_ value: String) -> Bool {
    // 如果字符串为空，我们也认定它是回文字符串
    if value.count == 0 {
        return true
    }
    let stringLinkedList = LinkedList<String>()
    for charc in value {
        stringLinkedList.append(String(charc))
    }
    
    var prev: LinkedListNode<String>?
    var slow = stringLinkedList.first()
    var fast = stringLinkedList.first()
    
    // 快单链，一次走两步
    // 慢单链，一次走一步
    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        // 慢单链，reverse
        let slowNext = slow?.next
        // 第一个数据，变成最后一个数据,做reverse操作
        slow?.next = prev
        
        // 更新当前prev节点
        prev = slow
        slow = slowNext
    }
    
    if fast != nil {
        slow = slow?.next
    }
    
    while slow != nil {
        if let slowValue = slow?.value,
            let prevValue = prev?.value {
            if slowValue != prevValue {
                return false
            }
        }
        
        slow = slow?.next
        prev = prev?.next
    }
    
    return true
}

isPalindrome("")
isPalindrome("012343210")
isPalindrome("abccba")
isPalindrome("abcba")
isPalindrome("abcdba")
