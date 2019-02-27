//
//  main.swift
//  1l_FilippovAlexander
//
//  Created by Александр Филиппов on 27.02.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

// Задание 1. Решение квадратного уравнения.

import Foundation

var a : Int = 5
var b : Int = 10 //Значения переменных a, b, c можно менять вручную (пока).
var c : Int = 3
a != 0
var x1 : (Float)
var x2 : (Float)

print ("Решить квадратное уравнение: ax^2 + bx + c = 0")
print ("a не равно 0;")
print("Найти корни уравнения.")

var discriminant = b * b - 4 * a * c
print(" D =\(discriminant)")

if discriminant < 0 {
    print("При a = \(String(describing: a)), b = \(b), c = \(String(describing: c)), Уравнение не имеет корней, так как дискриминант меньше 0.")
} else if discriminant == 0 {
    var x1 = (-b)/(2*a)
    print("Корень х =\(x1)")
} else {
    x1 = ((Float)(-b)-sqrt(Float(discriminant)))/(Float(2*a));
    x2 = ((Float)(-b)+sqrt(Float(discriminant)))/(Float(2*a));
    print("Корень х1 =\(x1); корень х2 =\(x2)")
    
}
// Конец первого задания.

// Задание 2. 






