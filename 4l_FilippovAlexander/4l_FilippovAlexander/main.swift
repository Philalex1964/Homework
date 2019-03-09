//
//  main.swift
//  4l_FilippovAlexander
//
//  Created by Александр Филиппов on 09.03.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

//

//

//
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//
//6. Вывести значения свойств экземпляров в консоль.



import Foundation

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

enum VehicleType {
    case car
    case truck
}

enum Mark {
    case mercedes
    case volvo
    case honda
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
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
enum EngineTurbo {
    case on, off
}

enum TrailersNumber { // количество прицепов
    case one, two
}


class Vehicle {
    var vehicleType : VehicleType
    var mark : Mark
    let productionYear : Int
    var engineState : EngineState
    var windowsState : WindowsState
    var trunkState : TrunkState
    var model : String
    
    static var carCount = 0

    
    init(vehicleType: VehicleType, mark: Mark, productionYear: Int, engineState: EngineState, windowsState: WindowsState, trunkState: TrunkState, model: String) {
        self.vehicleType = vehicleType
        self.mark = mark
        self.productionYear = productionYear
        self.engineState = engineState
        self.windowsState = windowsState
        self.trunkState = trunkState
        self.model = model
        
        func countInfo(){
            
        }
            
    }
        
}
    
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.

class SportCar: Vehicle {
    var turbo : EngineTurbo
    var tuning : Bool
    
    init(vehicleType: VehicleType, mark: Mark, productionYear: Int, engineState: EngineState, windowsState: WindowsState, trunkState: TrunkState, model: String, turbo : EngineTurbo, tuning: Bool) {
        self.turbo = turbo
        self.tuning = tuning
        super.init(vehicleType: vehicleType, mark: mark, productionYear: productionYear, engineState: engineState, windowsState: windowsState, trunkState: trunkState, model: model)
    }
}

class TrunkTruck: Vehicle { //trunkCar совсем плохо, т.к. Car - это легковая машина, а trunk - багажник
    var trailersNumber : TrailersNumber
    var threeAxles : Bool //3 моста
    
    init(vehicleType: VehicleType, mark: Mark, productionYear: Int, engineState: EngineState, windowsState: WindowsState, trunkState: TrunkState, model: String, trailersNumber: TrailersNumber, threeAxles: Bool) {
        self.threeAxles = threeAxles
        self.trailersNumber = trailersNumber
        super.init(vehicleType: vehicleType, mark: mark, productionYear: productionYear, engineState: engineState, windowsState: windowsState, trunkState: trunkState, model: model)
        
    }
}





    /*/ Контроль выключения двигателя. Специально даю задачу привести двигатель в неработающее состояние
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
    
    func printVehicle () {
        print("Vehicle is a \(vehicleType), \nmark is \(mark), \nyear is \(productionYear), \ntrunk capacity is \(trunkVolume) and is \(trunkState), \nwindows are \(windowsState)d \nand engine is \(engineState).")
    }*/
    



//var car1 = Vehicle(vehicleType: .car, mark: .mercedes, productionYear: 2018, trunkVolume: 10, trunkState: .empty, windowsState: .close, engineState: .off)
//
//var car2 = Vehicle(vehicleType: .car, mark: .volvo, productionYear: 2019, trunkVolume: 20, trunkState: .empty, windowsState: .close, engineState: .off)
//
//var truck1 = Vehicle(vehicleType: .truck, mark: .volvo, productionYear: 2018, trunkVolume: 100, trunkState: .full, windowsState: .close, engineState: .off)
//
//car1.printVehicle()
//car2.printVehicle()
//truck1.printVehicle()

