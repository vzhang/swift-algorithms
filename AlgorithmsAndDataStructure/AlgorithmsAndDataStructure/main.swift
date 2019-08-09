//
//  main.swift
//  AlgorithmsAndDataStructure
//
//  Created by Ming Zhang on 2019/8/9.
//  Copyright © 2019 Ming Zhang. All rights reserved.
//

import Foundation

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
