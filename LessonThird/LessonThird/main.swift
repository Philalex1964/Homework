//
//  main.swift
//  LessonThird
//
//  Created by Александр Филиппов on 04.03.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import Foundation

let fio = [
    ("Иванов", "Иван", "Иванович"),
    ("Петров", "Петр", "Петрович"),
    ("Сидоров", "Сидор", "Сидорович"),
    ("Александоров", "Александр", "Александрович")
    ]

/*func printFio(_ fio: [(String, String, String)], mode: Int) {
    for i in fio {
        switch mode {
        case 1:
            print(i.0, i.1, i.2)
        case 2:
            print(i.0, i.1)
        case 3:
            print(i.0)
        default:
            fatalError("Поддерживается только три режима")
        }
    }
}
printFio(fio, mode: 1)


enum PrintFioMode {
    case full
    case middle
    case short
}
func printFio(_ fio: [(String, String, String)], mode: PrintFioMode) {
    for i in fio {
        switch mode {
        case .full:
            print(i.0, i.1, i.2)
        case .middle:
            print(i.0, i.1)
        case .short:
            print(i.0)
        }
    }
}
printFio(fio, mode: .middle)*/


// указываем, что наше перечисление имеет тип String
enum PrintFioMode: String {
    case full = "Подробный режим:" // теперь можем присвоить строковое значение
    case middle = "Обычный режим"
    case short = "Сокращенный режим"
}
func printFio(_ fio: [(String, String, String)], mode: PrintFioMode) {
    // мы можем получить строковое значение через свойство rawValue
    print(mode.rawValue,":\n")
    for i in fio {
        switch mode {
        case .full:
            print(i.0, i.1, i.2)
        case .middle:
            print(i.0, i.1)
        case .short:
            print(i.0)
        }
    }
}
printFio(fio, mode: .middle)






