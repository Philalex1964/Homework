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
    var vehicleType = VehicleType
    var mark : Mark
    var productionYear : Int
    var trunkVolume : Int = 0
    var engineState = EngineState
    var windowsState : WindowsState
    var trunkState = TrunkState
}
var car1 = Vehicle(vehicleType: .car, mark: .mercedes, productionYear: 2018, trunkVolume: 0, engineState: .off, windowsState: .close, trunkState: .empty)

var truck1 = Vehicle(vehicleType: .car, mark: .mercedes, productionYear: 2018, trunkVolume: 0, engineState: .off, windowsState: .close, trunkState: .empty)

var  car2 = Vehicle(vehicleType: <#T##VehicleType.Type#>, mark: <#T##Mark#>, productionYear: <#T##Int#>, trunkVolume: <#T##Int#>, engineState: <#T##EngineState.Type#>, windowsState: <#T##WindowsState#>, trunkState: <#T##TrunkState.Type#><#value#>




    
    





