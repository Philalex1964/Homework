//
//  main.swift
//  7l_FilippovAlexander
//
//  Created by Александр Филиппов on 19.03.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import Foundation

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
