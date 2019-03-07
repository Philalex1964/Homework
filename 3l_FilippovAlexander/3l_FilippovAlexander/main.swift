//
//  main.swift
//  3l_FilippovAlexander
//
//  Created by Александр Филиппов on 07.03.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//
// Домашнее задание
// 1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
// 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
// 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
// 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
// 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
// 6. Вывести значения свойств экземпляров в консоль.

import Foundation

enum VehicleType {
    case car
    case truck
}

enum Mark {
    case mercedes
    case volvo
}

enum WindowsState {
    case open
    case close
}

enum EngineState {
    case on
    case off
}

enum TrunkState {
    case full
    case empty
}

struct Vehicle {
    var vehicleType : VehicleType = .car
    var mark : Mark = .mercedes
    var productionYear : Int = 2019
    var trunkVolume : Int = 20 { // Контроль оставшегося места в автомобиле
        willSet {
            if (trunkState == .empty) || (trunkVolume > 0) && (trunkVolume != 0) && (newValue < trunkVolume) {
                let space = trunkVolume - newValue
                print ("Free space in the Trunk: \(space)")
            } else { print("Trunk is full.")}
        }
    }
    var engineState : EngineState = .off
    var windowsState : WindowsState = .close
    var trunkState : TrunkState = .empty
    var model : String = "AMG 63"
    
    
    
    // Контроль выключения двигателя. Специально даю задачу привести двигатель в неработающее состояние
    mutating func stopEngine() {
        engineState = engineState == .on ? .off: .off
            print ("Engine is off")
    }
    
    // Контроль закрытия окон. То же самое
    mutating func shutWindow() {
        windowsState = windowsState == .open ? .close : .close
        print ("Windows are closed")
    }
    
    // Контроль разгрузки/загрузки
    mutating func loadUnload() {
        trunkState = trunkState == .empty ? .full : .empty
        if trunkState == .empty {
            print ("Ready for Loading")
        } else{
        print ("Ready for Unloading")
        }
    }
    init (vehicleType: VehicleType, mark: Mark, productionYear: Int, trunkVolume: Int, trunkState: TrunkState, windowsState: WindowsState, engineState: EngineState) {
        model = "AMG 63"
        self.mark = mark
        self.vehicleType = vehicleType
        self.productionYear = productionYear
        self.trunkVolume = trunkVolume
        self.engineState = engineState
        self.windowsState = windowsState
        self.trunkState = trunkState
    }
}


var car1 = Vehicle(vehicleType: .car, mark: .mercedes, productionYear: 2018, trunkVolume: 10, trunkState: .empty, windowsState: .close, engineState: .off)

var car3 = Vehicle(vehicleType: .car, mark: .volvo, productionYear: 2019, trunkVolume: 20, trunkState: .empty, windowsState: .close, engineState: .off)

var truck1 = Vehicle(vehicleType: .truck, mark: .volvo, productionYear: 2018, trunkVolume: 100, trunkState: .full, windowsState: .close, engineState: .off)


//func printVehicle () {
    print("Vehicle is \(vehicleType), mark is \(mark), year is\(productionYear), trunk capacity is \(trunkVolume) and is \(trunkState), windows are \(windowsState) and engine is \(engineState).")
//}








