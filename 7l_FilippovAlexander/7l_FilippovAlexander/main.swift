//
//  main.swift
//  7l_FilippovAlexander
//
//  Created by Александр Филиппов on 19.03.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//
//1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
//
//2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.

import Foundation

enum TicketSellerMachineError: Error {
    case noSuchDestination
    case noSeats
    case insufficientFunds
    case bankCardBlocked
    
}

struct Ticket {
    var price: Int
    var seat: Int
    let destination: Destination
}

struct Destination {
    let name: String
}

class TicketSellerMachine {
    var timeTable = [
        "Paris": Ticket(price: 15000, seat: 0, destination: Destination(name: "Paris")),
        "Beograd": Ticket(price: 10000, seat: 14, destination: Destination(name: "Beograd")),
        "Nursultan =)": Ticket(price: 7000, seat: 100, destination: Destination(name: "Nursultan =)")),
        "Singapore": Ticket(price: 40000, seat: 25, destination: Destination(name: "Singapore"))
    ]
    
    var bankCardBlocked: Bool = false
    
    var fundsOnBankCard = 30000
    
    func sellTickets(ticketNamed name: String) throws -> Destination {
        guard let ticket = timeTable[name] else {
            throw TicketSellerMachineError.noSuchDestination
        }
        guard ticket.seat > 0 else {
            throw TicketSellerMachineError.noSeats
        }
        guard ticket.price <= fundsOnBankCard else {
            throw TicketSellerMachineError.insufficientFunds
        }
        guard bankCardBlocked != true else {
            throw TicketSellerMachineError.bankCardBlocked
        }
        
        
        fundsOnBankCard -= ticket.price
        var newTicket = ticket
        newTicket.seat -= 1
        timeTable[name] = newTicket
        return newTicket.destination
    }
}




let ticketSellerMachine = TicketSellerMachine()

do {
    let sell1 = try ticketSellerMachine.sellTickets(ticketNamed: "Beograd")
    print(sell1.name)
    print("Успешная продажа билета в \(sell1.name)")
    
    let sell2 = try ticketSellerMachine.sellTickets(ticketNamed: "Astana =)")
    print(sell2.name)
    
    
    let sell3 = try ticketSellerMachine.sellTickets(ticketNamed: "Paris")
    print(sell2.name)
    
    let sell4 = try ticketSellerMachine.sellTickets(ticketNamed: "Singapore")
    print(sell4.name)
    
} catch TicketSellerMachineError.noSeats {
    print("На данном направлении нет билетов.")
} catch TicketSellerMachineError.noSuchDestination {
    print("Нет такого города - Астана =). Вчера переименовали в Нурсултан =).")
} catch TicketSellerMachineError.insufficientFunds {
    print("На данном направлении нет билетов.")
} catch TicketSellerMachineError.bankCardBlocked {
    print("Ваша карта заблокирована.")
} catch {
    print(error.localizedDescription)
}
