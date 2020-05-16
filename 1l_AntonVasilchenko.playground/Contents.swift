//1. Решить квадратное уравнение.
var a:Double = 5
var b:Double = 64
var c:Double = 3
print ("\(a)x^2 + \(b)x + \(c) = 0")
var discr:Double = (b*b) - (4*a*c)
if ( discr < 0) {
    print ("Так как дискриминант меньше нуля (\(Int(discr))), то уравнение не имеет действительных решений.")
} else {
    let x1:Double = ((b*(-1)) - discr.squareRoot()) / (2*a)
    let x2:Double = ((b*(-1)) + discr.squareRoot()) / (2*a)
    print ("Так как дискриминант больше нуля (\(Int(discr))), то квадратное уравнение имеет два действительных корня: x1 = \(x1), x2 = \(x2)\n")
}
//2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
a = 3
b = 4
c = (a*a + b*b).squareRoot()
var square = (a*b)/2
var perimetr = a + b + c
print ("If A = \(a), B = \(b), then C = \(c), S = \(square), P = \(perimetr)\n")
//3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
import Foundation
var money:Double = 17800
var percent:Double = 3.6
for i in 1...5 {
    let moneyEarned:Double = money * (percent/100)
    money = money + moneyEarned
    let result = Double(round(100*money)/100)
    print ("Year = \(i), Money on Deposit = \(result)")
}
