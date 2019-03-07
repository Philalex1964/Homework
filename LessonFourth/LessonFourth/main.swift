//
//  main.swift
//  LessonFourth
//
//  Created by Александр Филиппов on 07.03.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import Foundation


enum HondaDoorState {
    case open, close
}
enum Transmission {
    case manual, auto
}

enum Color {
    case white, black
}

struct Honda {
    let color: Color
    let mp3: Bool
    let transmission: Transmission
    var km: Double
    var doorState: HondaDoorState
}
var car1 = Honda(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
var car2 = Honda(color: .white, mp3: false, transmission: .auto, km: 120.0, doorState: .close)
print(car1.km,", ", car2.km)   //0.0, 120.0
car2 = car1
print(car1.km,", ", car2.km)  //0.0, 0.0
car1.km = 500.0
print(car1.km,", ", car2.km) //500.0, 0.0








