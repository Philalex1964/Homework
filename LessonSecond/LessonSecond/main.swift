//
//  main.swift
//  LessonSecond
//
//  Created by Александр Филиппов on 28.02.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import Foundation

// Функции
sqrt(4)               // мы передали функции параметр «4», она вернула новое значение «2», которое мы никак не использовали
let x = sqrt(4)      // здесь мы присваиваем возвращаемое функцией значение переменной «x»
let y = 7 + sqrt(4) // используем результат функции в выражении


/*func имя_функции ( внешнее_имя_параметра внутреннее_имя_параметра: тип_параметра ) -> тип_возвращаемого_значения
func имя_функции ( внешнее_и_внутреннее_имя_параметра: тип_параметра ) -> тип_возвращаемого_значения
func имя_функции ( _ внутреннее_имя_параметра: тип_параметра ) -> тип_возвращаемого_значения*/

/*func formatArray (_ array : [String], good : String, andRemoveEvil evil : String) -> [String] {
    var newArray = array
    newArray.append(good)
    if let index = newArray.index(of: evil) {
    newArray.remove(at: index)
}
return newArray
}

let array = ["яблоко", "персик", "лук"]

let goodArray = formatArray(array, good: "клубника", andRemoveEvil: "лук")
print(goodArray)*/

func formatArray (_ array : [String], good : String, evil : String?) -> [String] { //убрали внешнее имя третьего параметра и сделали его опциональным
    var newArray = array
    newArray.append(good)
    if let evil = evil {
        if let index = newArray.index(of: evil) {
        newArray.remove(at: index)
    }
}
    return newArray
}

let array = ["яблоко", "персик", "лук"]

let goodArrayWithEvil = formatArray(array, good: "клубника", evil: nil)

print(goodArrayWithEvil)

let goodArrayWithoutEvil = formatArray(array, good: "банан", evil: "лук")

print(goodArrayWithoutEvil)
