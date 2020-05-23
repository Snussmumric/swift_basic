enum windowsState: String {
    case open = "Окна открыты"
    case closed = "Окна закрыты"
}

enum engineState: String {
    case on = "Двигатель включен"
    case off = "Двигатель выключен"
}

enum action {
    
    case windows(move: windowsState)
    case engine(action: engineState)
}

struct car {
    let name: String
    let year: Int
    let trunkVolume: Int
    var engineState: engineState {
        willSet {
            if newValue == .on {
                print("Запускаем двигатель")
            }
            else {
                print("Глушим двигатель")
            }
        }
    }
    
    var windowsState: windowsState {
        willSet {
            if newValue == .open {
                print("Окна открываются")
            }
            else {
                print("Окна закрываются")
            }
        }
    }
    
    var cargoVolume: Int
    
    mutating func loadCargo(cargo: Int)
    {
        if cargo > 0 {
            if trunkVolume >= self.cargoVolume + cargo {
                self.cargoVolume += cargo
                print ("Загрузили \(cargo) литров. Текущий объем груза: \(cargoVolume)")
            }
            else {
                print ("Нельзя загрузить \(cargo), багажник объемом \(trunkVolume), заполнено \(cargoVolume)")
            }
        }
        if cargo < 0 {
            if cargoVolume + cargo >= 0{
                self.cargoVolume += cargo
                print ("Разгрузили \(-cargo) литров. Текущий объем груза: \(cargoVolume)")
            }
            else {
                print ("Нельзя разгрузить \(-cargo), багажник объемом \(trunkVolume), заполнено \(cargoVolume)")

            }
        }
    }
    
    func description() {
        print("Марка: \(name); год выпуска: \(year); объем багажника: \(trunkVolume); состояние двигателя: \(engineState.rawValue); состояние окон: \(windowsState.rawValue); объем груза: \(cargoVolume)")
    }
}

var car1 = car(name: "BMW", year: 1998, trunkVolume: 600, engineState: .off, windowsState: .open, cargoVolume: 0)
var car2 = car(name: "KAMAZ", year: 1980, trunkVolume: 2000, engineState: .on, windowsState: .closed, cargoVolume: 600)

car1.description()
car1.windowsState = .closed
car1.engineState = .on
car1.loadCargo(cargo: 100)
car1.cargoVolume
car1.loadCargo(cargo: 300)
car1.cargoVolume
car1.loadCargo(cargo: -100)
car1.cargoVolume
car1.trunkVolume
car1.loadCargo(cargo: -500)
car1.cargoVolume
car1.loadCargo(cargo: 500)
car1.cargoVolume
print(car1.engineState.rawValue)
car1.description()
