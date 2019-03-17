//
//  main.swift
//  6l_FilippovAlexander
//
//  Created by Александр Филиппов on 16.03.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)

//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

import Foundation

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.


protocol PassengerCapacity {
    var passengerCapacity: Int {get set}
}

protocol PricePerHour {
    var pricePerHour: Int {get set}
}

extension PassengerCapacity {
    func pricePerPassenger() {
        var pricePerPassenger: Int = pricePerHour / passengerCapacity
    }
}

enum VehicleType {
    case car, miniBus, Bus
}

enum Range {
    case short, medium, long
}


var pricePerHour: Int


class PassengerCar : PassengerCapacity, PricePerHour {
    var passengerCapacity: Int
    var mark: String
    var vehicleType : VehicleType
    var range : Range
    var pricePerHour: Int
    
    
    init(mark: String, vehicleType: VehicleType, range: Range, passengerCapacity: Int, pricePerHour: Int){
    self.mark = mark
    self.vehicleType = .car
    self.range = range
    self.passengerCapacity = passengerCapacity
    self.pricePerHour = pricePerHour
    }
    
}

class PassengerMiniBus : PassengerCapacity, PricePerHour {
    var passengerCapacity: Int
    var mark: String
    var vehicleType : VehicleType
    var range : Range
    var pricePerHour: Int
    
    init(mark: String, vehicleType: VehicleType, range: Range, passengerCapacity: Int, pricePerHour: Int){
        self.mark = mark
        self.vehicleType = .miniBus
        self.range = range
        self.passengerCapacity = passengerCapacity
        self.pricePerHour = pricePerHour
    }
}

class PassengerBus : PassengerCapacity, PricePerHour {
    var passengerCapacity: Int
    var mark: String
    var vehicleType : VehicleType
    var range : Range
    var pricePerHour: Int
    
    init(mark: String, vehicleType: VehicleType, range: Range, passengerCapacity: Int, pricePerHour: Int){
        self.mark = mark
        self.vehicleType = .Bus
        self.range = range
        self.passengerCapacity = passengerCapacity
        self.pricePerHour = pricePerHour
    }
}

struct StackAutopark<T: PassengerCapacity> {
    var passengerCapacity: Int
    private var elements: [T] = []
    //var mark: String
    var vehicleType : VehicleType
    var range : Range
    var pricePerHour: Int
    
    init(/*mark: String,*/ vehicleType: VehicleType, range: Range, passengerCapacity: Int, pricePerHour: Int) {
        //self.mark = mark
        self.vehicleType = vehicleType
        self.range = range
        self.passengerCapacity = passengerCapacity
        self.pricePerHour = pricePerHour
        }
    
    mutating func push(_ element: T) {
    elements.append(element)
    }
    
    mutating func pop() -> T? {
    return elements.removeLast()
    }
    
    var totalPassengerCapacity : Int {
    var passengerCapacity = 0
    for element in elements {
        passengerCapacity += element.passengerCapacity
        }
        return passengerCapacity
        }
    
    subscript(elements: Int ...) -> Int {
        var passengerCapacity = 0
        
        for index in elements where index >= 0 && index < self.elements.count {
                    passengerCapacity += self.elements[index].passengerCapacity
            }
            return passengerCapacity
        }
    
    func pricePerPassenger() {
        let pricePerPassenger: Int = pricePerHour / passengerCapacity
        print(pricePerPassenger)
    }

}



var stack1 = StackAutopark<PassengerCar>(vehicleType: .car,  range: .short, passengerCapacity: 4, pricePerHour: 400) //Заставил применить конструктор.

stack1.push(PassengerCar(mark: "Mercedes", vehicleType: .car, range: .long, passengerCapacity: 7, pricePerHour: 700))
stack1.push(PassengerCar(mark: "BMW", vehicleType: .car, range: .medium, passengerCapacity: 5, pricePerHour: 500))
stack1.push(PassengerCar(mark: "FW", vehicleType: .car, range: .short, passengerCapacity: 4, pricePerHour: 400))
stack1.push(PassengerCar(mark: "Audi", vehicleType: .car, range: .long, passengerCapacity: 6, pricePerHour: 600))

print(stack1.totalPassengerCapacity)
print(stack1 [0,3])
print(stack1.pricePerPassenger())

var stack2 = StackAutopark<PassengerMiniBus>(vehicleType: .miniBus,  range: .medium, passengerCapacity: 8, pricePerHour: 800) //Заставил применить конструктор.

stack2.push(PassengerMiniBus(mark: "Pegeot", vehicleType: .miniBus, range: .long, passengerCapacity: 8, pricePerHour: 800))
stack2.push(PassengerMiniBus(mark: "Renault", vehicleType: .miniBus, range: .medium, passengerCapacity: 12, pricePerHour: 1200))
stack2.push(PassengerMiniBus(mark: "Fiat", vehicleType: .miniBus, range: .short, passengerCapacity: 20, pricePerHour: 2000))
stack2.push(PassengerMiniBus(mark: "Seat", vehicleType: .miniBus, range: .long, passengerCapacity: 15, pricePerHour: 1500))


print(stack2.totalPassengerCapacity)

print(stack2 [1,2])

print(stack2.pricePerPassenger())

var stack3 = StackAutopark<PassengerBus>(vehicleType: .miniBus,  range: .medium, passengerCapacity: 8, pricePerHour: 800) //Заставил применить конструктор.

stack3.push(PassengerBus(mark: "Volvo", vehicleType: .Bus, range: .long, passengerCapacity: 30, pricePerHour: 20000))
stack3.push(PassengerBus(mark: "Scania", vehicleType: .Bus, range: .long, passengerCapacity: 25, pricePerHour: 18000))
stack3.push(PassengerBus(mark: "Opel", vehicleType: .Bus, range: .short, passengerCapacity: 40, pricePerHour: 30000))
stack3.push(PassengerBus(mark: "Seat", vehicleType: .Bus, range: .long, passengerCapacity: 50, pricePerHour: 35000))

print(stack2.totalPassengerCapacity)

print(stack2 [0,4])

print(stack2.pricePerPassenger())


//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)

var vehicle1 = PassengerCar(mark: "Mercedes", vehicleType: .car, range: .short, passengerCapacity: 4, pricePerHour: 400)
var vehicle2 = PassengerMiniBus(mark: "VW", vehicleType: .miniBus, range: .medium, passengerCapacity: 8, pricePerHour: 800)
var vehicle3 = PassengerBus(mark: "Skania", vehicleType: .Bus, range: .long, passengerCapacity: 30, pricePerHour: 18000)


var stack: [PassengerCapacity] = [vehicle1, vehicle2, vehicle3]

print(stack)

print(stack.filter{$0.passengerCapacity >= 8})

//увеличим вместимость за счет места рядом с водителем =)
print(stack.map{$0.passengerCapacity + 1})

stack.forEach{print($0)}

print(stack.sort{$0.passengerCapacity > $1.passengerCapacity}) //Почему-то sort возвращает () Void?

var stackPrice: [PricePerHour] = [vehicle1, vehicle2, vehicle3]

print(stackPrice.filter{$0.pricePerHour <= 1000})

// дадим скидку 50 рублей =)
print(stackPrice.map{$0.pricePerHour - 50})



print(stackPrice.sort{$0.pricePerHour > $1.pricePerHour}) //Почему-то sort возвращает () Void?




//func filter (stack2: [Any], passengerCapacity : (Int)  -> Bool){
//    var tempArray = [Int]()
//    for element in stack2 {
//        if passengerCapacity(element as! Int){
//            tempArray.append(element as! Int)
//        }
//    }
//    return tempArray
//}
