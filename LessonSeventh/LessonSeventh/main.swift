//
//  main.swift
//  LessonSeventh
//
//  Created by Александр Филиппов on 18.03.2019.
//  Copyright © 2019 Philalex. All rights reserved.

//Обработка ошибок и исключений
//Учимся искать ошибки и предсказывать их появление. Исключения try/catch. Error.


import Foundation

//Error
//nil
//В программе часто происходят ошибочные ситуации. Например, вы хотели посчитать среднюю заработную плату работников – а их не оказалось. Или вы не смогли найти конкретного работника, хотя он должен был быть. Или отправили запрос на сервер, а ответа не пришло.
//Давайте напишем пример. Класс «Factory» олицетворяет предприятие. Словарь – это зарплатная ведомость. Метод «salary» возвращает зарплату для одного работника.

// Наша фабрика
/*class Factory {
    // зарплата рабочих
    fileprivate var employee = [
        "Иванов Иван Иванович": 3000,
        "Сидоров Сидор Сидорович": 12080,
        "Петров Петр Петрович": 8040
    ]
    // получаем зарплату рабочего
    func salary(atFio fio: String) -> Int {
        // так как такого рабочего может и не быть, разворачиваем опциональную переменную
        return employee[fio] ?? 0 //вместо return employee[fio]! чтобы             не обрушить программу
    }
}*/

//Теперь программа не упадет, но есть минус. Мы можем запросить зарплату для рабочего, которого нет, и получим 0. Можно решить, что у него был отпуск без содержания или просто штраф. Программа может работать неправильно, а мы и не узнаем. Самый верный способ решить эту проблему – сделать возвращаемый результат тоже опциональным.


/*class Factory {
    private var employee = [
        "Иванов Иван Иванович": 3000,
        "Сидоров Сидор Сидорович": 12080,
        "Петров Петр Петрович": 8040
    ]
    // теперь метод возвращает опциональное значение
    func salary(atFio fio: String) -> Int? {
        return employee[fio]
    }
}
let factory = Factory()
factory.salary(atFio: "Иванов Иван Иванович")// 3000
factory.salary(atFio: "Брюс Вейн Бэтмэнович")// nil
*/
//Таким образом, при вызове функции мы точно будем знать, что не ошиблись в написании ФИО или в список не закрался фантомный работник.

//Guard
//Давайте добавим метод подсчета средней зарплаты по предприятию.

//class Factory {
//    private var employes = [
//        "Иванов Иван Иванович": 3000,
//        "Сидоров Сидор Сидорович": 12080,
//        "Петров Петр Петрович": 8040
//    ]
    // теперь наш метод возвращает опциональное значение
//    func salary(atFio fio: String) -> Int? {
//        return employes[fio]
//    }
//    func averageSalary() -> Int {
//        var totalSalary = 0
//        for employee in employes {
//            totalSalary += employee.value
//        }
//        return totalSalary / employes.count
//    }
//}
//let factory = Factory()
//factory.salary(atFio: "Иванов Иван Иванович")// 3000
//factory.salary(atFio: "Брюс Вейн Бэтмэнович")// nil
//factory.averageSalary()                     // 7706

//Выглядит отлично, средняя зарплата посчитана. Но есть один неочевидный нюанс: если у нас не будет ни одного сотрудника, мы получим деление на 0, и программа упадет. Это очень распространенная ошибка, так как обычно программист не думает, что кто-то будет рассчитывать зарплату для предприятия, на котором нет сотрудников. Однако опыт говорит об обратном: если программа может упасть, пользователь обязательно ее «уронит».

//Добавим проверку на деление на 0.
//func averageSalary() -> Int {
//    // если на предприятии есть рабочие, считаем среднюю зарплату
//    if employes.count > 0 {
//        var totalSalary = 0
//        for employee in employes {
//            totalSalary += employee.value
//        }
//        return totalSalary / employes.count
//    } else {  // если нет работников, возвращаем 0
//        return 0
//    }
//}
//}


//Теперь мы защищены от ошибки, а пользователь увидит то, что ожидает: если нет работников, их средняя зарплата равна нулю.
//Раньше мы упоминали ключевое слово «guard», но у нас не было с ним примеров. Это отличный шанс им воспользоваться, чтобы сделать код лаконичнее.


/*class Factory {
    private var employee = [
        "Иванов Иван Иванович": 3000,
        "Сидоров Сидор Сидорович": 12080,
        "Петров Петр Петрович": 8040
    ]
    
    func averageSalary() -> Int {
    // нам необходимо, чтобы на предприятии работали сотрудники
    guard employee.count > 0 else { // иначе возвращаем 0
        return 0
    }
    // если наше требование удовлетворено, просто переходим к выполнению метода
    var totalSalary = 0
    for employee in employee {
        totalSalary += employee.value
    }
    return totalSalary / employee.count
    }

}*/
//Посмотрите, что изменилось. Мы заменили «if» на «guard» и вынесли код из вложенного блока. «Guard» очень похож на «if», но имеет другой синтаксис, а главное – семантическое отличие. Его часто называют охранным оператором, так как он охраняет ваш код от выполнения в тех случаях, когда он выполняться не должен.
//«Guard» проверяет условие так же, как и «if», но если условие верно, он не выполняет никаких блоков, а просто переходит к основному коду, объявленному за ним. Если условие не верно, выполняется блок «else», в котором вы можете произвести какие-либо действия для обработки сложившейся ситуации. Самое главное – вы должны покинуть область видимости, например, если вы находитесь в методе, вы обязаны сделать «return». Такой синтаксис делает программу намного читабельнее.


//Error
//Давайте напишем еще один пример, который рекомендуют в Apple. Это простой вендинговый автомат: у нас есть продукты, позиции в наличии и само хранилище в автомате. Покупатель бросает монетки и заказывает товар. Но что, если продукта нет в наличии, или он вообще не продается в нашем автомате, или недостаточно денег? Тогда мы по аналогии с прошлым примером вернем nil.

// позиции в автомате
/*struct Item {
    var price: Int
    var count: Int
    let product: Product
}
// товар
struct Product{
    let name: String
}*/
// вендинговая машина
//class VendingMachine {
//    // хранилище
//    var inventory = [
//        "Candy Bar": Item(price: 12, count: 7, product: Product(name: "Candy Bar")),
//        "Chips": Item(price: 10, count: 4, product: Product(name: "Chips")),
//        "Pretzels": Item(price: 0, count: 11, product: Product(name: "Pretzels"))
//    ]
//    // количество денег, переданное покупателем
//    var coinsDeposited = 0
//    // продаем товар
//    func vend(itemNamed name: String) -> Product? {
//        // если наша машина не знает такого товара вообще, возвращаем nil
//        guard let item = inventory[name] else {
//            return nil
//        }
//        // если товара нет в наличии, возвращаем nil
//        guard item.count > 0 else {
//            return nil
//        }
//        // если недостаточно денег, возвращаем nil
//        guard item.price <= coinsDeposited else {
//            return nil
//        }
//        // продаем товар
//        coinsDeposited -= item.price
//        var newItem = item
//        newItem.count -= 1
//        inventory[name] = newItem
//        print("Dispensing \(name)")
//        return newItem.product
//    }
//}
//let vendingMachine = VendingMachine()
//vendingMachine.vend(itemNamed: "Snikers")    // nil
//vendingMachine.vend(itemNamed: "Candy Bar")  // nil
//vendingMachine.vend(itemNamed: "Pretzels")   // nil



//Посмотрите внимательно: мы попробовали купить несколько товаров, но все попытки завершились неудачей. Каких-то товаров нет в ассортименте, других – в наличии, и денег мы не положили, но мы понятия не имеем, что именно сделали не так, ведь нам всегда возвращается nil без каких-либо пояснений. Вариант обработки ошибок с возвращением nil не очень подходит для случаев, когда нам необходимо получить не только ошибку, но и пояснение, что именно пошло не так.
//Для таких случаев у нас есть специальный протокол «Error». Он применяется к перечислениям, превращая их в перечисление вариантов ошибок. Например, ошибки для нашего автомата будут выглядеть так.

/*enum VendingMachineError: Error {            // ошибки автомата
    case invalidSelection                    // нет в ассортименте
    case outOfStock                          // нет в наличии
    case insufficientFunds(coinsNeeded: Int) // недостаточно денег, передаем недостаточную сумму
}*/

//Теперь перепишем пример. Во-первых, функция продажи будет возвращать кортеж из продукта и ошибки. Оба значения опциональные, ведь если есть ошибка, нет продукта, и наоборот. После покупки товара мы проверим наличие продукта. Если его нет, проверим ошибку, чтобы выяснить, что пошло не так.
// Вендинговая машина

//class VendingMachine {
//    // Хранилище
//    var inventory = [
//        "Candy Bar": Item(price: 12, count: 7, product: Product(name: "Candy Bar")),
//        "Chips": Item(price: 10, count: 4, product: Product(name: "Chips")),
//        "Pretzels": Item(price: 0, count: 11, product: Product(name: "Pretzels"))
//    ]
//    // Количество денег, переданное покупателем
//    var coinsDeposited = 30
//    // Продаем товар
//    func vend(itemNamed name: String) -> (Product?, VendingMachineError?) { // Возвращаем кортеж из товара и ошибки
//        // Если наша машина не знает такого товара вообще
//        guard let item = inventory[name] else {
//            // возвращаем nil вместо продукта и ошибку
//            return (nil, VendingMachineError.invalidSelection)
//        }
//        // Если товара нет в наличии
//        guard item.count > 0 else {
//            // возвращаем nil вместо продукта и ошибку
//            return (nil, VendingMachineError.outOfStock)
//        }
//        // Если недостаточно денег
//        guard item.price <= coinsDeposited else {
//            // возвращаем nil вместо продукта и ошибку
//            return (nil, VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited))
//        }
//        // продаем товар
//        coinsDeposited -= item.price
//        var newItem = item
//        newItem.count -= 1
//        inventory[name] = newItem
//        // Возвращаем nil вместо ошибки и продукт
//        return (newItem.product, nil)
//    }
//}
//let vendingMachine = VendingMachine()
//let sell1 = vendingMachine.vend(itemNamed: "Snikers")   // nil, invalidSelection
//let sell2 = vendingMachine.vend(itemNamed: "Candy Bar") // nil, (insufficientFunds, 12)
//let sell3 = vendingMachine.vend(itemNamed: "Pretzels") // Product("Pretzels"), nil
//if let product = sell1.0 {
//    print("Мы купили: \(product.name)")
//} else if let error = sell1.1 {
//    print("Произошла ошибка: \(error.localizedDescription)")
//}
//Теперь, когда мы совершаем покупку и происходит ошибка, мы получаем ее подробное описание.



/*
enum VendingMachineError: Error {            // ошибки автомата
    case invalidSelection                    // нет в ассортименте
    case outOfStock                          // нет в наличии
    case insufficientFunds(coinsNeeded: Int) // недостаточно денег, передаем недостаточную сумму
}

struct Item {
    var price: Int
    var count: Int
    let product: Product
}
// товар
struct Product{
    let name: String
}

class VendingMachine {   // Хранилище
    
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7, product: Product(name: "Candy Bar")),
        "Chips": Item(price: 10, count: 4, product: Product(name: "Chips")),
        "Pretzels": Item(price: 0, count: 11, product: Product(name: "Pretzels"))
    ]
    // Количество денег, переданное покупателем
    var coinsDeposited = 30
    // Продаем товар
    func vend(itemNamed name: String) -> (Product?, VendingMachineError?) { // Возвращаем кортеж из товара и ошибки
        // Если наша машина не знает такого товара вообще
        guard let item = inventory[name] else {
            // возвращаем nil вместо продукта и ошибку
            return (nil, .invalidSelection)
        }
        // Если товара нет в наличии
        guard item.count > 0 else {
            // возвращаем nil вместо продукта и ошибку
            return (nil, .outOfStock)
        }
        // Если недостаточно денег
        guard item.price <= coinsDeposited else {
            // возвращаем nil вместо продукта и ошибку
            return (nil, .insufficientFunds(coinsNeeded: item.price - coinsDeposited))
        }
        // продаем товар
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        // Возвращаем nil вместо ошибки и продукт
        return (newItem.product, nil)
    }
}

let vendingMachine = VendingMachine()
let sell1 = vendingMachine.vend(itemNamed: "Snikers")   // nil, invalidSelection
let sell2 = vendingMachine.vend(itemNamed: "Candy Bar") // nil, (insufficientFunds, 12)
let sell3 = vendingMachine.vend(itemNamed: "Pretzels") // Product("Pretzels"), nil

if let product = sell1.0 {
    print("Мы купили: \(product.name)")
} else if let error = sell1.1 {
    print("Произошла ошибка: \(error.localizedDescription)")
}

print(vendingMachine.vend(itemNamed: "Snikers"))
print(vendingMachine.vend(itemNamed: "Candy Bar"))
print(vendingMachine.vend(itemNamed: "Pretzels"))
*/


//Throws
//В нашем примере все же есть недочеты. Во-первых, может произойти так, что мы не вернем ни ошибки, ни продукта. Во-вторых, при вызове метода покупки мы не видим явно, что он может вызывать ошибки. Да и возвращать такие кортежи не очень удобно. Специально для таких случаев есть ключевое слово «throws». Если пометить метод этим ключевым словом, мы однозначно покажем, что он может содержать ошибку и ее надо обработать. Мы просто не оставим пространства для маневра тому, что вызовет наш метод.
//Все методы, помеченные как «throws», должны возвращать исключение. Исключения – это ошибки, имплементирующие протокол «Error», но не просто возвращаемые, а сгенерированные в исключительную ситуацию. Чтобы сгенерировать ошибку, необходимо  использовать ключевое слово «throw».
//

enum VendingMachineError: Error {            // ошибки автомата
    case invalidSelection                    // нет в ассортименте
    case outOfStock                          // нет в наличии
    case insufficientFunds(coinsNeeded: Int) // недостаточно денег, передаем недостаточную сумму
}

struct Item {
    var price: Int
    var count: Int
    let product: Product
}
// товар
struct Product{
    let name: String
}
// Вендинговая машина
class VendingMachine {
    // Хранилище
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7, product: Product(name: "Candy Bar")),
        "Chips": Item(price: 10, count: 4, product: Product(name: "Chips")),
        "Pretzels": Item(price: 0, count: 11, product: Product(name: "Pretzels"))
    ]
    // Количество денег,  переданное покупателем
    var coinsDeposited = 0
    // продаем товар
    // возвращаем продукт,
    // но помечаем метод как «throws», это означает, что он может завершиться с ошибкой
    func vend(itemNamed name: String) throws -> Product {
        // Если наша машина не знает такого товара вообще,
        guard let item = inventory[name] else {
            // генерируем ошибку
            throw VendingMachineError.invalidSelection
        }
        // если товара нет в наличии,
        guard item.count > 0 else {
            // генерируем ошибку
            throw VendingMachineError.outOfStock
        }
        // если недостаточно денег,
        guard item.price <= coinsDeposited else {
            // генерируем ошибку
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        // продаем товар
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        // возвращаем продукт
        return newItem.product
    }
}

//Обратите внимание: продукт у нас не опционального типа, а обычного, но также указано ключевое слово «throws». Это означает, что метод всегда возвращает продукт, но во время этого выполнения может произойти ошибка и ее необходимо обработать.


let vendingMachine = VendingMachine()
let sell1 = vendingMachine.vend(itemNamed: "Snikers")
let sell2 = vendingMachine.vend(itemNamed: "Candy Bar")
let sell3 = vendingMachine.vend(itemNamed: "Pretzels") 
