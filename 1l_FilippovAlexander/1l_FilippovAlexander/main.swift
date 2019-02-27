//
//  main.swift
//  1l_FilippovAlexander
//
//  Created by Александр Филиппов on 27.02.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//
import Foundation

// Задание 1. Решение квадратного уравнения.

var a : Int = 5;
a != 0
var b : Int = 10 //Значения переменных a, b, c можно менять вручную (пока).
var c : Int = 3
var x1 : (Float)
var x2 : (Float)

print("Задание 1. Решение квадратного уравнения.")
print ("Решить квадратное уравнение: ax^2 + bx + c = 0")
print ("a не равно 0;")
print("Найти корни уравнения.")

var discriminant = b*b - 4 * a * c
print("D = \(discriminant)")

if discriminant < 0 {
    print("При a = \(a), b = \(b), c = \(c), уравнение не имеет корней, так как дискриминант меньше 0.")
} else if discriminant == 0 {
    var x1 = (-b)/(2*a)
    print("При a = \(a), b = \(b), c = \(c), корень х =\(x1)")
} else {
    x1 = ((Float)(-b)-sqrt(Float(discriminant)))/(Float(2*a));
    x2 = ((Float)(-b)+sqrt(Float(discriminant)))/(Float(2*a));
    print("При a = \(a), b = \(b), c = \(c), корень х1 =\(x1); корень х2 =\(x2)")
}

print("Конец задания 1.")

// Задание 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

var cathetusA = 10 //Можно изменять значения катетов вручную.
var cathetusB = 15
var x = cathetusA; // Для удобства: Xcode не дал назвать переменные a, b, c.
var y = cathetusB; // Чтобы в команду print и формулы не выводить длинные значения
var hypotenuseC = sqrtf(Float(x*x + y*y))
var z = hypotenuseC;

var square = x * y / 2
var perimeter = x + y + (Int(z))

print("Задание 2. Даны катеты прямоугольного треугольника.")
print("Найти площадь, периметр и гипотенузу треугольника.")
print("При катетах равных \(x) см и \(y):")
print("площадь треугольника будет равна \(square) кв.см,")
print("гипотенуза равна \(z) см, а периметр \(perimeter) см.")

print("Конец задания 2.")






