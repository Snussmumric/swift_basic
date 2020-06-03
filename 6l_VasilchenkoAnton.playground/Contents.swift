import UIKit

struct Stack<Type: Equatable>{
    
    var items = [Type]()
    
    mutating func push(_ item: Type){
        items.append(item)
    }
    
    mutating func pop() -> Type? {
        return items.removeLast()
    }
    subscript(element: Int) -> Type? {
        if (element <= items.count) && (element > 0) {
            return items[element]
        }
        else {
            return nil
        }
    }
}

func filter<Type>(array: [Type], predicate: (Type) -> Bool ) -> [Type] {
    var tmpArray = [Type]()
    for element in array {
        if predicate(element) {
            tmpArray.append(element)
        }
    }
    return tmpArray
}


var newIntStack = Stack<Int>()

newIntStack.push(1)
newIntStack.push(3)
newIntStack.push(4)
newIntStack.push(51)
newIntStack.push(116)
newIntStack.push(8)
newIntStack.push(10092)
newIntStack.push(12154)

print(newIntStack)

newIntStack[4]

var newStringStack = Stack<String>()

newStringStack.push("Aaaaa")
newStringStack.push("HhhHhHhhHhH")
newStringStack.push("BbbbbbbBbB")
newStringStack.push("Fffffffffffffff")
newStringStack.push("DDDDDddddd")
newStringStack.push("CccCCCCCCccc")
newStringStack.push("Eee")
newStringStack.push("gggGGggggg")

newStringStack[2]


print(filter(array: (newIntStack.items)) {$0 > 4})
print(filter(array: (newIntStack.items)) {$0 % 2 == 0})
print(newStringStack.items)
print(newStringStack.items.sorted(by: <))
