//
//  main.swift
//  swift4.2(协议)
//
//  Created by 范云飞 on 2018/7/29.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation

//MARK:--------------------------- 协议 ----------------------------

/**
 1. 协议为方法、属性、以及其他特定的任务需求
 2. 协议可被类、结构体、枚举类型采纳用以提供所需功能的具体实现。满足了协议中需求的任意类型都叫做遵循了该协议
 3. 除了指定遵循类型必须实现的需求外，你可以扩展一个协议
 */


//MARK:---------------------- 1 协议的语法

/**
 1. 定义协议的方式与类、结构体、枚举类型非常相似
 */

/**
 protocol SomeProtocol {
 
 }
 */

/**
 2. 在自定义类型声明时，将协议名放在类型名的冒号之后来表示该类型采纳一个特定的协议。多个协议可以用逗号分开列出：
 */

/**
 struck SomeStructure: FirstProtocol, AnotherProtocol {
 
 }
 */

/**
 3. 如果一个类拥有父类，将这个父类名放在其采纳的协议名之前，并用逗号分隔：
 */

/**
 class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol {
 
 }
 */


//MARK:---------------------- 2 属性要求

/**
 1. 协议要求所有遵循该协议的类型提供特定名字和类型的实例属性或类型属性。同要求一个属性必须明确是可读的或者可读写的
 */

/**
 protocol SomeProtocol {
 var mustBeSettable: Int { get set  }
 var doesNotNeedToBeSettable: Int { get }
 }
 */

/**
 2. 在协议中定义类型属性时在前面添加 static 关键字。当类的实现使用 class 或 static 关键字前缀声明类型属性要求时，这个规则仍然适用
 */

/**
 protocol AnotherProtocol {
 static var someTypeProperty: Int { get set }
 }
 */

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}

let john = Person(fullName: "John Appleseed")
print(john)

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + " " : " ") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")



//MARK:---------------------- 3 方法要求

/**
 1. 协议可以要求采纳的类型实现指定的实例方法和类方法。这方法作为协议定义的一部分，书写格式与正常实例和类方法的方式完全相同，但是不需要大括号和方法的主体。允许变量拥有参数，方法参数不能定义默认值
 2. 当协议中定义类型方法时，你总要在其之前添加 static 关键字。
 */

/**
 protocol SomeProtocol {
     static func someTypeMethod()
 }
 */


 protocol RandomNumberGenerator {
     func random() -> Double
 }

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c ).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")



//MARK:---------------------- 4 异变方法要求

/**
 若你定义了一个协议的实例方法需求，想要异变任何采用了该协议的类型实例，只需要在协议方法的定义当中使用mutating 关键字。这允许结构体和枚举类型能采用相应协议并满足方法要求
 */

//FIXME:如果你在协议中标记实例方法需求为 mutating, 在为类实现该方法的时候不需要写 mutating 关键字。 mutating 关键字只在结构体和枚举类型中需要书写

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()



//MARK:---------------------- 5 初始化器要求

/**
 协议可以要求遵循协议的类型实现指定的初始化器。和一般的初始化器一样，只用将初始化器写在协议的定义当中，只是不用写大括号也就是初始化器的实体：
 */

/**
 protocol SomeProtocol {
 init(someParameter: Int)
 }
 */


//MARK:5.1 协议初始化器要求的类实现

/**
 1. 你可以通过实现指定初始化器或便捷初始化器来使初始化器来使遵循该协议的类满足协议的初始化器要求。在这两种情况下，你都必须使用 required 关键字修饰符初始化器的实现：
 */

/**
 class SomeClass: SomeProtocol {
 required init(someParameter: Int) {
 
 }
 }
 */

//FIXME:由于final 的类不会有子类，如果协议初始化器实现的类使用了 final 标记，你就不需要使用 required 来修饰了。应为这样的类不能被继承子类

/**
 2. 如果一个子类重写父类指定的初始化器，并且遵循了协议实现了该初始化器要求，那么要为这个初始化器的实现添加 required 和 override 两个修饰符
 */

protocol SomeProtocol1 {
    init()
}

class SomeSuperClass {
    init() {
        print("滚犊子")
    }
}

class SomeSubClass: SomeSuperClass, SomeProtocol1 {
    required override init() {
        
    }
}


//MARK:5.2 可失败初始化器要求

/**
 协议可以为遵循该协议的类型定义可失败的初始化器
 */



//MARK:---------------------- 6 将协议作为类型

/**
 实际上协议自身并不实现功能。不过你创建的任意协议都可以变为一个功能完备的类型在代码中使用。由于它是一个类型，你可以在很多其他类型可以使用的地方使用协议：
  * 在函数、方法或者初始化器里作为形式参数类型或者返回类型
  * 作为常量、变量或者属性的类型
  * 作为数组、字典或者其他存储器的元素的类型
 */

//FIXME:由于协议是类型，要开头大写

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides) + 1)
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}



//MARK:---------------------- 7 委托

/**
 委托是一个允许类或者结构体放手（或者说委托）它们自身的某些责任给另外类型实例去完成的设计模式。
 */

protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sdied dice")
    }
    
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}


let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()



//MARK:---------------------- 8 在扩展里添加协议遵循

/**
 你可以扩展一个已经存在的类型来采纳和遵循一个新的协议，就算你无法访问现有类型的源代码也行。扩展可以添加新的属性、方法、下标到已经存在的类型。
 */

protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}

let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)


extension SnakesAndLadders: TextRepresentable {
    var textualDescription: String {
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}

print(game.textualDescription)



//MARK:8.1 有条件地遵循协议

/**
 你可以通过在扩展类型是列出限制，让泛型类型有条件地遵循某个协议
 */

/* 下面的扩展让 Array 类型在存储遵循 TextReresentable 协议的元素时遵循 TextRepresentable */
extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map{ $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}

let myDice = [d6, d12]
print(myDice.textualDescription)



//MARK:8.2 使用扩展声明采纳协议

/**
 如果一个类型已经遵循了协议的所有要求，但是还没有声明它采纳了这个协议，你可以让通过一个空的扩展来让它采纳这个协议：
 */

struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}

extension Hamster: TextRepresentable {}

let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(somethingTextRepresentable.textualDescription)

//FIXME:类型不会因为满足需要就自动采纳协议，它们必须显示地声明采纳了哪个协议



//MARK:---------------------- 9 协议类型的集合

/**
 协议可以用作储存在集合比如数组或者字典中的类型
 */

let things: [TextRepresentable] = [game, d12, simonTheHamster]
for thing in things {
    print(thing.textualDescription)
}



//MARK:---------------------- 10 协议继承

/**
 协议可以继承一个或者多个其他协议并且可以在它继承的基础之上添加更多要求。协议继承的语法与类继承的语法相似，只不过可以选择列出多个继承的协议，使用逗号分隔：
 */

protocol InheritingProtocol: SomeProtocol1, DiceGameDelegate {
    
}

protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}


extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "△"
            case let snake where snake < 0:
                output += "😓"
            default:
                output += "○"
            }
        }
        return output
    }
}


print(game.prettyTextualDescription)



//MARK:---------------------- 11 类专用的协议

/**
 通过添加 AnyObject 关键字到协议的继承列表，你就可以限制协议只能被类类型采纳（并且不是结构体或者枚举）
 */

protocol SomeClassOnlyProtocol: AnyObject, SomeProtocol1 {
    
}



//MARK:---------------------- 12 协议组合

/**
 1. 要求一个类型一次遵循多个协议是很有用的，你可以使用协议组合来复合多个协议到有一个要求里。协议组合行为就和你定义的临时局部协议一样拥有构成中所有协议的需求。协议组合不定义任何新的协议类型
 2. 协议组合使用 SomeProtocol & AnotherProtocol 的形式。你可以列举任意数量的协议，用和符号连接（&），使用用都好分隔。
 3. 除了协议列表，协议组合也能包含类类型，这允许你表明一个需要的父类
 */

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct NewPerson: Named, Aged {
    var name:String
    var age: Int
}


func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}

let birthdayPerson = NewPerson(name: "Malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)


class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

class City: Location, Named {
    var name: String
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}

func beginConcert(in location: Location & Named) {
    print("Hello, \(location.name)!")
}

let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
beginConcert(in: seattle)



//MARK:---------------------- 13 协议遵循的检查

/**
 你可以使用 《类型转换》中描述的 is 和 as 运算符来检查协议遵循，还能转换为特定的协议。检查和转换协议的语法与检查和转换类型是完全一样的：
   * 如果实例遵循协议 is 运算符 返回 true 否则返回 false
   * as？版本的向下转换运算符返回协议的可选项，如果实例不遵循这个协议的话 值就是 nil
   * as！版本的向下转换运算符强制转换协议类型并且在失败时触发运行时错误
 */

protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) {
        self.radius = radius
    }
}

class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}


class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

let objects: [AnyObject] = [ Circle(radius: 2.0), Country(area: 243_610), Animal(legs: 4)]

for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}




//MARK:---------------------- 14 可选协议要求

/**
 你可以给协议定义可选要求，这些要求不需要强制遵循协议的类型实现。可选要求使用optional 修饰符作为前缀方在协议的定义中，使用@objc 标志标记。
 */

//FIXME:@objc 协议只能被继承自Objective-C类或其他 @objc 类采纳。它们不能被结构体或者枚举采纳

@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}


class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}



@objc class TowardsZeroSource: NSObject, CounterDataSource {
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

counter.count = -4
counter.dataSource = TowardsZeroSource()
for _ in 1...5 {
    counter.increment()
    print(counter.count)
}



//MARK:---------------------- 15 协议扩展

/**
 协议可以通过扩展来提供方法和属性的实现以遵循类型。这就允许你在协议自身
 */


extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

let newgenerator = LinearCongruentialGenerator()
print("Here's random number: \(newgenerator.random())")

print("And here's a random Boolean: \(newgenerator.randomBool())")



//MARK:15.1 提供默认实现

/**
 你可以使用协议扩展来给协议的任意方法或者计算属性要求提供默认实现。如果遵循类型给这个协议的要求提供了他自己的实现，那么他就会替代扩展中提供的默认实现
 */

extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return textualDescription
    }
}


//MARK:15.2 给协议扩展添加限制

/**
 
 */

extension Collection where Iterator.Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}

let murrayTheHamster = Hamster(name: "Murray")
let morganTheHamster = Hamster(name: "Morgan")
let mauriceTheHamster = Hamster(name: "Maurice")
let hamsters = [murrayTheHamster, morganTheHamster, mauriceTheHamster]

print(hamsters.textualDescription)
