//
//  main.swift
//  4l_FilippovAlexander
//
//  Created by Александр Филиппов on 09.03.2019.
//  Copyright © 2019 Philalex. All rights reserved.






import Foundation

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

enum VehicleType {
    case car
    case truck
    case sportCar
}

enum Mark {
    case mercedes
    case volvo
    case mazda
}

enum WindowsState {
    case open
    case closed
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
        
        Vehicle.carCount += 1
    }
    
    static func countInfo(){
        print("Выпущено \(carCount) автомобилей")
    }
    
    func startEngine() {
        engineState = engineState == .off ? .on: .on
    }
    
    func loadUnload() {
        trunkState = trunkState == .empty ? .full : .empty
        if trunkState == .empty {
        print ("Ready for Loading")
        } else{
        print ("Ready for Unloading")
        }
    }
    
    func shutWindow() {
        windowsState = windowsState == .open ? .closed : .closed
        print ("Windows are closed")
    }
    
    func vehicleInfo() {
        print("This is \(vehicleType), mark \(mark), model \(model), \nmunufactured in \(productionYear), engine is \(engineState), windows \(windowsState) \nand the trunk is \(trunkState).")
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
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
    
    override func startEngine() {
        engineState = engineState == .off ? .on: .on
        turbo = turbo == .off ? .on: .on
    }
    
    override func vehicleInfo() {
        print("This is \(vehicleType), mark \(mark), model \(model), \nmunufactured in \(productionYear), with tuning \(tuning) \nengine is \(engineState), turbo is \(turbo), \nwindows \(windowsState) and the trunk is \(trunkState).")
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
    
    override func loadUnload() {
        trunkState = trunkState == .empty ? .full : .empty
        if trunkState == .empty {
            print ("Ready for Loading")
        } else{
            print ("Ready for Unloading")
        }
        trailersNumber = trailersNumber == .one ? .two : .two
    }
    
    override func vehicleInfo() {
        print("This is \(vehicleType), mark \(mark), model \(model), \nmunufactured in \(productionYear), engine is \(engineState), \nwith \(trailersNumber) trailers, with 3 axles \(threeAxles), \nwindows \(windowsState) and the trunk is \(trunkState).")
    }

}
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.

var vehicle1 = Vehicle(vehicleType: .car, mark: .volvo, productionYear: 2018, engineState: .on, windowsState: .closed, trunkState: .empty, model: "XC-70")

var vehicle2 = Vehicle(vehicleType: .truck, mark: .mercedes, productionYear: 2018, engineState: .off, windowsState: .closed, trunkState: .empty, model: "Actros")

var sportCar1 = SportCar(vehicleType: .car, mark: .mazda, productionYear: 2019, engineState: .off, windowsState: .closed, trunkState: .empty, model: "RX-7", turbo: .off, tuning: true)

var sportCar2 = SportCar(vehicleType: .car, mark: .mercedes, productionYear: 2019, engineState: .off, windowsState: .closed, trunkState: .empty, model: "AMG 63", turbo: .off, tuning: true)

var truck1 = TrunkTruck(vehicleType: .truck, mark: .volvo, productionYear: 2018, engineState: .off, windowsState: .closed, trunkState: .empty, model: "FH16", trailersNumber: .one, threeAxles: true)



vehicle1.startEngine()
vehicle2.loadUnload()
sportCar1.startEngine()
sportCar2.shutWindow()
truck1.loadUnload()

//6. Вывести значения свойств экземпляров в консоль.

vehicle1.vehicleInfo()
vehicle2.vehicleInfo()
sportCar1.vehicleInfo()
sportCar2.vehicleInfo()
truck1.vehicleInfo()




    

