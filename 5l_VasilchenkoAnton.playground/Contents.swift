//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

protocol car {
    var name: String {get}
    var manYear: Int {get}
    func printDescription()
}

extension car {
    func startEngine(){
        print("Engine starting")
    }
    
    func killEngine(){
        print("Engine turning off")
    }
    
    func openHood(){
        print("Opening hood")
    }
    
    func closeHood(){
        print("Closing hood")
    }
}

class trunkCar: car {
    var name: String
    var manYear: Int
    var cargoName: String
    var cargoLocation: String
    
    func printDescription() {
        print(name, manYear, cargoName, cargoLocation)
    }
    
    init(name: String, manYear: Int, cargoName: String, cargoLocation: String){
        self.name = name
        self.manYear = manYear
        self.cargoName = cargoName
        self.cargoLocation = cargoLocation
    }
}

class sportCar: car {
    var name: String
    var manYear: Int
    var horsePower: Int
    
    func printDescription() {
        print("name: \(name), year: \(manYear), HP: \(horsePower)")
    }
    
    init (name: String, manYear: Int, horsePower: Int){
        self.name = name
        self.manYear = manYear
        self.horsePower = horsePower
    }
}
let car1 = trunkCar(name: "MAZ", manYear: 1990, cargoName: "Gold", cargoLocation: "Moscow")
let car2 = sportCar(name: "BMW", manYear: 2001, horsePower: 350)

car1.printDescription()
car2.printDescription()

extension sportCar: CustomStringConvertible {
    var description: String {
        return "year: \(manYear), HP: \(horsePower), name: \(name)"
    }
}

extension trunkCar: CustomStringConvertible {
    var description: String {
        return "name: \(name), cargoLocation: \(cargoLocation), cargoname: \(cargoName)"
    }
    
}

print(car1.description)
print(car2.description)
car1.startEngine()
car2.openHood()
