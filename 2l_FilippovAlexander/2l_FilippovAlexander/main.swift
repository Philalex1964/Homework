//
//  main.swift
//  2l_FilippovAlexander
//
//  Created by Александр Филиппов on 02.03.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

/*Домашнее задание


6 *Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
Пусть переменная p изначально равна двум – первому простому числу.
Зачеркнуть в списке числа от 2p до n, считая шагами по p (это будут числа, кратные p: 2p, 3p, 4p, ...).
Найти первое не зачеркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
Повторять шаги c и d, пока возможно.*/


import Foundation

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


//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func checkNumberDevideByThree (number: Int)  {
    if number % 3 == 0 {
        print("Число \(number) - делится на 3 без остатка.")
    } else {
        print("Число \(number) - не делится на 3 без остатка.")
        
    }
}

checkNumberDevideByThree(number: number)


//3. Создать возрастающий массив из 100 чисел.

var array = [Int] (1...100)
print(array)

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.


for element in array where element % 2 == 0 || element % 3 == 0 {
    array.remove(at: array.index(of: element)!)
}
print (array)


//5. *Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
//Из версий про первые числа 0,1,1 и 1,1,2 предпочитаю оригинальную с кроликами. Соответственно, выбираю вариант 1,1,2


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



