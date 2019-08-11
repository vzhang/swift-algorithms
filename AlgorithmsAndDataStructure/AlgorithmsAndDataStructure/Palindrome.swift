//
//  Palindrome.swift
//  AlgorithmsAndDataStructure
//
//  Created by Ming Zhang on 2019/8/10.
//  Copyright © 2019 Ming Zhang. All rights reserved.
//

import Foundation

/// 单链表检测字符串是否是回文
/// abcdcba, abccba 类似这种
/// 解题思路，分别使用快慢指针，找到中间节点，慢指针在前进过程中，反转节点
/// 时间复杂度： O(n)
/// 空间复杂度：O(1)
extension String{
    /// 是否是回文字符串
    func isPalindrome() -> Bool {
        /// 转成单链表存储
        let linkedList = SinglyLinkedList<String>()
        for c in self {
            linkedList.append(value: String(c))
        }
       
        var prev: LinkedListNode<String>?
        var slow = linkedList.first()
        var fast = linkedList.first()
        
        while fast != nil && fast?.next != nil {
            // 快指针走两步
            fast = fast?.next?.next
            
            // 慢指针走一步，并反转
            let slowNext = slow?.next
            slow?.next = prev
            prev = slow
            slow = slowNext
        }
        
       
        
        if fast != nil {
            slow = slow?.next
        }
    
        while  slow != nil {
            if let slowValue = slow?.data,
                let fastValue = prev?.data {
                if slowValue != fastValue {
                    return false
                }
            }
            slow = slow?.next
            prev = prev?.next
        }
        
        return true
    }
}
