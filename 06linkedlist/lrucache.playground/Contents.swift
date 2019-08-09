import Foundation

/// 实现单链表
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

class SinglytLinkedList<Element: Comparable>: CustomStringConvertible {
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

/* LRU缓存淘汰算法
 * Least Recently Used 最近最少使用
 * 解题思路：
 * 1. 如果此数据在链表中，我们遍历找到对应的数据，并从原来的位置删除，放置在链表头部
 * 2. 如果数据不存在链表中，
 * (1). 如果此时缓存未满，则将此节点插入到链表头部，
 * (2). 如果缓存满了，则删除尾部节点，并把此节点插入到链表头部
 */
class LRUCache<K: Hashable, V: Comparable>: CustomStringConvertible {
    
    private struct LRUCacheElement<K: Hashable, V: Comparable>: Comparable {
        var key: K
        var value: V
        
        init(key: K, value: V) {
            self.key = key
            self.value = value
        }
        
        static func <(p1: LRUCacheElement, p2: LRUCacheElement) -> Bool {
            return p1.value < p2.value
        }
    }
    
    /// 缓存容量
    var capacity: Int
    /// 缓存链表
    private var linkedList = SinglyLinkedList<LRUCacheElement<K, V>>()
    
    var description: String  {
        return linkedList.description
    }
    
    init(_ capacity: Int) {
        self.capacity = max(0, capacity)
    }
    
    func get(key: K) -> V? {
        var node = linkedList.first()
        while node != nil && node!.data.key != key {
            node = node?.next
        }
        
        return node?.data.value
    }
    
    func set(key: K, value: V) {
        let newNodeValue = LRUCacheElement(key: key, value: value)
        // 查找是否有对应的节点
        var currentNode = linkedList.first()
        var previousNode = currentNode
        while currentNode != nil && currentNode!.data.value != value {
            previousNode = currentNode
            currentNode = currentNode?.next
        }
        
        // 表明头部节点
        if previousNode === currentNode {
            linkedList.append(value: newNodeValue)
        }
        else {
            if currentNode == nil {
                if linkedList.size >= capacity {
                    // 删除最后一个节点
                    if let last = linkedList.last() {
                        _ = linkedList.delete(node: last)
                    }
                }
                
                linkedList.append(value: newNodeValue)
            }
            else {
                _ = linkedList.delete(node: currentNode!)
                _ = linkedList.insert(node: currentNode!, at: 0)
            }
        }
    }
}


/// 测试LRUCache
let lrucache = LRUCache<String, String>(4)
lrucache.set(key: "1", value: "1")
lrucache.set(key: "2", value: "2")
lrucache.set(key: "3", value: "3")
lrucache.set(key: "4", value: "4")
lrucache.set(key: "4", value: "4")
lrucache.set(key: "5", value: "5")

let value = lrucache.get(key: "1")
print(value ?? "")

print(lrucache)
