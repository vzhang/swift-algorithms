import UIKit
import Foundation

/// LRU缓存淘汰算法
/// Least Recently Used 最近最少使用
/// 解题思路：
/// 1. 如果此数据在链表中，我们遍历找到对应的数据，并从原来的位置删除，放置在链表头部
/// 2. 如果数据不存在链表中，
/// (1). 如果此时缓存未满，则将此节点插入到链表头部，
/// (2). 如果缓存满了，则删除尾部节点，并把此节点插入到链表头部
class LRUCache<Element: Comparable> {
    /// 缓存容量
    var capacity: Int
    /// 缓存链表
    var linkedList = LinkedList<Element>()
    
    init(_ capacity: Int) {
        self.capacity = max(0, capacity)
    }
    
    
}
