//1. Написать функцию, которая определяет, четное число или нет.
func ifEven (inputNumber number: Int) -> Bool {
    ((number % 2) == 0 ? true : false)
}
ifEven(inputNumber: 1)
//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func ifMod3 (inputNumber number: Int)  -> Bool {
    ((number % 3) == 0 ? true : false)
}
ifMod3(inputNumber: 4)
//3. Создать возрастающий массив из 100 чисел.
var riseArray: [Int] = []
for i in 0...99{
    riseArray.append(i)
}
//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
for (_, value) in riseArray.enumerated(){
    if (ifEven(inputNumber: value) == true){
        riseArray.remove(at: riseArray.firstIndex(of: value)!)
    }
    else if (ifMod3(inputNumber: value) == true){
        riseArray.remove(at: riseArray.firstIndex(of: value)!)
    }
}
print(riseArray)
