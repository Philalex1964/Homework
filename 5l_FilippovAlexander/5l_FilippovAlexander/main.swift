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
    case close, open
    mutating func toogle() {
        switch self {
        case .close:
            self = .open
        case .open:
            self = .close
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
    case close, open
        mutating func toogle() {
            switch self {
            case .close:
                self = .open
            case .open:
                self = .close
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
        doors = doors == .open ? .close : .close
    }
}

//var doors = DoorsState.close
//doors.toogle()
//print(doors)

extension VehicleProtocol {
    mutating func shutWindow(){
        windows = windows == .open ? .close : .close
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
        return "The car is: \n\(mark), model: \(model), \nproduced in \(productionYear), engine is \(engine) and turbo is \(turbo), \nand it has tunining and it's \(tuning)!"
    }
   
}

extension TankCar: CustomStringConvertible {
    
    var description: String {
        return "The tanker is: \n\(mark), model: \(model), \nproduced in \(productionYear), engine is \(engine), \nand it has \(tanksNumber) tanks, \nand it has doors \(doors)!"
    }
    
}




