import UIKit

struct Item {
    let product: Product
    var price: Int
    var count: Int
}

struct Product {
    var name : String
}

enum warehouseErrors : Error {
    case wrongName
    case outOfStock
    case noMoney
}

extension warehouseErrors: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .wrongName:
            return NSLocalizedString("Неправильное название компонента.", comment: "wrongName")
        case .outOfStock:
            return NSLocalizedString("Данный продукт закончился на складе.", comment: "outOfStock")
        case .noMoney:
            return NSLocalizedString("Недостаточно денег для покупки.", comment: "noMoney")
        }
    }
}
//error
class warehouse {
    var inventory = [
        "Motherboard": Item(product: Product(name: "Gygabite"), price: 5000, count: 12),
        "CPU": Item(product: Product(name: "Intel"), price: 12000, count: 3),
        "GPU": Item(product: Product(name: "MSI"), price: 6000, count: 5),
        "RAM": Item(product: Product(name: "Kingston"), price: 1000, count: 200)]

    func install(itemName name: String) -> (Product?, warehouseErrors?) {

        guard let item = inventory[name] else {
            return (nil, warehouseErrors.wrongName)
        }

        guard item.count > 0 else {
            return (nil, warehouseErrors.outOfStock)
        }

        guard customerMoney >= item.price else {
            return (nil, warehouseErrors.noMoney)
        }

        customerMoney -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        print ("\(name) sold")
        return (newItem.product, nil)
    }
}

var customerMoney = 100500
let store = warehouse()
let sell1 = store.install(itemName: "CPUU")

if let product = sell1.0 {
    print("Мы купили: \(product.name)")
} else if let error = sell1.1 {
    print("Произошла ошибка: \(error.localizedDescription)")
}


//try/catch

class warehouseNew {
    var inventory = [
        "Motherboard": Item(product: Product(name: "Gygabite"), price: 5000, count: 12),
        "CPU": Item(product: Product(name: "Intel"), price: 12000, count: 3),
        "GPU": Item(product: Product(name: "MSI"), price: 6000, count: 5),
        "RAM": Item(product: Product(name: "Kingston"), price: 1000, count: 200)]
        
    func install(itemName name: String) throws -> Product {
        
        guard let item = inventory[name] else {
            throw warehouseErrors.wrongName
        }
        
        guard item.count > 0 else {
            throw warehouseErrors.outOfStock
        }
        
        guard customerMoney >= item.price else {
            throw warehouseErrors.noMoney
        }
        
        customerMoney -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        print ("\(name) sold")
        return newItem.product
    }
}


customerMoney = 10
let store2 = warehouseNew()

do {
    _ = try store2.install(itemName: "CPU")
} catch let error {
    print(error.localizedDescription)
}
