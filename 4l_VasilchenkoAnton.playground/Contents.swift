enum windowsState: String {
    case open = "Окна открыты"
    case closed = "Окна закрыты"
}

enum engineState: String {
    case on = "Двигатель включен"
    case off = "Двигатель выключен"
}

enum carCargoLight: String {
    case on
    case off
}

enum carTurboKit: String {
    case on
    case off
}

enum backDoorsState: String {
    case open
    case closed
}

enum action {
    case windows(move: windowsState)
    case engine(action: engineState)
    case light(action: carCargoLight)
    case turbo(action: carTurboKit)
}

class car {
    let name: String
    let year: Int
    let trunkVolume: Int
    var cargoVolume: Int
    var backDoorsState: backDoorsState
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
    
    init(name: String, year: Int, trunkVolume: Int, engineState: engineState, windowsState: windowsState, cargoVolume: Int, backDoorsState: backDoorsState){
        self.name = name
        self.year = year
        self.trunkVolume = trunkVolume
        self.engineState = engineState
        self.windowsState = windowsState
        self.cargoVolume = cargoVolume
        self.backDoorsState = backDoorsState
    }
    
    func description() {
        print("Марка: \(name); год выпуска: \(year); объем багажника: \(trunkVolume); состояние двигателя: \(engineState.rawValue); состояние окон: \(windowsState.rawValue)")
    }
    
    func openBackDoors () {
        backDoorsState = .open
        print("\(name) Open back doors")
    }
    
    func closeBackDoors() {
        backDoorsState = .closed
        print("\(name) Close back doors")
    }
    
    func loadCargo(cargo: Int){
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
}

class trunkCar: car {
    var cargoLight: carCargoLight
    init(name: String, year: Int, trunkVolume: Int, engineState: engineState, windowsState: windowsState, cargoVolume: Int, cargoLight: carCargoLight, backDoorsState: backDoorsState){
        self.cargoLight = cargoLight
        super.init(name: name, year: year, trunkVolume: trunkVolume, engineState: engineState, windowsState: windowsState, cargoVolume: cargoVolume, backDoorsState: backDoorsState)
    }
    func lightCargo(){
        cargoLight = .on
        print("\(name) Cargo Lights on")
    }
    
    func unlightCargo(){
        cargoLight = .off
        print("\(name) Cargo Light off")
    }
    
    override func openBackDoors() {
        print("No back doors in trunk car \(name) ")
    }
}

class sportCar: car {
    var turboKit: carTurboKit
    init(name: String, year: Int, trunkVolume: Int, engineState: engineState, windowsState: windowsState, backDoorsState: backDoorsState, turboKit: carTurboKit, cargoVolume: Int) {
        self.turboKit = turboKit
        super.init(name: name, year: year, trunkVolume: trunkVolume, engineState: engineState, windowsState: windowsState, cargoVolume: cargoVolume, backDoorsState: backDoorsState)
    }
    
    func boostOn(){
        turboKit = .on
        print("\(name) Turbo on")
    }
    
    func boostOff(){
        turboKit = .off
        print("\(name) Turbo off")
    }
    
    override func loadCargo(cargo: Int) {
        print("You can't load anyting to a sport car \(name)")
    }
}

let car1 = car(name: "Vaz", year: 2012, trunkVolume: 270, engineState: .off, windowsState: .closed, cargoVolume: 0, backDoorsState: .closed)
let car2 = trunkCar(name: "MAN", year: 2015, trunkVolume: 30000, engineState: .on, windowsState: .closed, cargoVolume: 10000, cargoLight: .on, backDoorsState: .closed)
let car3 = sportCar(name: "Toyota", year: 1998, trunkVolume: 0, engineState: .on, windowsState: .open, backDoorsState: .closed, turboKit: .on, cargoVolume: 0)

car3.boostOff()
car2.unlightCargo()
car1.openBackDoors()
car3.loadCargo(cargo: 100)
car2.openBackDoors()
