//
//  main.swift
//  swift4.2(初始化)
//
//  Created by 范云飞 on 2018/7/27.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation

//MARK:------------------------------- 初始化 ---------------------------

/**
 1. 初始化是为类、结构体或者枚举准备实例的过程。这个过程需要给实例里的每一存储属性设置一个初始值并且在新实例可以使用之前执行任何其他所必须的配置或初始化。
 2. 定义初始化器来实现这个初始化过程，它更像是一个用来创建特定类型新实例的特殊方法
 3. 类类型的实例同样可以实现一个反初始化器
 */


//MARK:---------------------- 1 为存储属性设置初始化值

/**
 在创建类和结构体的实例是必须为所有的存储属性设置一个合适的初始值。存储属性不能遗留在不确定的状态中。
 */

//MARK:------------------ 1.1 初始化器

/**
 初始化器在创建特定类型的实例时被调用。在这个简单的形式中，初始化器就像一个没有形式参数的实例方法， 使用 init 关键字来写：
 */

//init() {
//
//}


struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature) fahrenheit")

/**
 上面的例子中，定义了一个初始化器，init 没有形式参数，它初始化储存温度的值为 32.0 （在 华氏温度下水的冰点）
 */


//MARK:------------------ 1.2 默认的属性值

/**
 你可以在初始化器里为存储属性设置初始值。
 */

//FIXME:如果一个属性一直保持相同的初始值，可以提供一个默认值而不是在初始器里设置这个值。最终结果是一样的。但是默认值降属性的初始化与声明更紧密地联系到一起。

struct NewFahrenheit {
    var temperature = 32.0
    
}


//MARK:---------------------- 2 自定义初始化

/**
 你可以通过输入形式参数和可选类型来自定义初始化过程，或者在初始化的时候分配常量属性
 */

//MARK:------------------ 2.1 初始化形式参数

/**
 你可以提供初始化形式参数作为初始化器的一部分，来定义初始化过程中的类型和值的名称
 */

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromeKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}


let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)

let freezingPointOfWater = Celsius(fromeKelvin: 273.15)


//MARK:------------------ 2.2 形式参数名和实际参数标签

/**
 与函数和方法的形式参数一样，初始化形式参数也可以在初始化器内部有一个局部变量名以及实际参数标签供调用
 */

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)

let halfGray = Color(white: 0.5)

//FIXME:如果定义了外部参数名就必须用在初始化器里，省略的话会报一个编译错误

//let veryGreen = Color(0.0, 1.0, 0.0)


//MARK:------------------ 2.3 无实际参数标签的初始化器形式参数

/**
 如果你不想为初始化器形式参数使用实际参数标签，可以写一个下划线（_）替代明确的实际参数标签以重写默认行为
 */

struct NewCelsius {
    var temperatureIncelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureIncelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureIncelsius = kelvin - 273.15
    }
    
    init(_ celsius: Double) {
        temperatureIncelsius = celsius
    }
}


let bodyTemperature = NewCelsius(37.0)


//MARK:------------------ 2.4 可选属性类型

/**
 如果你的自定义类型有一个逻辑上是允许“无值”的存储属性 或者 它在稍后允许设置为 “无值”。此时就可以声明为可选类型，会被自动地初始化为 nil。 表示该属性在初始化期间故意设为 "还没有值"
 */

class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese ?")
cheeseQuestion.ask()


//MARK:------------------ 2.5 在初始化中分配常量属性

/**
 在初始化的任意时刻，你都可以给常量属性赋值，只要它在初始化结束是设置了确定的值即可。一旦为常量属性被赋值，他就不能再被修改了
 */

//FIXME:对于类实例来说。常量属性在初始化中只能通过引用的类来修改。它不能被子类修改

class NewSurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

let beetsQuestion = NewSurveyQuestion(text: "How about beets ?")
beetsQuestion.ask()

beetsQuestion.response = "I also like beets. (But not with cheese.)"

let anotherQuestion = NewSurveyQuestion(text: "i like amarican")
anotherQuestion.ask()



//MARK:---------------------- 3 默认初始化器

/**
 swift 为所有没有提供初始化器的结构体或类提供了一个默认的初始化器来给所有的属性提供了默认值。这个默认的初始化器只是简单地创建了一个所有属性都有默认值的新实例
 */

class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()

/**
 ShoppingListItem 类自动地获得了一个默认的初始化器，使用默认值设置了它的所有属性然后创建了型的实例。 name 属性是一个可选 String 属性，所以它会自动设置为 nil 默认值，尽管这个值没有写在代码里。
 */


//MARK:------------------ 3.1 结构体类型的成员初始化器

/**
 如果接头体类型中没有定义任何自定义初始化器，它会自动获得一个成员初始化器。不同于默认初始化器，结构体会接受成员初始化器即使它的存储属性没有默认值
 */

struct Size {
    var width = 0.0 , height = 0.0
}
let twoByTow = Size(width: 2.0, height: 2.0)

/**
 上面的例子中 Size结构体自动接受一个 init(width: heght:)成员初始化器，你可以使用他来初始化一个新的 Size 实例
 */



//MARK:---------------------- 4 值类型初始化器委托

/**
 初始化器可以调用其他初始化器来执行部分实例的初始化。这个过程，就是所谓的初始化器委托，避免了多个初始化器里冗余代码。
 */

struct Size1 {
    var width = 0.0 , height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size1()
    init() {
        
    }
    
    init(origin: Point, size: Size1) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size1) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
        
    }
}

/**
 1. 第一个 Rect 初始化器，init() 和默认初始化器有一样的功能，如果Rect 没有自定义初始化器，他将会使用的那个默认初始化器。这个初始化器是空的，用一个大括号{}来表示，并且不会执行任何初始化。
 */

let basicRect = Rect()


/**
 2. 第二个 Rect 初始化器，init(origin:size:) 和成员初始化器功能相同，如果Rect没有自定义的初始化器，它将使用这个初始化器
 */

let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size1(width: 5.0, height: 5.0))

/**
 3. Rect 的初始化器。 init(center:size:) 略显复杂。它以计算一个基于 center 和 size 值的原点开始。
 */

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size1(width: 3.0, height: 3.0))



//MARK:---------------------- 5 类的继承和初始化

/**
 1. 所有类的存储属性，包括从他的父类继承的所有属性都必须在初始化期间分配初始化值
 2. swift为类类型定义了两种初始化器以确保所有的存储属性接收一个初始值。这就是所谓的指定初始化器和便捷初始化器
 */

//MARK:------------------ 5.1 指定初始化器和便捷初始化器

/**
 1.指定初始化器是类的主要初始化器。指定的初始化器可初始化所欲那个类引用的属性并且调用合适的父类初始化器来继续这个初始化过程给父类链
 2.便捷初始化器是次要的
 */

//MARK:------------------ 5.2 指定初始化器和便捷初始化器语法

/**
 inti(parameter) {
     statements
 }
 
 convenience init(parameters) {
     statements
 }
 */


//MARK:------------------ 5.3 类类型的初始化器委托

/**
 为了简化指定和便捷初始化器之间的调用关系，swift在初始化器之间的委托调用有下面的三个规则
 */

//MARK:5.3.1 规则1

/**
 指定初始化器必须从他的直系父类调用指定初始化器
 */

//MARK:5.3.2 规则2

/**
 便捷初始化器必须从相同的类里调用另一个初始化器
 */

//MARK:5.3.3 规则3

/**
 便捷初始化器最终必须调用一个指定初始化器
 */


//FIXME:指定初始化器必须总是向上委托，便捷初始化器总横向委托


//MARK:------------------ 5.4 两段式初始化

/**
 swift 的类初始化是一个两段式过程。在第一个阶段。每一个存储属性被引入类为分配了一个初始值。一旦每个存储属性的初始状态被确定。第二个阶段就开始了，每个类都有机会在新的实例准备使用之前来定制它的存储属性
 */

/**
 swift编译器执行4中有效的安全检查来确保两段式初始化过程能够顺利完成
 */

//MARK:5.4.1 安全检查1

/**
 指定初始化器必须保证在向上委托给父类初始化器之前，其所在类引入的所有属性都要初始化完成
 */

//MARK:5.4.2 安全检查2
/**
 指定初始化器必须先向上委托父类初始化器，然后才能为继承的属性设置新值。如果不这样做，指定初始化器赋予的新值将会被父类中的初始化器所覆盖
 */

//MARK:5.4.3 安全检查3
/**
 便捷初始化器必须先委托同类中的其他初始化器，然后再为任意属性赋新值。如果没有这么做，便捷初始化器赋予的新值将被自己类中其他指定初始化器所覆盖
 */

//MARK:5.4.4 安全检查4

/**
 初始化器在第一个阶段初始化完成之前，不能调用任何实例方法，不能读取任何实例属性的值，也不能引用self作为值， 知道第一阶段结束类实例才完全合法。属性只能被读取，方法也只能被调用，直到第一阶段结束的时候，这个类实例才被看做事合法的
 */


//MARK:5.4.5 阶段1

//MARK:5.4.6 阶段2


//MARK:------------------ 5.5 初始化器的继承和重写

/**
 不像在Objective-C 中的子类，swift的子类不会默认继承父类的初始化器。swift的这种机制防止父类的简单初始化器被一更专用的子类继承并被用来创建一个没有完全或者错误初始化的新实例的情况发生
 */

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel"
    }
}

let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")

//FIXME:子类可以在初始化时修改继承变量属性，但是不能修改继承过来的常量属性


//MARK:------------------ 5.6 自动初始化器的继承

/**
 子类默认不会继承父类初始化器。总之，在特定的情况下父类初始化器是可以被自动继承的。
 */

//MARK:5.6.1 规则1
/**
 如果你的子类没有定义任何指定初始化器，他会自动继承父类所有的指定初始化器
 */


//MARK:5.6.2 规则2

/**
 如果你的子类提供了所有父类指定初始化器的实现--------要么是通过规则1继承来的，要么通过在定义中提供自定实现的------那么它自动继承所有的父类便捷初始化器
 */


//MARK:------------------ 5.7 指定和便捷初始化器的操作


class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")

//let musteryMeat = Food()


class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

//let oneMusteryItem = RecipeIngredient()

let oneBacon = RecipeIngredient(name: "Bacone")


class ShoppingListItem1: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? "✔" : "✘"
        return output
    }
}

var breakfaskList = [ShoppingListItem1(), ShoppingListItem1(name: "Bacon"), ShoppingListItem1(name: "Eggs", quantity: 6)]

breakfaskList[0].name = "Orange juice"
breakfaskList[0].purchased = true
for item in breakfaskList {
    print(item.description)
}


//MARK:---------------------- 6 可失败的初始化器

/**
 1.为了处理初始化器的可能失败的情况，在类、结构体和枚举中定义一个或多个可失败的初始化器。通过在 init关键字后面添加问好（init?）来写
 2.可失败的初始化器创建了一个初始化器类型的可选值。你通过在可失败初始化器写 return nil 语句，来表明可失败初始化器在何种情况下会触发初始化失败
 */

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")

print(someCreature!.species)


//MARK:------------------ 6.1 枚举的可失败初始化器

/**
 你可以使用一个可失败初始化器在带一个或多个形式参数的枚举中选择合适的情况。如果提供的形式参数没有匹配合适的情况初始化器就可能失败
 */

enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded")
}

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed")
}


//MARK:------------------ 6.2 带有原始值枚举的可失败初始化器

/**
 带有原始值的枚举会自动获得一个可失败初始化器 init?(rawValue:)
 */


enum TemperatureUnit1: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}

let fahrenheitUnit1 = TemperatureUnit1(rawValue: "F")
if fahrenheitUnit1 != nil {
    print("This is a defined temperature unit, so initialization succeeded")
}

let unknownUnit1 = TemperatureUnit1(rawValue: "X")
if unknownUnit1 == nil {
    print("This is not a defined temperature unit, so initialization failed")
}


//MARK:------------------ 6.3 初始化失败的传递

/**
 类，结构体或枚举的可失败初始化器可以横向委托到同一个类、结构体或枚举里的另一个可失败初始化器。类似地，子类的可失败初始化器可以向上委托到父类的可失败初始化器。
 */


class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
    
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 {
            return nil
        }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}


if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize one unnamed product")
}


//MARK:------------------ 6.4 重写可失败初始化器

/**
 1.你可以在子类里重写父类的可失败初始化器。就好比其他的初始化器。或者，你可以用子类的非可失败初始化器来重写父类可失败初始化器。这样允许你定义一个初始化不会失败的子类，尽管父类的初始化允许失败
 2. 注意如果你用非可失败的子类初始化器重写了一个可失败初始化器，向上委托到父类初始化器的唯一办法就是强制展开父类可失败初始化器的结果
 */

//FIXME:你可以用一个非可失败初始化器重写一个可失败初始化器，反过来不行。


class Document {
    var name: String?
    init() {
        
    }
    init?(name: String) {
        self.name = name
        if name.isEmpty {
            return nil
        }
    }
}


class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}


class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}

let untitle = UntitledDocument()


//MARK:------------------ 6.5 可失败初始化器 init！



//MARK:---------------------- 7 必要初始化器

/**
 1.在类的初始化器前添加 required 修饰符来表明 所有该类的子类都必须实现该初始化器
 2. 当子类重写父类的必要初始化器时，必须在子类的初始化器前同样添加 required 修饰符以确保当其他类继承该子类时，该初始化器为必要初始化器。在重写父类的必要初始化器时，不需要添加override 修饰符
 */

class SomeClass {
    required init() {
        
    }
}

class SomeSubclass: SomeClass {
    required init() {
        print("required 关键字")
    }
}



//MARK:---------------------- 8 通过闭包和函数来设置属性的默认值

/**
 如果某个存储属性的默认值需要自定义或设置，你可以使用闭包或全局函数来为属性提供默认值。当这个属性属于的实例初始化时，闭包或函数就会被调动，并且它的返回值作为属性的默认值
 */

//class NewClass {
//    let someProperty: Int = {
//        return someValue
//    }()
//}

//FIXME:如果你使用闭包来初始化属性，请记住闭包执行的时候，实例的其他部分还没有被初始化。这就意味着你不能在闭包里读取任何其他的属性值，即使这些属性有默认值。你也不能使用隐式self 属性。或者调用实例的方法


struct Chessboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}


let board = Chessboard()
print(board.squareIsBlackAt(row: 0, column: 1))

print(board.squareIsBlackAt(row: 7, column: 7))

