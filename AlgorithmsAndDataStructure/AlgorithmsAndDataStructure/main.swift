//
//  main.swift
//  AlgorithmsAndDataStructure
//
//  Created by Ming Zhang on 2019/8/9.
//  Copyright © 2019 Ming Zhang. All rights reserved.
//

import Foundation

/// 测试LRUCache
//let lrucache = LRUCache<String, String>(4)
//lrucache.set(key: "1", value: "1")
//lrucache.set(key: "2", value: "2")
//lrucache.set(key: "3", value: "3")
//lrucache.set(key: "4", value: "4")
//lrucache.set(key: "4", value: "4")
//lrucache.set(key: "5", value: "5")
//
//let value = lrucache.get(key: "1")
//print(value ?? "")
//
//print(lrucache)

/// 测试回文
//let palindrome1 = "上海自来水来自海上"
//print(palindrome1.isPalindrome())


/// 测试链表反转
//let linkedList = SinglyLinkedList<Int>()
//linkedList.append(value: 1)
//linkedList.append(value: 2)
//linkedList.append(value: 3)
//linkedList.append(value: 4)
//linkedList.append(value: 5)
//linkedList.append(value: 6)
//
////let reverseLinkedList1 = linkedList.reverse()
////print(reverseLinkedList1)
//let reverseLinkedList2 = linkedList.reverseRecursion()
//print(reverseLinkedList2)

/// 检测是否有环
//let circleLinkedList = SinglyLinkedList<Int>()
//
//circleLinkedList.append(value: 1)
//circleLinkedList.append(value: 2)
//
//let node = LinkedListNode<Int>(3)
//circleLinkedList.append(node: node)
//circleLinkedList.append(value: 4)
//circleLinkedList.append(value: 5)
//circleLinkedList.append(value: 6)
//
////let tail = LinkedListNode<Int>(7)
////tail.next = node
////circleLinkedList.append(node: tail)
//
//print(circleLinkedList.checkCircle())
//print(circleLinkedList.checkCircle2())


/// 两个有序链表合并
//let mergeLinkedList1 = SinglyLinkedList<Int>()
//mergeLinkedList1.append(value: 1)
//mergeLinkedList1.append(value: 3)
//mergeLinkedList1.append(value: 5)
//mergeLinkedList1.append(value: 7)
//mergeLinkedList1.append(value: 9)
//
//let mergeLinkedList2 = SinglyLinkedList<Int>()
//mergeLinkedList2.append(value: 2)
//mergeLinkedList2.append(value: 4)
//mergeLinkedList2.append(value: 6)
//mergeLinkedList2.append(value: 8)
//
//let mergeLinkedList = mergeLinkedList1.merge(mergeLinkedList2)
//print(mergeLinkedList)

/// 测试删除链表倒数n个节点
//let deleteLinkedList = SinglyLinkedList<Int>()
//deleteLinkedList.append(value: 1)
//deleteLinkedList.append(value: 2)
//deleteLinkedList.append(value: 3)
//deleteLinkedList.append(value: 4)
//deleteLinkedList.append(value: 5)
//deleteLinkedList.append(value: 6)
//
//let node5 = deleteLinkedList.deleteFromLast(6)
//print(deleteLinkedList)


/// 测试查找链表中间节点
//let middleLinkedList = SinglyLinkedList<Int>()
//middleLinkedList.append(value: 1)
//middleLinkedList.append(value: 2)
//middleLinkedList.append(value: 3)
//middleLinkedList.append(value: 4)
//middleLinkedList.append(value: 5)
//middleLinkedList.append(value: 6)
//
//var middleNode = middleLinkedList.middleNode()
//print(middleNode!.data)
//middleLinkedList.append(value: 7)
//middleNode = middleLinkedList.middleNode()
//print(middleNode!.data)


/// 排序算法测试

var arr = [4, 5, 3, 2, 1, 10, 8, 6, 11, 7]
let sort = SortImplementation<Int>()

// 冒泡
//sort.bubbleSort(arr: &arr)
//print(arr)

// 插入
//sort.insertionSort(arr: &arr)
//print(arr)

// 选择
//sort.selectionSort(arr: &arr)
//print(arr)

// 希尔
//sort.shellSort(arr: &arr)
//print(arr)

// 归并
//sort.mergeSort(arr: &arr)
//print(arr)

//sort.mergeSortInteration(arr: &arr)
//print(arr)

//sort.quickSort(arr: &arr)
//print(arr)


sort.heapSort(arr: &arr)
print(arr)

//sort.countingSort(arr: &arr)
//print(arr)

//let k = sort.findKLargestElement(arr: &arr, k: 1)
//print(k ?? -1)


// 二分查找测试
let binarySearch = BinarySearch<Int>()
//let index = binarySearch.search(arr: arr, value: 3)
//print(index)
//
//let indexRecursion = binarySearch.searchRecursion(arr: arr, value: 3)
//print(indexRecursion)

//let value = binarySearch.square(value: 2.0)
//print(value)

//let arr1 = [1,3,4,5,6,8,8,8,8,11]
//var index = binarySearch.search2(arr: arr1, value: 8)
//print(index ?? -1)
//
//index = binarySearch.search3(arr: arr1, value: 8)
//print(index ?? -1)
//
//index = binarySearch.search4(arr: arr1, value: 8)
//print(index ?? -1)
//
//
//index = binarySearch.search5(arr: arr1, value: 6)
//print(index ?? -1)
//
//index = binarySearch.search6(arr: arr1, value: 6)
//print(index ?? -1)


let arr2 = [4, 5, 6, 7, 8, 1, 2, 3]
let index2 = binarySearch.search7(arr: arr2, target: 8)
print(index2)


