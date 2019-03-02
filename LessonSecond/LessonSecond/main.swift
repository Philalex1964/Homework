//
//  main.swift
//  LessonSecond
//
//  Created by Александр Филиппов on 28.02.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import Foundation

let array = [5,12,7,32]
for element in array {
    let z = element * 2
    print (z)
}

for _ in 1...5 {
    print ("repeat")
}

for i in stride(from: 0, to: 5, by: 2) {
    print (i)
}
print("=====")

for i in stride(from: 0, to: 9, by: 3) {
    print (i)
}

for element in array where element % 2 == 0 {
    print (element)
}

