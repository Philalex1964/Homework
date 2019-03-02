//
//  main.swift
//  2l_FilippovAlexander
//
//  Created by Александр Филиппов on 02.03.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

//Домашнее задание


import Foundation


print("Задание 1.")
//1. Написать функцию, которая определяет, четное число или нет.

func checkEvenNumber (number: Int)  {
    if number % 2 == 0 {
        print("Число \(number) - четное.")
    } else {
        print("Число \(number) - нечетное.")

    }
}
var number :Int = 284
checkEvenNumber(number: number)


print("Задание 2.")
//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func checkNumberDevideByThree (number: Int)  {
    if number % 3 == 0 {
        print("Число \(number) - делится на 3 без остатка.")
    } else {
        print("Число \(number) - не делится на 3 без остатка.")
        
    }
}
checkNumberDevideByThree(number: number)


print("Задание 3.")
//3. Создать возрастающий массив из 100 чисел.

var array = [Int] (1...100)
print(array)


print("Задание 4.")
//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for element in array where element % 2 == 0 || element % 3 == 0 {
    array.remove(at: array.index(of: element)!)
}
print (array)


print("Задание 5.")
//5. *Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
//Из версий про первые числа 0,1,1 и 1,1,2 предпочитаю оригинальную с кроликами)) Соответственно, выбираю вариант 1,1,2.

func fibonacciNumber (n: Int) -> (Decimal) {
    if (n<3) {
        return 1
    } else {
        var fn1 : Decimal = 1, fn2 : Decimal = 1, fn3: Decimal
        for _ in 3...n {
            fn3 = fn1+fn2
            fn1 = fn2
            fn2 = fn3
        }
        return fn2
    }
}

var fibonacciArray = [Decimal]()
var n  = 100
for i in 1...n {
    fibonacciArray.append(fibonacciNumber(n: i))
}
print(fibonacciArray)


print("Задание 6.")
// 6 *Заполнить массив из 100 элементов различными простыми числами.

func primeNumbers (number: UInt) -> Bool {
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}

func primeNumbersArray () -> [UInt] {
    var result = [UInt]()
    var i = 2
    while result.count < 100 {
        if primeNumbers(number: UInt(i)) {
            result.append(UInt(i))
        }
        i += 1
    }
    
    return result
}
print (primeNumbersArray())













/*/ Sixth program
func Prime (num: Int) -> Bool {
    if num < 2 {
        return false
    }
    for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    
    return true
}
func PrimeArray () -> [Int] {
    var results = [Int]()
    var i = 2
    while results.count < 100 {
        if Prime(num: i) {
            results.append(i)
        }
        i += 1
    }
    
    return results
}
print (PrimeArray())*/
