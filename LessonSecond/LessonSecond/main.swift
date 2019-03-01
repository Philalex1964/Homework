//
//  main.swift
//  LessonSecond
//
//  Created by Александр Филиппов on 28.02.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import Foundation


let point = (1, 2)
switch point {
case (0, 0):
    print("(0, 0) является точкой отсчета.")
case (-2...2, -2...2):
    print("(\(point.0), \(point.1)) находится рядом с точкой отсчета.")
default:
    print("Точка имеет координаты (\(point.0), \(point.1)).")
}
// Выведет "(1, 2)находится рядом с точкой отсчета."




/*let a = 7
switch  a   {
case 1:
    print ("case 1")
case 7, 8:
    print ("Case 2")
case 3:
    print ("Case 3")
default:
    print ("Default")
    // выполняется, если ни один из вариантов не будет соответствовать значению
}*/

let a = 7
switch  a  {
case 1:
    print ("case 1")
case 7, 8:
    print ("Case 2")
    fallthrough
case 6,9:
    print ("Case 3")
    fallthrough
default:
    print ("Default")

}


