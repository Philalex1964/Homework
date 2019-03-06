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
printFio(fio, mode: .middle)


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



enum Some: String { // мы указали тип
    case one       // но не указали значение
}
Some.one.rawValue // оно автоматически стало равно имени варианта



func solveQuadratic( a: Double, b: Double, c: Double) -> (Double?, Double?) {
    if(a != 0) {
        let discr: Double = pow(b, 2) - 4*a*c
        if(discr > 0 ) {
            let sqrOne = (-1) * b/(2 * a) + (sqrt(discr) / (2 * a))
            let sqrTwo = (-1) * b/(2 * a) - (sqrt(discr) / (2 * a))
            return (sqrOne, sqrTwo)
        }
        else if(discr == 0) {
            let sqrOne = (-1) * b/(2 * a)
            return (sqrOne, nil)
        } else {
            return (nil, nil)
        }
    }
    else {
        let sqrOne = (-1) * c / b
        return (sqrOne, nil)
    }
}
let result = solveQuadratic(a: 3, b: 9, c: -12)
if let sqr1 = result.0, let sqr2 = result.1 {
    print("два корня", sqr1, sqr2)
} else if let sqr1 = result.0 {
    print("один корень", sqr1)
} else{
    print("нет корней")
}



enum SolveQuadraticResult{
    case twoSqr(one: Double, two: Double)
    case oneSqr(one: Double)
    case zeroSqr(error: String)
}
func solveQuadratic( a: Double, b: Double, c: Double) -> SolveQuadraticResult {
    if(a != 0) {
        let discr: Double = pow(b, 2) - 4*a*c
        if(discr > 0 ) {
            let sqrOne = (-1) * b/(2 * a) + (sqrt(discr) / (2 * a))
            let sqrTwo = (-1) * b/(2 * a) - (sqrt(discr) / (2 * a))
            return .twoSqr(one: sqrOne, two: sqrTwo)
        }
        else if(discr == 0) {
            let sqrOne = (-1) * b/(2 * a)
            return .oneSqr(one: sqrOne)
        } else {
            return .zeroSqr(error: "Корней нет")
        }
    }
    else {
        let sqrOne = (-1) * c / b
        return .oneSqr(one: sqrOne)
    }
}
let result = solveQuadratic(a: 35, b: 556, c: 456)
switch result {
case .twoSqr(let one, let two):
    print("два корня", one, two)
case let .oneSqr(one):
    print("один корень", one)
case let .zeroSqr(error):
    print(error)
}
*/
 
// СТРУКТУРЫ



enum DoorState {
    case open
    case close
}
enum Transmission {
    case manual
    case auto
}

struct Car {
    var mark : String
    var color : String
    var mp3 : Bool
    var transmission : Transmission
    var km : Int
    var doorState : DoorState
    
    init(color: String, mp3: Bool, transmission: Transmission, km: Int, doorState: DoorState) {
        mark = "Honda"
        self.color = color
        self.mp3 = mp3
        self.transmission = transmission
        self.km = km
        self.doorState = doorState
    }
    
    mutating func addKm(value : Int){
        km += value
    }
    
    mutating func changeDoorState() {
        doorState = doorState == .close ? .open : .close
    }
}
    
var honda = Car(color: "Black", mp3: true, transmission: .auto, km: 0, doorState: .close)
var rangeRover = honda
rangeRover.mark = "Range Rover"
print(honda.mark)
print(rangeRover.mark)

//var mercedes = Car(mark: "Mercedes", color: "White", mp3: true, transmission: .auto, km: 100, doorState: .close)



/*let car1Color = UIColor.white
let car1Mp3 = true
let car1Transmission = Transmission.auto
var car1Km = 0.0
var car1DoorState = HondaDoorState.open

let car2Color = UIColor.black
let car2Mp3 = false
let car2Transmission = Transmission.auto
var car2Km = 0.0
var car2DoorState = HondaDoorState.open

let car3Color = UIColor.red
let car3Mp3 = true
let car3Transmission = Transmission.manual
var car3Km = 12.0
var car3DoorState = HondaDoorState.open
*/



/*struct Circle {
    var radius : Double
    var diameter : Double     {
        willSet {
            print(newValue)
            print("current Value: \(diameter)")
        }
        didSet {
           print("new value \(diameter)")
        }
    }
}

var myCircle = Circle(radius: 10, diameter: 20)

myCircle.diameter = 10



//print(myCircle.radius)
//print(myCircle.diameter)*/

