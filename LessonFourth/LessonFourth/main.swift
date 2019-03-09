//
//  main.swift
//  LessonFourth
//
//  Created by Александр Филиппов on 07.03.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import Foundation

////Пример 1
//enum HondaDoorState {
//    case open, close
//}
//enum Transmission {
//    case manual, auto
//}
//
//enum Color {
//    case white, black
//}
//
//struct Honda {
//    let color: Color
//    let mp3: Bool
//    let transmission: Transmission
//    var km: Double
//    var doorState: HondaDoorState
//}
//var car1 = Honda(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
//var car2 = Honda(color: .white, mp3: false, transmission: .auto, km: 120.0, doorState: .close)
//print(car1.km,", ", car2.km)   //0.0, 120.0
//car2 = car1
//print(car1.km,", ", car2.km)  //0.0, 0.0
//car1.km = 500.0
//print(car1.km,", ", car2.km) //500.0, 0.0
//print(car1 === car2)

////Пример 2
//enum HondaDoorState {
//    case open, close
//}
//enum Transmission {
//    case manual, auto
//}
//
//enum Color {
//    case white, black
//}
//
//class Honda {
//    let color: Color
//    let mp3: Bool
//    let transmission: Transmission
//    var km: Double
//    var doorState: HondaDoorState
//    init(color: Color, mp3: Bool, transmission: Transmission,km: Double, doorState: HondaDoorState) {
//        self.color = color
//        self.mp3 = mp3
//        self.transmission = transmission
//        self.km = km
//        self.doorState = doorState
//    }
//}
//var car1 = Honda(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
//var car2 = Honda(color: .white, mp3: false, transmission: .auto, km: 120.0, doorState: .close)
//print(car1.km,", ", car2.km)   //0.0, 120.0
//car2 = car1
//print(car1.km,", ", car2.km)  //0.0, 0.0
//car1.km = 500.0
//print(car1.km,", ", car2.km) //500.0, 500.0


////Пример 3 Свойства и методы класса
//enum DoorState {
//    case open, close
//}
//enum Transmission {
//    case manual, auto
//}
//
//enum Color {
//    case white, black
//}
//
//class Honda {
//    let color: Color
//    let mp3: Bool
//    let transmission: Transmission
//    var km: Double
//    var doorState: DoorState
//    // ключевое слово static указывает на то, что это свойство класса
//    static var carCount = 0
//
//    init(color: Color, mp3: Bool, transmission: Transmission,km: Double, doorState: DoorState) {
//        self.color = color
//        self.mp3 = mp3
//        self.transmission = transmission
//        self.km = km
//        self.doorState = doorState
//        // в конструкторе будем увеличивать переменную на 1
//        Honda.carCount += 1
//    }
//    static func countInfo(){
//        print("Выпущено \(carCount) автомобилей")
//    }
//
//    func carInfo() {
//       print("Car is Honda, \ncolor is \(color), \nmp3 availaibility is \(mp3), \ntransmission is \(transmission), \ndoors are \(doorState).")
//   }
//
//}
//
//
//
//
//let car1 = Honda(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
//let car2 = Honda(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
//let car3 = Honda(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
//let car4 = Honda(color: .black, mp3: true, transmission: .auto, km: 0, doorState: .close)
//
//
//
////car1.carInfo
//print(Honda.carCount)     // 4
//Honda.countInfo()        // Выпущено 4 автомобилей


////Пример 4. Вспомогательные конструкторы.
//
//
//class Rectangle {
//    var sideA: Double                     // обязательные переменные
//    var sideB: Double
//    init(sideA: Double, sideB: Double) { // обязательный конструктор
//        self.sideA = sideA
//        self.sideB = sideB
//    }
//    convenience init(side: Double){     // вспомогательный  конструктор
//        self.init(sideA: side, sideB: side)
//    }
//}
//
//var rectangle = Rectangle(sideA: 5, sideB: 10)
//var square = Rectangle(side: 5)

Пример 5. Наследование

enum HondaDoorState {
    case open, close
}
enum Transmission {
    case manual, auto
}
enum Color {
    case white, black
}
enum HondaHatchState {
    case open, close
}

class Honda {
    let color: Color
    let mp3: Bool
    let transmission: Transmission
    var km: Double
    var doorState: HondaDoorState
    init(color: Color, mp3: Bool, transmission: Transmission, km: Double, doorState: HondaDoorState) {
        self.color = color
        self.mp3 = mp3
        self.transmission = transmission
        self.km = km
        self.doorState = doorState
    }
}
class HondaSport: Honda { // наследуем HondaSport от Honda
    // мы ничего не пишем здесь
    // и наш новый класс имеет все те же свойства и методы, что и его родитель
    var hatchState : HondaHatchState // Новое свойство


    init(color: Color, mp3: Bool, transmission: Transmission, km: Double, doorState: HondaDoorState, hatchState: HondaHatchState){
     self.hatchState = hatchState // инициализируем новое свойство
          // используем конструктор из родителя, чтобы завершить инициализацию класса
        super.init(color: color, mp3: mp3, transmission: transmission, km: km, doorState: doorState)
    }

    func openHatch() {                  // Новый метод
        hatchState = .open
    }

    func closeHatch() {                // Новый метод
        hatchState = .close
    }

}
var car1 = Honda(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
// мы можем создать объект спорткара
var sportCar1 = HondaSport(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close, hatchState: .close)


class DecorativeHondaSport: HondaSport { // переопределить метод открытия люка
    override func openHatch() {
        super.openHatch()             // вызываем реализацию родителя
        print("Пиииип, открывать люк запрещено")// произносим уведомление
    }



}

var superHondaSportCar = DecorativeHondaSport(color: .black, mp3: true, transmission: .auto, km: 0, doorState: .close, hatchState: .close)



Теперь осталось только добавить все необходимые свойства и методы. Правда, есть один нюанс. Как только вы добавите новое свойство, требующее инициализации, вы получите ошибку. Конструктор родительского класса ничего не знает о нем, и надо написать новый конструктор. Список параметров должен быть полным, включая все параметры, полученные от родителя. А вот присваивание свойств в его реализации будет неполным. Мы обязаны воспользоваться родительским конструктором, чтобы завершить создание объекта. Обратите внимание, что новые свойства мы инициализируем до того, как воспользуемся родительским конструктором. Родительский конструктор вызывается через ссылку «super». Она похожа на «self» и также присутствует во всех методах классов, но ссылается она не на этот объект, а на методы и свойства родителя.

//Пример 6. Деинициализация

/*enum HondaDoorState {
    case open, close
}
enum Transmission {
    case manual, auto
}
enum Color {
    case white, black
}
enum HondaHatchState {
    case open, close
}

class Honda {
    let color: Color
    let mp3: Bool
    let transmission: Transmission
    var km: Double
    var doorState: HondaDoorState
    // ключевое слово static указывает на то, что это свойство класса
    static var carCount = 0
    init(color: Color, mp3: Bool, transmission: Transmission, km: Double, doorState: HondaDoorState) {
        self.color = color
        self.mp3 = mp3
        self.transmission = transmission
        self.km = km
        self.doorState = doorState
        // в конструкторе будем увеличивать переменную на 1
        Honda.carCount += 1
    }
    deinit { // в деструкторе уменьшим количество машин.
        Honda.carCount -= 1
    }
    static func countInfo(){
        print("Всего существует \(self.carCount) автомобиля")
    }
}*/

//let car1 = Honda(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
//var car2: Honda? = Honda(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
//
//print(Honda.carCount) // 2
//car2 = nil
//print(Honda.carCount) // 1

//Пример 7. ARC и управление памятью Счетчик ссылок

//В Swift действует механизм управления памятью под названием ARC – автоматический счетчик ссылок. Работает он просто: для каждого объекта класса ведется подсчет ссылок на него. Пока ссылок больше нуля, объект может спокойно существовать в памяти. Как только количество ссылок становится равным нулю, объект потенциально готов к удалению.

//ссылка - Это просто переменная, которая указывает на объект. И если говорить простым языком, пока на объект указывает хотя бы одна переменная, он будет существовать в памяти.


//// создадим 5 объектов, на каждый из них будет указывать одна ссылка
//let car1 = Honda(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
//var car2 = Honda(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
//var car3 = Honda(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
//var car4 = Honda(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
//var car5 = Honda(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
////Honda.carCount // существует 5 машин
//// присвоим каждой переменной значение car1.
//print(Honda.carCount)
//car2 = car1
//car3 = car1
//car4 = car1
//car5 = car1
//// теперь на первый автомобиль указывает 5 переменных
//// на оставшиеся 4 автомобиля не указывает ни одна переменная.
//print(Honda.carCount) // существует 1 машина

//Создадим пять машин, но четыре из них создадим внутри оператора «if». Как вы помните, внутри фигурных скобок создается новая область видимости. Все переменные, созданные внутри нее, автоматически уничтожаются, как только процесс выполнения программы покидает такую область. Так как переменные уничтожились, счетчик ссылок объектов, на которые они ссылались, стал равным нулю, и объекты уничтожились.


// создадим 1 объект
//let car1 = Honda(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
//let x = 10
//// объявим if. Как вы помните, он создает новую область видимости
//if x == 10 {
//    // внутри if создадим еще 4 объекта
//    var car2 = Honda(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
//    var car3 = Honda(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
//    var car4 = Honda(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
//    var car5 = Honda(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
//    print(Honda.carCount) // существует 5 машин
//}
//// за пределами if
//print(Honda.carCount)    // существует 1 машина


//Пример 8 . Циклы удержания и слабые ссылки
//Пока что процесс управления памятью выглядит очень простым и кажется, что никаких особых усилий прилагать не нужно. На самом деле часто в коде могут возникнуть ситуации утечек памяти.
//Утечкой памяти называют ситуации, когда объект больше не доступен разработчику, но из памяти не удаляется. Такие ситуации возникают в результате циклов удержания. Самый простой цикл – когда объект А имеет ссылку на объект Б, а объект Б – ссылку на объект А.


//class Car {
//    var driver: Man?
//    deinit{ // выведем в консоль сообщение о том, что объект удален
//        print("машина удалена из памяти")
//    }
//}
//class Man {
//    var myCar: Car?
//
//    deinit{ // выведем в консоль сообщение о том, что объект удален
//        print("мужчина удален из памяти")
//    }
//}
//// Объявим переменные как опциональные, чтобы иметь возможность присвоить им nil
//var car: Car? = Car()
//var man: Man? = Man()
//// машина теперь имеет ссылку на мужчину
//car?.driver = man
//// а мужчина на машину
//man?.myCar = car
//// присвоим nil переменным, удалим эти ссылки
//car = nil
////// руками очистим ссылку на водител
//man?.myCar = nil
//man = nil
// мы больше не можем никак обратиться к нашим объектам, но они продолжают существовать в памяти

//Гораздо удобнее использовать так называемые «слабые ссылки». Слабые ссылки помечаются ключевым словом «weak» и не участвуют в процессе подсчета ссылок.
//Давайте пометим переменную «driver» у класса «Car» как слабую и увидим, что объекты были удалены из памяти. Обратите внимание, что мы не сделали слабыми обе ссылки. Это сделано, чтобы, даже если извне не осталось переменных на машину, она не удалялась из памяти, пока жив ее владелец или пока он не поменяет машину.

/*class Car {
    weak var driver: Man?
    deinit{ // выведем в консоль сообщение о том, что объект удален
        print("машина удалена из памяти")
    }
}
class Man {
    var myCar: Car?

    deinit{ // выведем в консоль сообщение о том, что объект удален
        print("мужчина удален из памяти")
    }
}
// Объявим переменные как опциональные, чтобы иметь возможность присвоить им nil
var car: Car? = Car()
var man: Man? = Man()
// машина теперь имеет ссылку на мужчину
car?.driver = man
// а мужчина на машину
man?.myCar = car
// присвоим nil переменным, удалим эти ссылки
car = nil
man = nil*/

//Неправильный пример?
//class Man {
//    var myPassport: Passport?
//    deinit{     // выведем в консоль сообщение о том, что объект удален
//        print ("мужчина удален из памяти")
//    }
//}
//class Passport {
//    unowned let man: Man
//    init(man: Man) {
//        self.man = man
//    }
//    deinit{     // выведем в консоль сообщение о том, что объект удален
//        print("паспорт удален из памяти")
//    }
//}
//var man: Man? = Man()
//var passport: Passport? = Passport(man: man!)
//passport = nil // объект еще не удален, его удерживает мужчина
//man = nil     // теперь удалены оба объекта

//ПРИМЕР ЛЕКЦИЯ

/*class DeinitTestClass {
    var array :[Int] = [Int]()
    init() {
        for _ in 1...100000000{
        array.append(999999999999)
        }
    }
    
}

var test : DeinitTestClass? = DeinitTestClass ()

test = nil
usleep(10000)*/


