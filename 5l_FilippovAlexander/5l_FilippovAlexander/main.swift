//
//  main.swift
//  5l_FilippovAlexander
//
//  Created by Александр Филиппов on 12.03.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

// 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.

//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

import Foundation

// 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.

protocol Tooglable {
    mutating func toogle()
}

enum WindowsState: Tooglable {
    case closed, opened
    mutating func toogle() {
        switch self {
        case .closed:
            self = .opened
        case .opened:
            self = .closed
        }
    }
}
//var windowsState = WindowsState.open
//windowsState.toogle()
//print(windowsState)

enum EngineState: Tooglable {
    case on, off
    mutating func toogle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

enum DoorsState: Tooglable {
    case closed, opened
        mutating func toogle() {
            switch self {
            case .closed:
                self = .opened
            case .opened:
                self = .closed
            }
        }
}

enum VehicleType {
    case car, tank
}

enum EngineTurbo {
    case on, off
}

enum TanksNumber { // количество цистерн
    case one, two
}

protocol VehicleProtocol {
    var vehicleType : VehicleType { get set }
    var mark : String { get set }
    var model : String { get set }
    var productionYear : Int { get set }
    var windows : WindowsState { get set }
    var engine : EngineState { get set }
    var doors : DoorsState { get set }

    mutating func startEngine()
    mutating func shutWindow()
    mutating func shutDoors()

}

//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

extension VehicleProtocol {
    mutating func shutDoors(){
        doors = doors == .opened ? .closed : .closed
    }
}

//var doors = DoorsState.closed
//doors.toogle()
//print(doors)

extension VehicleProtocol {
    mutating func shutWindow(){
        windows = windows == .opened ? .closed : .closed
    }
}

extension VehicleProtocol {
    mutating func startEngine(){
        engine = engine == .off ? .on : .on
    }
}

//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

class Car : VehicleProtocol {
    var vehicleType: VehicleType
    var mark: String
    var model: String
    var productionYear: Int
    var windows: WindowsState
    var engine: EngineState
    var doors: DoorsState
    var turbo : EngineTurbo
    var tuning : Bool
    
    init(vehicleType: VehicleType, mark: String, model: String, productionYear: Int, windows: WindowsState, engine: EngineState, doors: DoorsState, turbo: EngineTurbo, tuning: Bool){
        self.vehicleType = vehicleType
        self.mark = mark
        self.model = model
        self.productionYear = productionYear
        self.windows = windows
        self.engine = engine
        self.doors = doors
        self.turbo = turbo
        self.tuning = tuning
    }
    
    func startEngine() {
        engine = engine == .off ? .on: .on
        turbo = turbo == .off ? .on: .on
    }
    
}

class TankCar : VehicleProtocol {
    var vehicleType: VehicleType
    var mark: String
    var model: String
    var productionYear: Int
    var windows: WindowsState
    var engine: EngineState
    var doors: DoorsState
    var tanksNumber : TanksNumber
    var threeAxles : Bool
    
    init(vehicleType: VehicleType, mark: String, model: String, productionYear: Int, windows: WindowsState, engine: EngineState, doors: DoorsState, tanksNumber : TanksNumber, threeAxles : Bool){
        self.vehicleType = vehicleType
        self.mark = mark
        self.model = model
        self.productionYear = productionYear
        self.windows = windows
        self.engine = engine
        self.doors = doors
        self.tanksNumber = tanksNumber
        self.threeAxles = threeAxles
    }
    
    func addTanksNumber() {
        tanksNumber = tanksNumber == .one ? .two : .two
    }
    
}

//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.


extension Car: CustomStringConvertible {
    
    var description: String {
        return "The car is: \n\(mark), model: \(model), \nproduced in \(productionYear), engine is \(engine) \nand turbo is \(turbo), \ndoors are \(doors), \nand it has tunining and it's \(tuning)!"
    }
   
}

extension TankCar: CustomStringConvertible {
    
    var description: String {
        return "The tanker is: \n\(mark), model: \(model), \nproduced in \(productionYear), engine is \(engine), \nand it has \(tanksNumber) tanks, \nit has doors \(doors) and windows \(windows)!"
    }
    
}

//5. Создать несколько объектов каждого класса. Применить к ним различные действия.

var car1 = Car(vehicleType: .car, mark: "Mercedes", model: "GL-500", productionYear: 2018, windows: .closed, engine: .off, doors: .closed, turbo: .off, tuning: true)

var car2 = Car(vehicleType: .car, mark: "Volvo", model: "XC-70", productionYear: 2018, windows: .closed, engine: .off, doors: .opened, turbo: .off, tuning: true)

var tanker1 = TankCar(vehicleType: .tank, mark: "Man", model: "1200", productionYear: 2019, windows: .opened, engine: .off, doors: .closed, tanksNumber: .one, threeAxles: true)

var tanker2 = TankCar(vehicleType: .tank, mark: "Iveco", model: "M5000", productionYear: 2018, windows: .opened, engine: .off, doors: .closed, tanksNumber: .one, threeAxles: false)


car1.startEngine()
car2.shutDoors()

tanker1.addTanksNumber()
tanker2.shutWindow()
tanker2.startEngine()


//6. Вывести сами объекты в консоль.

print(car1)
print(car2)
print(tanker1)
print(tanker2)






