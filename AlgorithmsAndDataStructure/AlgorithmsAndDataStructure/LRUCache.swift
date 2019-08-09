//
//  LRUCache.swift
//  AlgorithmsAndDataStructure
//
//  Created by Ming Zhang on 2019/8/9.
//  Copyright © 2019 Ming Zhang. All rights reserved.
//

import Foundation

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
