//
//  ViewController.swift
//  swift(关键字)
//
//  Created by 范云飞 on 2018/8/15.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit
import testOpenSDK//演示open关键字的使用
import testPublicSDK//演示public关键字的使用

//MARK: ******************************* 在特定上下文中被保留的关键字 *******************************
//MARK:<-------自定义操作符 ------>
//MARK:1. 中置运算符
/* 定义优先级组 （不是必须的） */
precedencegroup MyPrecedence {
//    higherThan: AdditionPrecedence // 优先级：比加法运算搞
    lowerThan: AdditionPrecedence //优先级：比加法运算低
    associativity: none           // 结合方法：left, right or none
    assignment: false             // true = 赋值运算符，false = 非赋值运算符
}

infix operator +++ : MyPrecedence // 继承MyPrecedence 优先级组
//infix operator +++: AddtionPrecedence //也可以直接继承加法优先级组或其他优先级组

public func +++ (left: Int, right: Int) -> Int {
    return left + right * 2
}

//MARK:2. 前置运算符
/* 前置运算符是不继承优先级组的 */
prefix operator ==+
public prefix func ==+ (left: Int) -> Int {
    return left * 2
}

//MARK:3. 后置运算符
/* 后置运算符是不继承优先级组的 */
postfix operator +==
public postfix func +== (right: Int) -> Int {
    return right * 3
}


//MARK:******************************* 在声明中使用的关键字 *******************************
//MARK:<----- 使用 typealias 合并协议----->
/* 协议，使用关联类型 */
protocol TableViewCell {
    associatedtype T
    func updateCell(_ data: T)
}


protocol changeName {
    func changeNameTo(name: String)
    
}
protocol changeSex {
    func changeSexTo (sex: Bool)
}


//MARK:<----- open 测试----->

class subOpen: testOpen {
    open func disorder (orders:Array<Int>) -> Array<Int> {
        var temp = orders
        //        var count = Int(temp.count)
        temp.sort { (x, y) -> Bool in
            x > y
        }
        return temp
    }
}

//MARK:<----- public 测试----->
/* 不同模块的public */
////Cannot inherit from non-open class 'testPulic' outside of its defining module
//class subPublic1: testPulic {
//    //Overriding non-open instance method outside of its defining module
//    override func testPrint(source: String) {
//        print(<#T##items: Any...##Any#>)
//    }
//}

extension testPulic {
    func test() {
        print("hello, world")
    }
}

/* 相同模块的public */

class subPublic: publicClass {
    override func testPrint(source: String) -> String {
        return source
    }
}

extension publicClass {
    func test() {
        print("qunidayedeba")
    }
}

//MARK:<----- internal测试----->

class subInternal: internalClass {
    override func testInternal(array: [Any]) {
        print("laozibuxiangdayinle")
    }
}

extension internalClass {
    
}


//MARK:<-----fileprivate----->

//class subFileprivate: fileprivateClass {
//
//}



//MARK:<----- private----->
//class subPrivate: privateClass {
//
//}

//MARK:<----- deinit----->
class anotherDeinitClass: NSObject {
    var test: Int = 0
    override init() {
        
    }
    func testDeinit() {
        print("测试deinit")
    }
}
class deinitClass {
    var item: anotherDeinitClass?
    func testDeinit() {
        item = anotherDeinitClass()
        print("初始化完成")
    }
    deinit {
        //清理
        self.item = nil
    }
}

//MARK:<----- static----->
enum testEnum {
    case one
    //Class methods are only allowed within classes; use 'static' to declare a static method
//    class func testPrint()
    static func testPrint() {}
    //Class properties are only allowed within classes; use 'static' to declare a static property
//    class var test: String?
    static var testq: String?
}

protocol testProcotol {
    //Class methods are only allowed within classes; use 'static' to declare a static method
//    class func testPrint()
    static func testPrint()
    //Class properties are only allowed within classes; use 'static' to declare a static property
//    class var test: String?
    static var testq: String? { get }
}

class testClass {
    //Class stored properties not supported in classes; did you mean 'static'?
//    class var str: String?
    static var str: String?
    
    static func testPrint() {}
    class func testPrints() {}
    
}

//MARK:<----- extension ----->
/* 1. 添加计算型实例属性和计算性类型属性*/
extension UIView {
    //Extensions must not contain stored properties
//    var subClass: Int
    
    var x: CGFloat {
        set {
            self.frame.origin.x = newValue
        }
        get {
            return self.frame.origin.x
        }
    }
    
    var y: CGFloat {
        set {
            self.frame.origin.y = newValue
        }
        get {
            return self.frame.origin.y
        }
    }
    
    var width: CGFloat {
        set {
            self.frame.size.width = newValue
        }
        get {
            return self.frame.size.width
        }
    }
    
    var height: CGFloat {
        set {
            self.frame.size.height = newValue
        }
        get {
            return self.frame.size.height
        }
    }
}

/* 2. 定义实例方法和类型方法 */
class Student {
    var name = ""
    var age = 1
}

extension Student {
    func printCurrentStudentName() {
        print("我的名字是\(self.name)")
    }
    
    class func printCurrentStudentAge() {
        print("我的年龄是")
    }
}

/* 3. 提供新的初始化器 */
struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

/* 4.定义下标 */
extension Int {
    subscript (digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

/* 5. 添加新的类型 */

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

/* 6. 使现有类型符合协议 */
protocol StudentProtocol {
    var address: String { get }
}

extension Student: StudentProtocol {
    var address: String {
        return "address"
    }
}

//MARK:<------ class/enum/struct----->

protocol BaseProtocol {
    func testPrint()
}

/* 1. class */
class exampleClass: BaseProtocol {
    //Class stored properties not supported in classes; did you mean 'static'?
//    class var student: Student = Student.init()
   
    //支持属性和初始化器
    let testSub: String
    var anotherSub: Int
    init(name: String) {
        testSub = name
        anotherSub = 0
    }

    
    static var student: Student {
        set {
            self.student = newValue
        }
        get {
            return self.student
        }
    }
    
    class var subStudent: Student {
        set {
            self.subStudent = newValue
        }
        get {
            return self.subStudent
        }
    }
    
    func testPrint() {
        
    }
    
    static func testSelf() {
        
    }
    
    class func testPrints() {
        
    }
    
    //'mutating' isn't valid on methods in classes or class-bound protocols
//    mutating func testPrintNews() {
//
//    }
}

class subExampleClass {
    
}



/* 2. enum */
enum exampleEnum: BaseProtocol {
    
    case one
    
    //Enums must not contain stored properties
//    let testSub: String
    
    var anotherSub: Int {
        set {
            self.anotherSub = newValue
        }
        get {
            return self.anotherSub
        }
    }
    
    static var test: String {
        set {
            self.test = newValue
        }
        get {
            return self.test
        }
    }
    
    //Class properties are only allowed within classes; use 'static' to declare a static property
//    class var subTest: Student {
//        set {
//            self.subTest = newValue
//        }
//        get {
//            return self.subTest
//        }
//    }
    
    func testPrint() {
        
    }
    
    public func testSelf() {
        
    }
    
    //Class methods are only allowed within classes; use 'static' to declare a static method
//    class func testPrints () {
//
//    }
    
    static func testPrints() {
        
    }
    
    mutating func testPrintNews() {
        
    }
}

//'subExampleEnum' declares raw type 'exampleEnum', but does not conform to RawRepresentable and conformance could not be synthesized
//enum subExampleEnum: exampleEnum {
//    func testPrint() {
//
//    }
//}

/* 3. struct */
struct exampleStruct: BaseProtocol {
    let testSub: String
    var anotherSub: Int
    init(name: String) {
        testSub = name
        anotherSub = 0
    }
    static var test: String {
        set {
            self.test = newValue
        }
        get {
            return self.test
        }
    }
    
    //Class properties are only allowed within classes; use 'static' to declare a static property
//    class var subTest: Student {
//        set {
//            self.subTest = newValue
//        }
//        get {
//            return self.subTest
//        }
//    }

    
    func testPrint() {
        
    }
    
    public func testSelf() {
    
    }
    
    //Class methods are only allowed within classes; use 'static' to declare a static method
//    class func testPrints() {
//
//    }
    
    static func testPrints() {
        
    }
    
    mutating func testPrintNews() {
        
    }
}

//Editor placeholder in source file
//struct subExampleStruct: exampleStruct {
//
//}


//MARK:******************************* 在语句中使用的关键字 *******************************

//MARK:<----- where ------>
/* 3. 与协议结合 */
protocol aProtocol {
    
}
//只给遵守aProtocol协议的UIButton子类 添加了拓展
extension aProtocol where Self: UIButton {
    func getString() -> String {
        return "string"
    }
}

class subView: UIButton,aProtocol {
    
}


class anothSubView: UILabel,aProtocol {
    
}

/* 4. 可以再associatedtype 后面声明的类型后面追加where语句 */
/* 标准库中Sequence 中 Element 的声明如下： */
//protocol Sequence {
//    associatedtype Element where Self.Element == Self.Iterator.Element
//}

//public mutating func insert<S>(contentsOf newElement: S, at i: String.Index) where S : Collection, S.Element == Character

/**
 他限定了Sequence中Element 这个类型必须和Iterator.Element 的类型一致。
 */

//MARK:******************************* 在表达式和类型使用的关键字 *******************************

//MARK:<------------ 1.2 throws 和 rethrows ------------>
extension Array {
    func _map<T>(transform: (_ element: Int) throws -> T)  -> [T] {
        var ts = [T]()
        for e in self {
           // Call can throw but is not marked with 'try'
//            ts.append(transform(e as! Int))
            ts.append( try! transform(e as! Int))
        }
        return ts
    }
}

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}


struct PurchaseSanck {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

class MyClass: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
    
    
    var num = 1
    
    func copy() -> Self {
        let result = type(of: self).init()
        result.num = num
        return result
    }
    
    //swift 中 构建一个Self 类型的对象的话，需要有required 关键字修饰的初始化方法，这是因为swift 保证当前类和子类都能响应这个init方法
    required init() {
        
    }
}

protocol Copyable {
    func copy() -> Self
    func clamp(intervalToClamp: Self) -> Self
}



class A: Copyable {
    var num = 1
    
    required init() {
        
    }
    
    func copy() -> Self {
        let type1 = type(of: self)
        print(type1)
        let result = type1.init()
        result.num = num
        return result
    }
    
    func clamp(intervalToClamp: A) -> Self {
        let result = type(of: self).init()
        result.num = num
        return result
    }
    
    class func calssFunc() -> Self {
        let type = self
        print(type)
        let result = type.init()
        return result
    }
}

/**
 在 A 中的实例方法中 self表示当前实例， 在类方法中self 表示当前类的类型
 */

class B: A {
    func clamp(intervalToClamp: B) -> Self {
        let result = type(of: self).init()
        result.num = num
        return result
    }
}

//MARK:******************************* 以数字符号#开头的关键字 *******************************
//MARK:<------------- 1. @available 和 #available --------------->
//MARK:------ 1.1 @available
/* 1.存储属性是不能够使用@available */
//Stored properties cannot be marked potentially unavailable with '@available'
//        @available (iOS 7.0, *)
//        var property: String?

/* 2. 计算属性可以使用@available */
let number1 = 1
let number2 = 2
@available (iOS 7.0, *)
var sum: Int {
    get {
        return number1 + number2
    }
}

/* 3. 结构体 */
@available (iOS 7.0, *)
struct MyStruct {}

/* 4. 枚举 */
@available (iOS 7.0, *)
enum MyEnum {}

/* 5. 协议 */
@available (iOS 7.0, *)
protocol MyProtocol {}

/* 6. 类型 */
@available (iOS 7.0, *)
class MyNewClass {}

//MARK:<-------------3. @objc 和 Dynamic ------------------------------->
/**
 1. 由于和Objective-C的兼容，apple采用的做法允许我们在同一个项目中同时使用swift 和 Objective-C 来进行开发。通过添加 {product-module-name}-Bridging-Header.h桥接文件，并在其中填写使用头文件，就可以在swift中使用Objective-C代码了
 2. 想要在Objective-C 中使用swift 的类型的时候，事情就复杂一些。需要在我们的Objective-C中导入 {product-module-name}-Swift.h来完成。由于Objective-C 对象是基于运行时的（在运行时调用时在决定实际调用的具体实现），而swift类型的成员或者方法在编译时就已经决定。那么我们如果实现Objective-C 调用swift，解决办法：
 * 我们需要将暴露给Objective-C 使用的任何地方（包括类，属性和方法）的声明前面加上@objc 修饰符（这个步骤只需要对那些不是继承自NSObject的类型进行，如果是继承自NSObject的话，swift 会默认自动为所有的非private的类和成员加上@objc，这就是说，对于一个继承自NSObject的swift 类型，你只需要导入头文件就可以在Objective-C中使用这个类了）
 */
//MARK:----- 3.1 @objc
/**
 可以使用@objc 修饰的类型包括：
 * 未嵌套的类
 * 协议
 * 非泛型枚举
 * 类和协议中的属性和方法
 * 构造器和析构器
 * 下标
 */
/* 1. 修饰类 */
@objc class MyHelper:NSObject {
    
}

@objc class MyViewController: UIViewController {
    
}

/**
 swift中类名，可以使用中文命名，而Objective-C 中却只能使用ASCII码，在使用@objc时，需要指定Objective-C中使用的ASCII名称。这个知识点请
 */
@objc(fanyunfei)
class 我的类: NSObject {
    @objc(greeting:)
    func 打招呼(名字: String) {
        print("哈喽, \(名字)")
    }
}

/* 2. 协议 */
/* @objc修饰的协议与修饰类一样，需要注意的是，如果协议中由optional修饰的方法，就必须使用@objc来修饰： */
@objc protocol counterDataSource {
    @objc optional func incrementForCount(count: Int) -> Int
    @objc optional var fixedincrement: Int { get }
}

//MARK:<------------- 4. mutating 和 nonmutating ------------->
//MARK:---- 4.1
protocol Vehicle {
    var numberOfWheels: Int { get }
    var color: UIColor { get set }
//    nonmutating func nonchangeColor()
    mutating func changeColor()
}

struct MyCar: Vehicle {
    //Cannot assign to property: 'self' is immutable, 协议中方法默认就是nonmutating类型的
//    nonmutating func nonchangeColor() {
//        color = UIColor.brown
//    }

    
    mutating func changeColor() {
        color = UIColor.red
    }
    
    let numberOfWheels = 4
    var color: UIColor = UIColor.blue
//    mutating func changeColor() {
//        color = UIColor.red
//    }
}

//MARK:<---------------- 6 required/convenience ----------------->
//MARK:----- 6.1
/* 对于某些我们希望子类中一定实现的指定初始化方法，我们可以通过添加required 关键字进行限制，强制子类对这个方法重写 */
class People {
    var name: String
    required init(name: String) {
        self.name = name
    }
}

extension People {
    convenience init(smallName: String) {
        self.init(name: smallName)
    }
}

class Teacher: People {
    var course: String
    init(name: String, course: String) {
        self.course = course
        super.init(name: name)
    }
    
    
    required init(name: String) {
        self.course = "math"
        super.init(name: name)
    }
}

//MARK:----- 6.2 convenience

/**
 1. 增加init 的初始化方法
 2. 必须调用swift 同一个类中designated 初始化完成设置
 3. convenience 的初始化方法不能被子类重写或者是从子类中以super的方式调用
 */

class ChinesePeople {
    var name: String
    init(name: String) {
        self.name = name
    }
}

extension ChinesePeople {
    convenience init(smallName: String) {
        self.init(name: smallName)
    }
}

class StudentA: ChinesePeople {
    var grade: Int
    init(name: String, grade: Int) {
        self.grade = grade
        super.init(name: name)
        //'super.init' called multiple times in initializer
//        super.init(smallName: name)
    }
    
    override init(name: String) {
        grade = 1
        super.init(name: name)
    }
    
//    override init(smallName: String) {
//        grade = 1
//        //Must call a designated initializer of the superclass 'ChinesePeople'
//        super.init(smallName: smallName)
//    }
}

//MARK:<--------------- 9. unowened 和 weak ------------------->

//MARK:----- 9.2 delegate
//RequestManager.swift
class RequestManager: RequestHandler {
    @objc func requestFinished() {
        print("请求完成")
    }
    
    func sendRequest() {
        let req = Request()
        req.delegate = self
        req.send()
    }
}

//Request.swift
@objc protocol RequestHandler {
    @objc optional func requestFinished ()
}

class Request {
    weak var delegate: RequestHandler!
    func send() {
        //发送请求
    }
    func gotResponse () {
        //请求返回
        delegate.requestFinished!()
    }
}

//MARK:----- 9.3 closure

class Person {
    let name: String
//    lazy var printName: () -> () = {
//        print("The name is \(self.name)")
//    }
    
    lazy var printName:() -> () = {
        [weak self] in
        if let strongSelf = self {
            print("The name is \(strongSelf.name)")
        }
    }
    
    init(personName: String) {
        name = personName
    }
    
    deinit {
        print("Person deinit \(self.name)")
    }
}


//MARK:******************************* Attributes *******************************

//MARK:<-------------- 6.@inlinable 和 @usableFromInline ---------------->
extension Sequence where Element: Equatable {
//    @inlinablelinein
    public func allEqual() -> Bool {
        var iterator = makeIterator()
        guard let first = iterator.next() else {
            return true
        }
        
        while let next = iterator.next() {
            if first != next {
                return false
            }
        }
        return true
    }
}

//MARK:<------------------ 9 @NSManaged--------------------->

//class MyModel: NSManagedObject {
//    @NSManaged var title: String
//}


class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK:<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< swift 关键字讲解 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        //MARK:******************************* 在声明中使用的关键字 *******************************
        //MARK:<-------------- 1. associatedtype --------------->
        /**
         定义一个协议时，有的时候声明一个或多个关联类型作为协议定义的一部分将会非常有用。关联类型为协议中的某个类型提供了一个占位名，其代表的实际类型在协议被采纳时才会被指定。可以通过associatedtype 关键字来置顶关联对象。比如说：使用协议声明更新cell的方法
         */
        
        /* 模型 */
        struct Model {
            let age: Int
        }
        
        /* 遵守TableViewCell */
        class MyTableViewCell: UITableViewCell, TableViewCell {
            typealias T = Model
            func updateCell(_ data: Model) {
                //do something ...
            }
        }
        
        
        //MARK:<-------------- 2. typealias --------------->
        /**
         typealias 使用来为已经存在的类型重新定义名字的，通过命名，可以使代码变得更加的清晰。使用的语法也很简单，使用typealias 关键字像使用普通的赋值语句一样，可以将某个已经存在的类型赋值为新的名字
         */
        
        //MARK:----- 2.1 重新定义闭包类型
        typealias DownSuccess = (_ json: URLResponse, _ filePath: String?) -> ()
        
        //MARK:----- 2.2 protocal 组合
        typealias changeProtocol = changeName & changeSex
        
        struct Persion: changeProtocol {
            func changeNameTo(name: String) {
                print("改变名字")
            }
            
            func changeSexTo(sex: Bool) {
                print("改变性别")
            }
        }
        
        //MARK:----- 2.3 基本类型（应用很广泛）
        
        /**
         public typealias AnyClass = AnyObject.Type
         public typealias NSInteger = Int
         */
        
        //MARK:自定义类型
        /**
         在实际项目过程中，如果有OC和swift 混编的情况，不免要对OC进行swift化，重构的替换工作非常耗时，可以利用 typealias规避这个问题
         */
        /**
         OC中项目里有个类
         #import "OCClass.h"
         
         swift 重构之后
         import SwiftClass
         
         
         typealias OCClass = SwiftClass
         */
        
        //MARK:<-------------- 3. class --------------->
        
        //MARK:----- 3.1 当前class 为基类
        /**
         当前class为基类，所有属性都有默认值时，可以有类的初始化方法，也可以不实现类的初始化方法。
         */
        class NewPerson {
            var name: String?
            var age: Int = 0
        }
        
        /* 当不指定默认值时，类型必须实现指定构造方法（designed） */
        class NewPerson1 {
            var name: String
            var age: Int
            init() {
                name = ""
                age = 0
            }
        }
        //MARK:----- 3.2 当class有父类时，指定构造器（designed）必须调用其父类的指定构造器（designed）
        class NewPerson2: NewPerson1 {
            init(name: String) {
                super.init()
                self.name = name
                self.age = 0
            }
        }
        
        /* 子类也可以复写父类的 designed 构造方法，但是调用父类的designed的方法之前，必须要初始化子类所有属性的值 */
        class NewPerson3: NewPerson1 {
            override init() {
                super.init()
                self.name = ""
                self.age = 0
            }
        }
        
        //MARK:----- 3.3 当子类有convenience构造方法时， convenience构造方法必须要调用designed构造方法
        
        class NewPerson4: NewPerson1 {

            init(name: String, age: Int) {
                super.init()
                self.name = name
                self.age = age

            }
            
            convenience init(name: String) {
                self.init(name: name, age: 0)
            }
            
            convenience init(age: Int) {
                self.init(name: "nidayede", age: age)
            }
        }
        /**
         1. 初始化路径必须保证对象完全初始化，这可以通过调用本类型的designated初始化方法来得到保证
         2. 子类的designated初始化方法必须调用父类的designated方法，以保证父类也完成初始化
         3. convenience初始化方法都必须调用同一个类中的designated初始化完成设置
         4. convenience的初始化方法是不能被子类重写或从子类中以super的方式被调用的
         */
        
        //FIXME:1. 每个class 保证至少有一个初始化方法， 可以是默认的，也可以是designed 的
        //FIXME:2. 保证初始化完成后， 每个property 有一个初始值，无论是定义时声明的，还是初始化时赋值的
        //FIXME:3. 如果class有继承关系，当子类class 不实现构造方法时，子类将自动从父类class继承初始化方法
        //FIXME:4. 当class的所有属性，在定义时显示或隐式的给出了赋值，那么当不谢当前类的初始化方，编译器会为该类生成默认的初始化方法。如果，属性定义时部分未给出默认值，也不是先类的构造方法，则编译报错
        
        
        //MARK:<-------------- 4. subscript --------------->
        /**
         在swift中， class， structures ，enum 都可以定义subscript, subscript可以帮助我们更方便的访问或者设置一个集合中的某个成员
         */
        struct Matrix {
            let rows: Int, columns: Int
            var grid: [Double]
            init(rows: Int, columns: Int) {
                self.rows = rows
                self.columns = columns
                grid = Array(repeating: 0.0, count: rows * columns)
            }
            func indexIsValid(row: Int, column: Int) -> Bool {
                return row >= 0 && row < rows && column >= 0 && column < columns
            }
            subscript(row: Int, column: Int) -> Double {
                get {
                    assert(indexIsValid(row: row, column: column), "Index out of range")
                    return grid[(row * columns) + column]
                }
                set {
                    assert(indexIsValid(row: row, column: column), "Index out of range")
                    print("newValue is \(newValue)")
                    grid[(row * columns) + column] = newValue
                }
            }
        }
        
        var matrix = Matrix(rows: 2, columns: 2)
        matrix[0, 1] = 1.5
        
        
        //MARK:<-------------- 5. inout --------------->
        /**
         当我们需要通过一个函数来改变函数外面变量的值（以引用方式传递）时， 可以使用inout关键字来修饰。
         */
        var test1: CGFloat = 50
        func addTestMethod(test2: inout CGFloat, test3: CGFloat = 10) {
            test2 += test3
        }
        
        func testMethod () {
            print("test1 is \(test1)")
            addTestMethod(test2: &test1)
            print("test1 is \(test1) now ")
        }
        
        testMethod()
        
        
        //MARK:<-------------- 6. operator/infix/postfix/precedence/associativity --------------->
        /**
         与Objective-C 不同 ，swift 支持覆盖或创建运算符。最简单的用例应该是重新定义一些计算符。
         */
        //FIXME:当重新定义新的运算符或者覆盖已有的运算符时，需要用operator 关键字声明
        /**
         操作符类型：
         1. 中置运算符（infix operator）
         2. 前置运算符（prefix operator）
         3. 后置运算符（postfix operator）
         */
        //MARK:----- 6.1 infix operator 使用的例子
        let infixOperatorResult = 2 +++ 3
        print("infixOperatorResult is \(infixOperatorResult)")
        
        //MARK:----- 6.2 prefix operator 使用例子
        let prefixOperatorResult = ==+2
        print("prefixOperatorResult is \(prefixOperatorResult)")
        
        //MARK:----- 6.3 postfix operator 使用例子
        let postfixOperatorResult = 2+==
        print("postfixOperatorResult is \(postfixOperatorResult)")
        
        
        //MARK:<-------------- 7. open/public/internal/fileprivate/private --------------->
        /**
         1. private: private访问级别所修饰的属性或者方法只能在当前类里面访问
         2. fileprivate: fileprivate 访问级别所有修饰的属性或者方法在当前的swift源文件里可以访问
         3. internal(默认访问级别，internal修饰符可写可不写)： internal访问级别所有修饰的属性或方法在源代码所在的整个模块都可以访问
            * 如果是框架或者库代码，则在整个框架内部都可以访问，框架有外部代码所引用时，则不可访问
            * 如果是App代码，也是在整个App代码，也是在整个App内部可以访问
         4. public： public访问级别修饰的属性或方法可以被任何人访问，但其他module中不可以被override和继承，而在module内可以被override和继承
         5. open： open修饰的属性和方法可以被任何人使用，包括override和继承
         
         open > public > internal > fileprivate > private
         */
        
        //MARK:----- 7.1 open
        /* open修饰的方法可以被访问 */
        let disOrder = testOpen()
        disOrder.openProperty = 1000
        print(print(disOrder.disorder(orders: [1,2,3,4,5,6,7,8,9])))
        print("disOrder.openProperty is \(disOrder.openProperty) now!")
        
        /* open修饰的方法可以被override */
        let disorder = subOpen()
        disorder.openProperty = 10000
        print(print(disorder.disorder(orders: [1,2,3,4,5,6,7,8,9])))
        print("disorder.openProperty is \(disOrder.openProperty) now!")
        
        //MARK:----- 7.2 public
        let testResult = testPulic()
        testResult.testPrint(source:"qunidayede")
        
        /**
         从上面的testPublicSDK例子中可以看出：
         不同模块用public修饰的类
         1. 不可以继承：
         2. 不可以重写方法：
         3. 实例方法可以调用
         4. 可以extension(扩展)
         相同模块用public修饰的类型
         1. 可以继承
         2. 也可以重写方法
         3. 可以extension
         */
        
        let testpublic = testPulic()
        testpublic.test()
        
        //MARK:----- 7.3 internal
        /**
         通过internalClass类可以看出
         1. 可以继承
         2. 也可以重写方法
         3. 可以extension
         */
        
        //MARK:----- 7.4 fileprivate
        /**
         通过fileprivateClass可以看出：
         1. 不可以访问
         */
        
        let testcutom = cutomClass()
        testcutom.test()
        
        //MARK:----- 7.5 private
        /**
         通过privateClass 类可以看出
         1. 被private修饰的类不可以访问
         2. 被private修饰的方法不可以访问，只能在类内部访问
         
         */
        
        //MARK:<-------------- 8. deinit --------------->
        /**
         类反初始化器方法
         */
        let testDeinit = deinitClass()
        testDeinit.testDeinit()
//        testDeinit = nil
        
        
        //MARK:<-------------- 9. static --------------->
        /**
         从上面的testClass/testEnum/testProcotol 三个例子可以看出：
         1. class 中可以使用 static 和 class 声明类方法， 不能使用class 类型的存储变量，只能使用static 声明存储变量
         2. procotol 和 enum 中只能用static 声明方法 和 属性
         */
    
        //MARK:<-------------- 10. import --------------->
        //FIXME:同一个xcodeProject 不需要import， 使用另一个mudule时才需要import
        //FIXME:使用cocoapods 导入的第三方库，必须用xcode 对工程进行编译后，才可以提示
        
        //MARK:<-------------- 11. extension --------------->
        /**
         * 添加计算实例属性和计算类型属性,不可以添加存储属性
         * 定义实例方法和类型方法
         * 提供新的初始化程序
         * 定义下标
         * 定义和使用新的嵌套类型
         * 使现有类型符合协议
         */
        //MARK:----- 11.1 添加计算实例属性和计算类型属性
        let view = UIView.init()
        view.width = 200
        view.height = 40
        view.x = 100
        view.y = 100
        view.backgroundColor = UIColor.black
        self.view.addSubview(view)
        
        //MARK:----- 11.2 定义实例方法和类型方法
        
        let jack = Student()
        jack.name = "jack"
        jack.printCurrentStudentName()
        
        Student.printCurrentStudentAge()
        
        //MARK:----- 11.3 提供新的初始化器
        /* 扩展前 */
        let defaultRect = Rect()
        let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
        print("membewiseRect is \(memberwiseRect)")
        /* 扩展后 */
        let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
        print("centerRect is \(centerRect)")
        
        //MARK:----- 11.4 定义下标
        /* 下面的例子就是给Int类型添加一个下标，该下标表示十进制数从右向左的第n个数字 */
        print("78654321[5] is \(78654321[5])")
        
        //MARK:----- 11.5 定义和使用新的嵌套类型
        func printIntegerKinds(_ numbers: [Int]) {
            for number in numbers {
                switch number.kind {
                case .negative:
                    print("- ", terminator: "")
                case .zero:
                    print("0 ", terminator: "")
                case .positive:
                    print("+ ", terminator: "")
                }
            }
            print("")
        }
        printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
        
        //MARK:------ 11.6 使现有类型符合协议
        print("jack.address is \(jack.address)")
        
        
        
        //MARK:<------------- 12. class/enum/struct --------------->
        /**
         通过exampleStruct/exampleEnum/exampleClass 的例子中可以看出：
         相同点：
         1. struct/enum/class: 都可以拥有出属性和方法（enum 本身不能储存属性，可以有计算属性）
         2. 都可以拥有函数
         3. class 和 struct 可以用 自己的初始化器
         
         不同点：
         1. class 可以继承， enum 和struct 不可以继承
         2. class 为引用类型， enum 和 struct 为值类型
         3. class 声明类型方法， 可以使用class 和 static 关键字， enum 和static 只能用 static
         4. class 中不能使用mutating 修饰方法， enum和static 可以
         5. struct 使用基本数据类型
         */
        
        
        //MARK:******************************* 在语句中使用的关键字 *******************************
        //MARK:<-------------- 1.guard/if --------------->
        let name: String? = "老王"
        let age: Int? = 10
        
        /* 1. if 与 if let */
        //1. 如果常量是可选项（Optianl）, if 判断后仍然要解包（!）
        if name != nil && age != nil {
            print(name! + String(age!))
        }
        
        //2. 如果常量是可选项（Optional）,if let 判断后不需要解包（!）,{}内一定有值
        if let nanmeNew = name, let ageNew = age {
            // 进入分支后，nameNew 和 ageNew 一定有值
            print(nanmeNew + String(ageNew))
        }
        
        //3. if var 和 if let 的区别就是在可以自 { } 内修改变量的值
        if var nameNew = name, let ageNew = age {
            nameNew = "老李"
            print(nameNew + String(ageNew))
        }
        
        /* 2. guard let 用法 */
        /**
         guard let 和  if let 刚好相反，guard let 守护一定有值，如果没有，直接返回
         */
        guard let nameNew = name, let ageNew = age else {
            print("姓名 或 年龄 为 nil")
            return
        }
        //代码执行至此，nameNew 和 ageNew 一定有值
        print(nameNew + String(ageNew))
        
        
        /* 3. guard 与 if  */
        func apply () -> Bool {
            if let image = UIImage(named: "some") {
                print(image)
            } else {
                return false
            }
            return true
        }
        
        
        func applyNew () -> Bool {
            guard let image = UIImage(named: "some") else {
                return false
            }
            print(image)
            return true
        }
        
        /* 从上面的两个例子似乎看不出guard 和 if 的优劣势， 我们在看下面的例子 */
        
        func handleJSON (data: [String: [String: String]]) -> String? {
            if let item = data["app"] {
                if let name = item["name"] {
                    if name == "swift" {
                        if let age = item["age"] {
                            return age
                        } else {
                            return nil
                        }
                    } else {
                        return nil
                    }
                } else {
                    return nil
                }
            } else {
                return nil
            }
        }
        
        func handleJSONNew(data: [String: [String : String]]) -> String? {
            guard let item = data["app"] else { return nil }
            
            guard let name = item["name"] else { return nil }
            
            if name == "swift" {
                guard let age = item["age"] else { return nil }
                return age
            } else {
                return nil
            }
        }
        
        //MARK:<-------------- 2. defer --------------->
        /* 1. defer语句 */
        /**
         延迟推迟，相当于把操作放入栈中，后加入的先执行
         */
        /*
         分析代码:

         定位到目录并打开指定文件夹,倘若打开文件夹失败则结束函数。
         
         主要到defer的用法,这条语句并不会马上执行,而是被推入栈中,直到函数结束时才再次被调用。
         
         打开文件,倘若失败则结束函数。
         
         defer内容关闭文件,这条语句一样不会被马上执行,而是推入栈中,此时它位于defer{closeDirectory()}语句的上方,直到函数结束时才再次被调用。
         
         倘若一切都顺利,函数运行到最后了,开始从栈中依次弹出方才推入的defer语句,首先是closeFile(),其次是closeDirectory()。确实当我们处理完文件,需要先关闭文件,再关闭文件夹。如果文件打开失败,则直接执行关闭文件夹

         func doSthWithDefer() {
         openDirectory()
         defer {closeDirectory() }
         openFile()
         defer { closeFile() }
         }
         */
        
        
        
        /* 2. 关于defer的作用域 */
        /**
         并不是函数结束时开始执行defer 栈推出操作，而是每当一个作用域结束就进行该作用域defer执行
         */
        func lookforSth(name:String) {
            //作用域1整个函数是作用域
            
            print("1-1")
            
            if name == "" {
                //作用域2 if作用域
                print("2-1")
                
                defer {
                    print("2-2")
                }
                print("2-3")
            }
            
            print("1-2")
            
            defer {
                print("1-3")
            }
            
            print("1-4")
            
            if name == "hello" {
                //作用域3
                print("3-1")
                
                defer {
                    print("3-2")
                }
                
                print("3-3")
                
                defer {
                    print("3-4")
                }
            }
            
            print("1-5")
            
            defer {
                print("1-6")
            }
        }
        
//        lookforSth(name: "")
        
        func firstProcesses(_ isOpen: Bool) {
            
            //作用域1 整个函数作用域
            defer{
                print("推迟操作🐢")
            }
            
            print("😳")
            
            if isOpen == true {
                //作用域2 if的作用域
                defer{
                    print("推迟操作🐌")
                }
                print("😁")
            }
        }
        
//        firstProcesses(false)
        /*
         
         😳
         推迟操作🐢
         
         */
        
        
        firstProcesses(true)
        /*
         
         😳
         😁
         推迟操作🐌
         推迟操作🐢
         
         */
    
        //MARK:<------------- 3. fallthrough/switch --------------->
        /* fallthrough 主要应用在switch 语句中 */
        let index = 10
        
        switch index {
        case 100 :
            print("Value of index is 100")
        case 10,15 :
            print("Value of index is either 10 or 15")
        case 5 :
            print("Value of index is 5")
        default :
            print("default case")
        }
        
        
        switch index {
        case 100 :
            print("Value of index is 100")
            fallthrough
        case 10,15 :
            print("Value of index is either 10 or 15")
            fallthrough
        case 5 :
            print("Value of index is 5")
        default :
            print("default case")
        }
        /**
         从上面的例子中我们可以看出：如果我们不使用fallthrough语句，那么程序将在执行匹配的case语句后退出switch语句
         */
        
        //MARK:<------------- 4. repeat/while --------------->
        
        /* 1. while 循环 */
        var currentLevel: Int = 0, finalLevel: Int = 5
        let gameCompleted = true
//        while currentLevel <= finalLevel {
//            if gameCompleted {
//                print("You have passed level \(currentLevel)")
//                currentLevel += 1
//            }
//        }
//        print("outside of while loop")
        /**
         在while循环的每次迭代中，他都会检查条件currentLevel <= finalLevel.如果条件返回true，则执行while循环中的语句，否则循环终止
         
         You have passed level 0
         You have passed level 1
         You have passed level 2
         You have passed level 3
         You have passed level 4
         You have passed level 5
         outside of while loop
         */
        
        /* 2. repeat ... while */
        repeat {
            if gameCompleted {
                print("You have passed level \(currentLevel)")
                currentLevel += 1
            }
        } while (currentLevel <= finalLevel)
        print("outside of while loop")
        
        /**
         虽然这两个while 和 repeat while 循环具有相同的执行步骤，条件currentLevel <= finalLevel上 repeat while 循环只执行它里面的语句后执行
         You have passed level 0
         You have passed level 1
         You have passed level 2
         You have passed level 3
         You have passed level 4
         You have passed level 5
         outside of while loop
         */
        
        //MARK:<------------- 5. where --------------->
        /* 1. 可以在swift，for in 语句上做些条件限制 */
        let scores = [20, 8, 59, 60, 70, 80]
        scores.forEach {
            switch $0 {
            case let x where x > 60:
                print("及格")
            default:
                print("不及格")
            }
        }
        
        for score in scores where score >= 60 {
            print("这是及格的：\(score)")
        }
        
        /* 2. 在 do catch 里面使用 */
        enum ExceptionError:Error {
            case httpCode(Int)
        }
        func throwError() throws {
            throw ExceptionError.httpCode(500)
        }
        do {
            try throwError()
        } catch ExceptionError.httpCode(let htttCode) where htttCode >= 500 {
            print("server error")
        } catch {
            print("other error")
        }
        
        /* 3. 与协议结合 */
        let subview = subView()
        subview.getString()
        
        let anothersubview = anothSubView()
        //'anothSubView' is not a subtype of 'UIButton'
//        anothersubview.getString()
        
        /* 4. 可以再associatedtype 后面声明的类型后面追加where语句 */
        
        //MARK:<------------- 6. default -------------->
        /**
         swift 的方法是支持默认参数的，也就是说在声明方法时，可以给某个参数指定一个默认的使用的值。在调用该方法时要是传入了这个参数，则使用传入的值，如果缺少这个参数，那么直接使用设定的默认值进行调用。
         */
        func sayHello1(str1: String = "Hello", str2: String, str3: String) {
            print(str1 + str2 + str3)
        }
        
        func sayHello2(str1: String, str2: String = "qunidayede", str3: String = "World") {
            
            print(str1 + str2 + str3)
        }
        
        /* 其他不少语言只能使用后面一种写法，将默认参数作为方法的最后一个参数 */
        sayHello1(str2: " ", str3: "World")
        sayHello2(str1: "Hello", str3: " ")
        
    
        
        //MARK:<------------- 7. break/continue/return -------------->
        //MARK:----- 7.1 break
        var a = 0
        var b: Bool = false
        func testBreak() {
            for i in 0..<10 {
                if i == 5 {
                    break//满足条件直接跳出循环框架， 不在执行本轮下面的 a = a + 1, 直接执行框架外面的语句
                }
                a = a + 1
            }
            b = true
        }
        testBreak()
        print("testBreak() a == \(a)")
        print("testBreak() b == \(b)")
        
        //MARK:----- 7.2 retrun
        var a1 = 0
        var b1: Bool = false
        func testRetrun() {
            for i in 0..<10 {
                if i == 5 {
                    return//满足条件直接跳出本方法，次轮下面的 a = a + 1和 for 循环外面  b = true 都不执行
                }
                a1 = a1 + 1
            }
            b1 = true
        }
        
        testRetrun()
        print("testRetrun() a1 == \(a1)")
        print("testRetrun() b1 == \(b1)")
        //MARK:------ 7.3 continue
        
        var a2 = 0
        var b2: Bool = false
        
        func testContinue() {
            for i in 0..<10 {
                if i == 5 {
                    continue// 满足条件，本次不执行a = a + 1
                }
                a2 = a2 + 1
            }
            b2 = true
        }
        testContinue()
        print("testContinue() a2 == \(a2)")
        print("testContinue() b2 == \(b2)")
        
        
        
        //MARK:******************************* 在表达式和类型使用的关键字 *******************************
        
        //MARK:<-------------- 1. do catch /try / throw /throws / rethrows --------------->
        /* do 关键字应该属于语句中使用的关键字， 由于这里个catch/ try/ throws / rethrows 等关键在实际应用中很紧密，所以在此就柔和到一块讲解 */
        //MARK:----- 1.1 do - catch & try 语法
        /*
        do {
            try //throws error 语句
        } catch  {
            //错误处理语句
        }
        */
        //自定义错误类型枚举
        enum TError: Error {
            case err1
            case err2
            case err3
        }
        
        //有抛出错误的方法
        func getNetwordData () throws {
            //抛出错误
            throw TError.err1
        }
        
        //调用函数
        func myMethod () {
            do {
                try getNetwordData()
            } catch let error {
                print("error: \(error)")
            }
        }
        
        myMethod()
        
        /**
         1. 可以抛出错误的方法必须在方法声明的后面加上throws 关键字，表示该方法可以抛出错误
         */
//        func throwMethod1 () throws {
//            return TError.err1
//        }
//
//        func throwMethod2(_ parameter: Int8) throws -> (Bool) {
//
//        }
        /* 2. try? 和 try! */
        /**
         使用 try? 和 try!, 则可以不用do-catch 语句包裹 try? 和try!, try后面的可以抛出错误的局域不用do - catch 包裹：
         1. 其中，try? 修饰的时候，如果throws 方法抛出错误，则方法返回nil, 反之如果没有发送错误则返回可选值
         2. try! 修饰的时候，可以打断错误传播链，throws方法的错误不传播给调用者，这样的话一定要去确保程序不发送错误，否则程序会在发生错误时推出
         */
        let jsonSting = "{\"name\": \"zhang\"}"
        let data = jsonSting.data(using: .utf8)
        
        do {
            let json3 = try JSONSerialization.jsonObject(with: data!, options: [])
            print(json3)
        } catch let error {
            print(error)
        }
        
        /**
         上面是一个反序列化的的例子: 反序列化 throw 抛出异常
         方法一： 推荐try?, 如果解析成功，就有值，否则，为nil
         let json = try? JSONSerialLization.jsonObject(with:data!, oprions:[])
         
         方法二： 强烈不推荐 try!, 如果解析成功，就有值，否则崩溃，有风险
         let json = try! JSONSerialization,jsonObject(with:data!, options: [])
         
         方法三： 处理异常，能够接受大错误，并且输出错误， 如果用 try catch 一旦不平衡，就会出现内存泄漏
         */
        
        //MARK:----- 1.2 throws 和 rethrows
        /**
         public func map<T>(@noescape transform: (Self.Generator.Element) throws -> T) rethrows -> [T]
         */
        enum CalculationError: Error {
            case DivideByZero
        }
        
        func squareOf(x: Int) -> Int {return x*x}
        
        func divideTenBy(x: Int) throws -> Double {
            guard x != 0 else {
                throw CalculationError.DivideByZero
            }
            return 10.0 / Double(x)
        }

        
        let num5 = [10, 20, 30, 40, 50]
        let ns:[Int]
        ns = num5._map(transform: squareOf)
        print(ns)
        
        
        let ns3: [Double]
        try ns3 = num5._map(transform: divideTenBy)
        print(ns3)
        
        /**
         从上面的_map方法可以看出，在有异常抛出的地方就一定需要使用try 语法。
         _map 如果抛出异常，仅可能因为传递给它的闭包的调用导致了异常。如果闭包的调用没有导致异常，编译器就知道这个函数不会抛出异常。
         */
        
        let vendingMachine = VendingMachine()
        vendingMachine.coinsDeposited = 8
        
        do {
            //Errors thrown from here are not handled because the enclosing catch is not exhaustive
            try buyFavoriteSnack(person: "alice", vendingMachine: vendingMachine)
            // Enjoy delicious snack
        } catch VendingMachineError.invalidSelection {
            print("Invalid Selection.")
        } catch VendingMachineError.outOfStock {
            print("Out of Stock.")
        } catch VendingMachineError.insufficientFunds(let coinsNeeded) {
            print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
        } catch {
            print("other error")
        }

        //MARK:<------------- 2. Any 和 AnyObject ------------->
        /**
         AnyObject 可以代表任何class 类型的实例
         Any 可以表示任意类型，甚至包括方法（func） 类型
         
         
         如果我们在代码中里大量使用这两者的话，往往意味着代码可能在结构和设计上存在问题。最好避免依赖和使用这两者，应当明确地指出确定的类型
         */
        
        //MARK:<------------- 3. as/ as!/ as? ------------------------- >
        //MARK:----- 3.1 as
        /* 从派生类转换为基类，向上转型 */
        class Animal {}
        class Cat: Animal {}
        let cat = Cat()
        let animal = cat as Animal
        
        //MARK:----- 3.2 as!
        /* 向下转型时使用，由于是强制类型转换，如果转换失败会报 runtime 运行错误 */
        let animal1: Animal = Cat()
        let cat1 = animal as! Cat
        
        //MARK:----- 3.3 as?
        /* as? 和 as！转换规则完全一样。但是 as?如果转换不成功的时候变灰返回一个nil 对象。 */
        if let cat =  animal as? Cat {
            print("cat is not nil")
        } else {
            print("cat is nil")
        }
        
        //MARK:<------------- 4. self 和 Self ----------------->
        /**
         //'Self' is only available in a protocol or as the result of a method in a class; did you mean 'A'?
         1.Self可以用于协议(protocol)中限制相关的类型
         2.Self可以用于类(Class)中来充当方法的返回值类型
         */
        let obect = MyClass()
        obect.num = 100
        
        let newObject = obect.copy()
        obect.num = 1
        print(obect.num)
        print(newObject.num)
        
        /**
         从上面Copyable的定义来看， 接受实现该接口的自身的类型，并返回一个同样的类型
         
         A的实例方法中self表示当前实例，利用type(of: self)获取当前对象的类型，
         A的类方法中self就表示当前类的类型，而Self则只能用来表示返回值的类型。
         对比A和B所实现的协议的方法可以看出在协议中的方法接收的参数类型必须换成各自类的类型，否则会报'Self' is only available in a protocol or as the result of a method in a class; did you mean 'A'?
         
         */
        
        //MARK:******************************* 模式中使用的关键字 *******************************
        
        //MARK:<-------------- 1. 关键字 ‘_’ -------------->
        //MARK:----- 1.1 格式化数字字面量
        let paddedDouble = 123_000_000
        
        //MARK:----- 1.2 忽略元组的元素值
        let http404Error = (404, "Not Found")
        let (_ , errorMessage) = http404Error
        
        //MARK:----- 1.3 忽略区间值
        let power = 10
        for _ in 1...power {
            
        }
        
        //MARK:----- 1.4 忽略外部参数名
        func incrementBy(amount: Int, _ numberOfTimes: Int) {
            
        }
        
        //MARK:******************************* 以数字符号#开头的关键字 *******************************
        //MARK:<------------- 1. @available 和 #available --------------->
        //MARK:------ 1.1 @available
        /**
         可用来标识计算属性、函数、类、协议、结构体、枚举等类型的声明周期。依赖于特定平台版本或swift版本
         */
//        /* 1.存储属性是不能够使用@available */
//        //Stored properties cannot be marked potentially unavailable with '@available'
//        @available (iOS 7.0, *)
//        var property: String?
//
//        /* 2. 计算属性可以使用@available */
//        let number1 = 1
//        let number2 = 2
//        @available (iOS 7.0, *)
//        var sum: Int {
//            get {
//                return number1 + number2
//            }
//        }
//
//        /* 3. 结构体 */
//        @available (iOS 7.0, *)
//        struct MyStruct {}
//
//        /* 4. 枚举 */
//        @available (iOS 7.0, *)
//        enum MyEnum {}
//
//        /* 5. 协议 */
//        @available (iOS 7.0, *)
//        protocol MyProtocol {}
//
//        /* 6. 类型 */
//        @available (iOS 7.0, *)
//        class MyClass {}
//
        /**
         @available(iOS 7, *):
         1. 至少包含2个特性参数，iOS 7.0 标识必须在iOS7.0 版本以上才可用，* 表示包含了所有平台：
            * iOS
            * iOSApplicationExtension
            * OSX
            * OSXApplicationExtension
            * watchOS
            * watchOSApplicationExtension
            * tvOS
            * tvOSApplicationExtension
         
         2. 全写形式是@available(iOS, introduced = 7.0),还有其他参数可以使用分别是：
            * deprecated = 版本号：从指定品台某个版本开始过期该声明
            * obsoleted = 版本号： 从指定平台某个版本开始废弃（注意和过期的区别，deprecated 是还可以继续使用，只不过是不推荐了， obsoleted 是调用就会编译错误）
            * message = 信息内容： 给出一些附加信息
            * unavailable: 指定平台上是无效的
            * renamed = 新名字： 重命名声明
            如下面的例子：
         */
        
        @available(iOS, introduced: 7.0, deprecated: 10.0, message: "Please Use newFunction instead")
        func oldFunction() { }
        
        func newFunction() { }
        
        oldFunction()
        
        newFunction()
        
        //MARK:----- 1.2 #available
        /* #available 用在条件语句代码块中，判断不同平台下，做不同的逻辑处理 */
        
        if #available(iOS 8, *) {
            
        }
        
        guard #available(iOS 8, *) else {
            return
        }
        
        //MARK:<------------- 2. #colorLiteral/#fileLiteral/#imageLiteral/ (即视功能)---------------->
        let label = UILabel.init()
        label.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)//label.backgroundColor =  colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        
        let image = UIImageView.init()
//        image.image = #imageLiteral(resourceName: <#T##String#>) // image.image =  imageLiteral(resourceName: <#T##String#>)
        
        
        //MARK:<------------- 3. #file、#column 、#line、#function ----------------->
        /**
         1. #file : String , 它出现的位置的文件名 <==> 类似于OC中 __FILE__
         2. #line : Int, 它出现的位置的行数       <==> 类似于OC中 __LINE__
         3. #column : Int, 它出现的位置的行数     <==> 类似于OC中 __COLUMN__
         4. #function : String, 它出现的声明     <==> 类似于OC中 _cmd
         */
        class SomeClass {
            func logLiteral(fileName: String = #file, methodName: String = #function, lineNumber: Int = #line, column: Int = #column) {
                print("\(fileName as NSString) -> \(methodName) -> \(lineNumber) -> \(column)")
            }
            func excuteLog() {
                logLiteral()
            }
        }
        
        SomeClass().excuteLog()
        ///Users/fanyunfei/github/learningSwift/swift4.2/frameworks(框架)/CoreServicesLayer(核心服务层)/Foundation/swift(关键字)/swift(关键字)/ViewController.swift -> excuteLog() -> 1769 -> 27
        
        //MARK:<------------ 4. #sourceLocation(行控制语句) ---------------->
        /* 行控制语句可以为编译的源代码指定行号和文件名，从而改变源代码的定位信息 */
        /**
         行控制语句的形式：
         1. #sourceLocation(file: 文件名， line: 行号)：
            改变该语句之后的代码中的字面量表达式#line 和 #file所表示的值。
         2. #sourceLocation()：
            会将源代码的定位信息重置回默认的行号和文件名
         */
        
        print("a")
        #sourceLocation(file: "/Users/fanyunfei/github/learningSwift/swift4.2/frameworks(框架)/CoreServicesLayer(核心服务层)/Foundation/swift(关键字)/swift(关键字)/ViewController.swift", line: 1820 )
        print("b")
        
        #sourceLocation()
        print("c")
        print("d")
        
        
        //MARK:<------------ 5 #if/#else/#elseif/#endif ------------->
        
        /* #if, #else , #elseif , #endif被称为编译配置语句，书写形式如下：*/
        /**
         #if <condition>
         
         #elseif <condition>
         
         #else
         
         #endif
         
         其中 #elseif 和 #else 是可选的， conditon并不是任意的，swift内建了集中平台和架构的组合：
         os(): OSX,iOS
         arch(): x86_64, arm, arm64,i386
         */
        
        #if os(OSX)
        typealias Color = NSColor
        
        #else
        typealias Color = UIColor
        
        #endif
        
        
        //MARK:<------------ 6 #selector/Selector---------->
        
        //MARK:--------6.1 #selector / Selector 都能使用的场景
        /**
         在OC中，我们可以使用@selector 讲一个方法转换并赋值给一个SEL类型，SEL就是对方法的一种封装,@slector 就是取类方法的编号，它的行为基本可以等同C语言中函数指针：
         
         
         - (void)testMethod {
         
         }
         
         - (void)testMethodWithName:(NSString *) name {
         
         }
         
         SEL method1 = @selector(testMethod);
         SEL method2 = @selector(testMethodWithName:);
         
         //也可以使用 NSSelectorFromString
         SEL method3 = NSSelectorFromString(@"testMethod");
         SEL method4 = NSSelectorFromString(@"testMethodWithName:");

         */
        
        /**
         Selector 与 #selector
         在swift 中SEL 也通过结构体Selector 来替代, 我们更推荐使用#selector : 使用 #selector 的好处是不再需要使用字符串来构造。因为当使用字符串构造时，若传入的字符串没有对应的方法名，那么程序在执行时就会直接崩溃。unrecognized selector sent to instance
         */
        
        let testMethod1 = Selector("testMehtod1")
        let testMethod2 = #selector(testMethodWithBtn(btn:))
        let testMethod3 = #selector(testMethodWithBtn(str:))
        
        let btn = UIButton(frame: CGRect(x:100,y:300,width:200,height:50))
        btn.backgroundColor = UIColor.red
        btn.setTitle("#selector", for: .normal)
        btn.addTarget(self, action: testMethod2, for: .touchUpInside)
        self.view.addSubview(btn)
        
        //MARK:----- 6.2 只能使用Selector 的场景
        /* 在访问 UIViewController的 extension 中私有方法时，必须使用Selector  */
//        let testMethod4 = #selector(privateMethod)
        
        let testMethod5 = Selector("privateMethod1")
        let btn1 = UIButton(frame: CGRect(x:100,y:400,width:200,height:50))
        btn1.backgroundColor = UIColor.red
        btn1.setTitle("selector", for: .normal)
        btn1.addTarget(self, action: testMethod5, for: .touchUpInside)
        self.view.addSubview(btn1)
        
        //MARK:<------------ 7 #error/#warning -------------->
        
        //MARK:******************************* 在特定上下文中被保留的关键字 *******************************
        
        //MARK:<-------------- 1. convenience --------------->
        
        /**
         1. convenience初始化方法都必须调用同一个类中的designated初始化完成设置
         2. convenience的初始化方法是不能被子类重写或从子类中以super的方式被调用的
         */
        
        //FIXME:只要在子类中实现重写了父类convenience方法所需要的init方法的话，我们在子类中就也可以使用父类的convenience初始化方法了
        class ClassA {
            let numA: Int
            init(num: Int) {
                numA = num
            }
            convenience init(bigNum: Bool) {
                self.init(num: bigNum ? 10000 : 1)
            }
        }
        class ClassB: ClassA {
            let numB: Int
            override init(num: Int) {
                numB = num + 1
                super.init(num: num)
            }
        }
        
        let anObj = ClassB(bigNum: true)
        print("anObj.numA is \(anObj.numA), anObj.numB is \(anObj.numB)")
        
        //MARK:<-------------- 2. set/get(计算属性), willSet/didSet(属性观察者) --------------->
        //MARK:----- 2.1 willSet/didSet
        /**
         利用属性观察我们可以在当前类型内监视对于属性的设定，并作出一些响应。swift 中为我们提供了两个属性观察的方法，它们分别是willSet 和 didSet.
         */
        class SelfClass {
            let oneYearInSecond: TimeInterval = 365 * 24 * 60 * 60
            init() {
                date = NSDate()
            }
            
            var date: NSDate {
                willSet {
                    let d = date
                    print("即将将日期从\(d) 设定至\(newValue)")
                }
                didSet {
                    if (date.timeIntervalSinceNow > oneYearInSecond) {
                        print("设定的时间太晚了")
                        date = NSDate.init().addingTimeInterval(oneYearInSecond)
                    }
                    print("已经将日期从\(oldValue) 设定至\(date)")
                }
            }
        }
        
        let foo = SelfClass()
        foo.date = foo.date.addingTimeInterval(1000_000_000)
        
        //MARK:----- 2.2 set/get
        /**
         在同一个类型中，属性观察和计算属性是不能同时共存的。我们可以通过子类化这个类，并且重写它的属性。在子类的重载属性中我们可以对父类的属性任意地添加属性观察
         */
        
        class testA {
            var number: Int {
                get {
                    print("get")
                    return 1
                }
                set(newValue) {
                    print("set")
                    print("set newValue is \(newValue)")
                }
            }
        }
        
        class testB: testA {
            override var number: Int {
                willSet {
                    print("willSet")
                    print("willSet newValue is \(newValue)")
                }
                didSet {
                    //和OC相比较，我们可以在didSet里面执行一些改变UI的操作。
                    print("didSet")
                    print("didSet oldValue is \(oldValue)")
                }
            }
        }
        
        let sub = testB()
        sub.number = 0
        
        print(sub.number)
        
        /**
         在 willSet 和 didSet 中我们分别可以使用newValue 和 oldValue 来获取将要设定的和已经设定的值
         */
        
        // 输出
        // get
        // willSet
        // set
        // didSet
        /**
         这里注意的是get首先被调用了一次。这是因为我们事先了 didSet, didSet中会用到oldValue,而这个值需要在整个set动作之前进行获取并存储待用，否则将无法确保正确性。如果我们不识闲didSet 的话，这次get操作也将不存在
         */
        //MARK:<-------------3. @objc 和 Dynamic ------------------------------->
        /**
         1. 由于和Objective-C的兼容，apple采用的做法允许我们在同一个项目中同时使用swift 和 Objective-C 来进行开发。通过添加 {product-module-name}-Bridging-Header.h桥接文件，并在其中填写使用头文件，就可以在swift中使用Objective-C代码了
         2. 想要在Objective-C 中使用swift 的类型的时候，事情就复杂一些。需要在我们的Objective-C中导入 {product-module-name}-Swift.h来完成。由于Objective-C 对象是基于运行时的（在运行时调用时在决定实际调用的具体实现），而swift类型的成员或者方法在编译时就已经决定。那么我们如果实现Objective-C 调用swift，解决办法：
            * 我们需要将暴露给Objective-C 使用的任何地方（包括类，属性和方法）的声明前面加上@objc 修饰符（这个步骤只需要对那些不是继承自NSObject的类型进行，如果是继承自NSObject的话，swift 会默认自动为所有的非private的类和成员加上@objc，这就是说，对于一个继承自NSObject的swift 类型，你只需要导入头文件就可以在Objective-C中使用这个类了）
         */
        //MARK:----- 3.1 @objc
        /**
         可以使用@objc 修饰的类型包括：
          * 未嵌套的类
          * 协议
          * 非泛型枚举
          * 类和协议中的属性和方法
          * 构造器和析构器
          * 下标
         */
        /* 1. 修饰类 */
//        @objc class MyHelper:NSObject {
//
//        }
//
//        @objc class MyViewController: UIViewController {
//
//        }
        
        /**
         swift中类名，可以使用中文命名，而Objective-C 中却只能使用ASCII码，在使用@objc时，需要指定Objective-C中使用的ASCII名称。这个知识点请
         */
//        @objc(fanyunfei)
//        class 我的类: NSObject {
//            @objc(greeting:)
//            func 打招呼(名字: String) {
//                print("哈喽, \(名字)")
//            }
//        }
        
        let f = 我的类.init()
        f.打招呼(名字: "范云飞")
        
        /* 2. 协议 */
        /* @objc修饰的协议与修饰类一样，需要注意的是，如果协议中由optional修饰的方法，就必须使用@objc来修饰： */
//        @objc protocol counterDataSource {
//            @objc optional func incrementForCount(count: Int) -> Int
//            @objc optional var fixedincrement: Int { get }
//        }
        
        /* 3. 枚举 */
        /**
         Objective-C 中还是传统的枚举类型，必须使用整形作为原始值。这样看来swift中的枚举类型如果要被@objc修饰，则需要满足原始值是整形的限制条件。不然就会报错。
         */
        //'@objc' enum must declare an integer raw type
        @objc enum Bear: Int {
            case Black, Grizzly, Polar
        }
        
        class Example: NSObject {
            var enabled: Bool {
                get {
                    return true
                }
            }
        }
        
        /* 如果类中方法或者属性被@objc 修饰，那么类就必须被@objc修饰 */
        
        /* 4. swift中private 方法，通过@objc修饰后可以在运行时，通过OC的消息机制被调用 */
//        @objc private func composeStatus() {
//            print("撰写微博")
//        }
        
        //MARK:------ 3.2 dynamic
        /**
         1. 上面我们讲到了@objc， 但是需要注意的是，添加 @objc 修饰符并不意味着这个方法或者属性会变成动态派发，Swift 依然可能会将其优化为静态调用。如果你需要和 Objective-C 里动态调用时相同的运行时特性的话，你需要使用的修饰符是 dynamic。
         2. Swift 中的函数是静态调用，静态调用会更快。Swift的代码直接被编译优化成静态调用的时候，就不能从Objective-C 中的SEL字符串来查找到对应的IMP了。这样就需要在 Swift 中添加一个关键字 dynamic，告诉编译器这个方法是可能被动态调用的，需要将其添加到查找表中。
         纯swift类没有动态性，但在方法、属性前添加dynamic修饰可以获得动态性。
         */
        
        class DynamicSwiftClass{
            var zero = 0
            @objc dynamic var first = 1
            @objc func dynamicFunc() {
                
            }
            
//            Property cannot be marked @objc because its type cannot be represented in Objective-C
//            @objc dynamic var adddd = (0, 0)

//            Method cannot be marked @objc because its result type cannot be represented in Objective-C
//            @objc dynamic func someMethod(value: Int) -> (Int, Int) {
//                return (1, 1)
//            }
        }
        /* 若方法的参数，属性类型为swift特有，无法映射到Objective-C 的类型（如： Character, Tuple）,则此方法，属性无法添加dynamic修饰 */
        
        
        
        //MARK:<------------- 4. nonmutating 和 mutating ---------------->
        //MARK:----- 4.1 mutating
        /* 1. struct 和 enum 中的用法 */
        /**
         swift 中的木他听 关键字修饰方法是为了能在该方法中修改struct或者是enum的变量，所以如果你没在接口方法里写mutating的话，别人如果用struct或者enum 来实现这个接口的话，就不能再方法里改变自己的变量了
         */
        
        struct User {
            var age: Int
            var weight: Int
            var height: Int
            
            //Left side of mutating operator isn't mutable: 'self' is immutable
//            func gainWeight(newWeight: Int) {
//                weight += newWeight
//            }
            
            mutating func gainWeight(newWeight: Int) {
                weight += newWeight
            }
        }
        
        /* 2. 可以将protocol 的方法声明为mutating */
        
        /**
         1. 在使用class 来实现带有mutating 的方法的接口时， 具体实现的前面是不需要加mutating 修饰的，因为class 可以随意更改自己的成员变量。
         2. procotol, struct, enum 中的方法默认都是nonmutating 的，想要修改属性，必须显式地使用mutating关键字声明
         */
        
        //MARK:<------------ 5. lazy ----------------->
        /**
         1. 在OC中懒加载的书写形式：
         // ClassA.h
         @property (nonatomic, copy) NSString *testString;
         
         // ClassA.m
         - (NSString *)testString {
         if (!_testString) {
         _testString = @"Hello";
         NSLog(@"只在首次访问输出");
         }
         return _testString;
         }
         
         2. 在swift中，我们使用在变量属性前加lazy关键字的方式，来简单地指定延时加载。比如上面的代码我们在swift中重写
         */
        
        class lazyClass {
            
            lazy var str2: String = "hello"//我们可以对这个lazy的属性直接写赋值语句
            
            
            lazy var str: String = {
                let str = "Hello"
                print("只在首次访问输出")
                return str
            }()
        }
        
        let lazyclass = lazyClass.init()
        print(lazyclass.str)
        print(lazyclass.str)
//        只在首次访问输出
//        Hello
//        Hello
        
        /**
         在swift标准库中，有一组lazy方法：
         func lazy<S : SequenceType>(s: S) -> LazySequence<S>
         
         func lazy<S : CollectionType where S.Index : RandomAccessIndexType>(s: S)
         -> LazyRandomAccessCollection<S>
         
         func lazy<S : CollectionType where S.Index : BidirectionalIndexType>(s: S)
         -> LazyBidirectionalCollection<S>
         
         func lazy<S : CollectionType where S.Index : ForwardIndexType>(s: S)
         -> LazyForwardCollection<S>
         
         
          这些方法可以配合像map或者filter 这类接受闭包并进行运行的方法一起，让整个行为编程延时进行
         */
        
        let data1 = 1...3
//        let result = data1.map { (i) -> Int in
//            print("正在处理\(i)")
//            return i * 2
//        }
//
//        print("准备访问结果")
//
//        for i in result {
//            print("操作后结果为 \(i)")
//        }
//
//        print("操作完毕")
//        正在处理1
//        正在处理2
//        正在处理3
//        准备访问结果
//        操作后结果为 2
//        操作后结果为 4
//        操作后结果为 6
//        操作完毕

        let result = data1.lazy.map { (i) -> Int in
            print("正在处理\(i)")
            return i * 2
        }
        
        print("准备访问结果")
        
        for i in result {
            print("操作后结果为 \(i)")
        }
        
        print("操作完毕")
//        准备访问结果
//        正在处理1
//        操作后结果为 2
//        正在处理2
//        操作后结果为 4
//        正在处理3
//        操作后结果为 6
//        操作完毕
        
        //MARK:<---------------- 6 required ----------------->
        /* 对于某些我们希望子类中一定实现的指定初始化方法，我们可以通过添加required 关键字进行限制，强制子类对这个方法重写 */
        class People {
            var name: String
            required init(name: String) {
                self.name = name
            }
        }
        
        
        //MARK:<---------------- 7. final ------------------>
        /**
         swift 中 final 修饰符可以防止类被继承，还可以防止子类重写父类的属性，方法，以及下标。final修饰符只能用于类，不能修饰struct 和 enum，因为struct 和 enum 只能遵循protocol,不能重写协议中的任何成员
         */
        
        final class Train {
            
        }
        //Inheritance from a final class 'Train'
//        class MagLevTrain: Train {
//
//        }
        
        class Train1 {
            final func method() {
                
            }
        }
        
        class Maglev: Train1 {
            
            //Instance method overrides a 'final' instance method
//            override func method() {
//
//            }
        }
        
        
        //MARK:<----------------- 8. Type/ Protocol -------------->
        
        //MARK:----- 8.1 Type
        typealias AnyClass = AnyObject.Type
        /**
         通过AnyObject.Type 这种方式所得到的是一个元类型。我们可以声明一个元类型来存储AnyObject这个类型本身，而在从AnyObject中取出其类型时，我们需要使用到.self
         */
        print("Student.Type.self is \(Student.Type.self)")
        print("Student.self is \(Student.self)")
        
        /**
         如上面的例子中，.self 可以用在类型后面取得类型本身，也可以在某个实例后面取得这个实例本身。
         */
        
        class subA {
            class func method() {
                print("hello")
            }
        }
        
        let TypeA: subA.Type = subA.self
        TypeA.method()
        
        /* 我们再看下面的一些例子 */
        
        /**
         比如我们想要传递一些类型的时候，就不需要不断地去改动代码了
         */
        class MusicViewController: UIViewController {
            
        }
        
        class AlbumViewController: UIViewController {
            
        }
        
        let usingVCTypes: [AnyClass] = [MusicViewController.self, AlbumViewController.self]
        
        func setupViewControllers(vcTypes: [AnyClass]) {
            for vcType in vcTypes {
                if vcType is UIViewController.Type {
                    let vc = (vcType as! UIViewController.Type).init()
                    print(vc)
                }
            }
        }
        
        setupViewControllers(vcTypes: usingVCTypes)
        
        /**
         例如在注册 tableView 的 cell 的类型的时候
         
         self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "myCell")
         */
        
        //MARK:----- 8.2 Protocol
        /* swift中，除了class，struct,enum 这三个类型外， 我们可以定义protocol, 这时我们可以在某个protocol的名字后面使用.Protocol 来获取，protocol 类型，使用的方法和.Type 是类似的。 */
        print("BaseProtocol.Protocol.self is \(BaseProtocol.Protocol.self)")
        
       
        //MARK:<--------------- 9. unowened 和 weak ------------------->
        
        //MARK:----- 9.1 循环引用
//        class subClassB {
//            var a: subClassA? = nil
//            deinit {
//                print("subClassB deinit")
//            }
//        }
        class subClassA {
            let b: subClassB
            init() {
                b = subClassB.init()
                b.a = self
            }
            
            deinit {
                print("subClassA deinit")
            }
        }
        
        class subClassB {
            weak var a: subClassA? = nil
            deinit {
                print("subClassB deinit")
            }
        }
        
        var ojb: subClassA? = subClassA.init()
        ojb = nil//内存并没有释放
        
        /* 当我们把subClassB中 a 属性用weak 修饰后， 在进行ojb = nil，发现subClassA和subClassB 都释放了*/
        
        /**
         swift中除了weak 以外，好友一个unowned 关键字。更像Objective-C 中 unsafe_unretained, 就是设置unowned之后虽然引用的内容已经被释放了，它仍然会保持对被释放了的对象一个 ‘无效的’引用，他不是Optional值，也不会指向nil。如果尝试访问成员属性或方法，程序就会崩溃。而weak则友好一些，在引用被释放后，标记为weak的成员将会自动地编程nil
         */
        
        //MARK:----- 9.2 设置delegate时
        /* 下面的例子是一个负责网路请求的类 */

        //MARK:----- 9.3 在self属性存储为闭包时， 其中拥有对self引用时
        
        var xiaoMing: Person? = Person(personName: "XiaoMing")
        xiaoMing?.printName()
        xiaoMing = nil
        
        /**
         这种在闭包参数的位置进行标注的语法结构是将要标注的内容放在原来参数的前面，并使用中括号括起来。如果有多个需要标注的元素的话，在同一个中括号内用都好隔开，举个例子：
         
         
         // 标注前
         { (number: Int) -> Bool in
         //...
         return true
         }
         
         // 标注后
         { [unowned self, weak someObject] (number: Int) -> Bool in
         //...
         return true
         }
         */
        
        
        //MARK:<------------ 10. indirect ------------------------->
        /**
         如果你想定义一个递归的数据结构，可以使用 indirect
         */
        
        enum ArithmeticExpression {
            case Number(Int)
            indirect case Addition(ArithmeticExpression, ArithmeticExpression)
            indirect case Mutiplication(ArithmeticExpression, ArithmeticExpression)
        }
        /**
         你也可以在枚举的前面标记indirect：
         indirect enum ArithmeticExpression {
         
         case Number(Int)
         
         case Addition(ArithmeticExpression, ArithmeticExpression)
         
         case Multiplication(ArithmeticExpression, ArithmeticExpression)
         
         }

         */
        
        let five = ArithmeticExpression.Number(5)
        let four = ArithmeticExpression.Number(4)

        let sum = ArithmeticExpression.Addition(five, four)
        print("sum is \(sum)")
        
        let product = ArithmeticExpression.Mutiplication(sum, ArithmeticExpression.Number(2))
        print("product is \(product)")
        
        func evaluate(expression: ArithmeticExpression) -> Int {
            switch expression {
            case let .Number(value):
                return value
            case let .Addition(left, right):
                return evaluate(expression: left) + evaluate(expression: right)
            case let .Mutiplication(left, right):
                return evaluate(expression: left) * evaluate(expression: right)
            }
        }
        
        print("evaluate(expression: sum) is \(evaluate(expression: sum))")
        print("evaluate(expression: product) is \(evaluate(expression: product))")
        
        
        //MARK:******************************* Attributes *******************************
        //MARK:<------------ 1. @escaping/@nonescaping-------------->
        
        
        /**
         swift中的闭包是一个包含某个功能的代码块，可以在代码中传递和使用。和Objective-C 中block 类似
         */
        
        //FIXME:详情请见：swift(closure)工程
        
        
        //MARK:<------------ 2. closure/autoclosure ---------------->
        
        /**
         自动闭包是一种自动创建的用来把作为实际参数传递给函数的表达式打包的闭包。它不接受任何实际参数，并且当它被调用时，它会返回内部打包的表达式的值。这个语法的好处在于通过写普通表达式代替显式闭包而使你省略包围函数形式参数的括号
         */
        func logIfTrue(_ predicate: @autoclosure () -> Bool) {
            if predicate () {
                print("true")
            } else {
                print("false")
            }
        }
        
        logIfTrue(2 < 1)
        
        //MARK:<------------- 3. override ------------------>
        
        class Super {
            var name: String
            var age: Int
            init(name: String) {
                self.name = name
                self.age = 1
            }
            
            convenience init(name: String, age: Int) {
                self.init(name: name)
                self.name = name
                self.age = age
                
            }
            
            func doThing() {
                print("")
            }
        }
        
        class Sub: Super {
            override init(name: String) {
                super.init(name: name)
                
            }
        }
        
        
        //MARK:<------------- 4. @discardableResult --------------->
        /**
         该特性用于函数或方法的声明，用以抑制编译器中函数或方法被调用而没有使用其结果的警告
         */
        class WaringClass {
            @discardableResult
            func someWarningMehtod () -> Bool {
                return true
            }
        }
        
        let waring = WaringClass.init()
        waring.someWarningMehtod()
        
        
        //MARK:<------------- 5. @convention ------------->
        /**
         我们经常将一个函数作为参数传入另一个函数中， 在iOS开发中能作为一个函数参数的东西如下：
         1. C的函数指针
         2. OC的block
         3. swift的闭包（closures）
         
         而今天我们要说的是swift中的@convention，它是用来修饰闭包的，
         1. @convention(swift): 表明这个是一个swift的闭包
         2. @convention(block): 表明这个是一个兼容OC的block的闭包
         3. @convention(c): 表明这个是兼容C的函数指针的闭包
         */
        
        class SuperMan: NSObject {
            func doAction(action: @convention(swift) (String) -> Void, arg: String) {
                action(arg)
            }
        }
        
        let saySomething_c: @convention(c) (String) -> Void = {
            print("i said:\($0)")
        }
        
        let saySomething_oc: @convention(block) (String) -> Void = {
            print("i said:\($0)")
        }
        
        let saySomething_swift: @convention(swift) (String) -> Void = {
            print("i said:\($0)")
        }
        
        let superman = SuperMan.init()
        superman.doAction(action: saySomething_c, arg: "hello, world , c")
        superman.doAction(action: saySomething_oc, arg: "hello, world, OC")
        superman.doAction(action: saySomething_swift, arg: "hello, world, swift")
        
        
        //MARK:<-------------- 6.@inlinable 和 @usableFromInline ---------------->
        
        
        //MARK:<-------------- 7. @nonobjc/@objcMembers ------------------->
        
        /**
        1. @objc 和 @nonobjc 显式地声明了一个函数是否能被Objective-C的运行时捕获到，使用@objc 的典型例子就是给selector 一个命名空间@objc(methodname)，让这个函数可以被Objective-C 的运行时调用，@nonobjc 会改变派发的方式，可以用来进制消息机制派发这个函数，不让这个函数注册到Objective-C的运行时里，和 final关键字的功能和使用场景很相似
        2. 如果你需要一个类连同它的所有extensions，及其子类和子类的extensions可以在Objective-C中被访问到，你需要使用关键字@objcMembers对这个类进行标识.
         
         详情参考 testSwift 工程
         */
        //FIXME:但是目前发现不添加@objcMembers 标记好像也可以实现一个类连同它的所有extensions，及其子类和子类的extensions可以在Objective-C中被访问到
        
        //MARK:<---------------- 8. testable ----------------->
        /**
         当你想要在测试类中导入某些模块以进行单元测试时就会用到这个注解。在一般情况下，被声明为internal的方法和属性是模块内部访问的，在模块之外是不可以被访问的。然而，单元测试要求我们能访问到internal的方法或属性，因此我们可以在单元测试文件中import需要测试的模块前添加@testable。不过，被声明为private、fileprivate的内容依然不能被访问。
         
         形式如下：
         @testable import CoreKit
         */
        
        
        //MARK:<------------------ 9 @NSManaged--------------------->
        
        
        /**
         在Objective-C 中 @dynamic 都是在和 Core Data 打交道的时候使用。如果我们将某个属性实现为@dynamic, 意味着告诉编译器我们不会再编译时就确定这个属性行为实现。
         
         
         // MyModel.h
         @interface MyModel : NSManagedObject
         
         @property (nonatomic, copy) NSString * title;
         
         @end
         
         // MyModel.m
         #import "MyModel.h"
         @implementation MyModel
         
         @dynamic title;
         
         @end
         */
        
        /**
         swift 中 和Core Data 打交道时，我们加入了一个特殊的标注来处理动态代码，那就是@NSManaged，我们只需要在NSManagedObject 的子类的成员的字段上加上@NSManaged 就可以了：

         class MyModel: NSManagedObject {
         @NSManaged var title: String
         }
         */
        
        //FIXME:apple 在文档中指出 @NSManaged 是专门用来解决Core Data 中动态代码的问题的，因此最好只在NSManagedObject 的子类中使用它。（虽然@NSManaged 写到其他的类中，也是能够编译通过的）
        
        
        //MARK:<------------------ 10.@NSCopying --------------------->
        
        class MyModel: NSObject, NSCopying {
            func copy(with zone: NSZone? = nil) -> Any {
                let coypedModel = type(of: self).init()
                return coypedModel
            }
            required override init() {
                
            }
        }
        
        let model1 = MyModel.init()
        
        let model2 = model1.copy()
        //(lldb) po model1
        //<_TtCFC16swift_ÂÖ≥ÈîÆÂ≠ó_14ViewController11viewDidLoadFT_T_L_7MyModel: 0x60000001c280>
        
        //(lldb) po model2
        //<_TtCFC16swift_ÂÖ≥ÈîÆÂ≠ó_14ViewController11viewDidLoadFT_T_L_7MyModel: 0x60000001c290>
        
        //MARK:<------------------ 11. @UIApplicationMain, @NSApplicationMain ---------------->
        /**
         这两个属性使被标记的类作为本应用的代理。通常来说，这个代理类都是系统自动创建的AppDelegte.swift 文件。如果你不想用@UIApplicationMain或者NSApplicationMain来注解，你可以自动手动创建一个main.swift 文件（不建议这么做）
         */
        
        
        //FIXME:以下标记被当做保留符号，不能用于自定义操作符
        /**
         ( 、 ) 、 { 、 } 、 [ 、 ] 、 . 、 , 、 : 、 ; 、 = 、 @ 、 # 、 & （作为前缀操作符）、 -> 、 `  、 ? 和 ! (作为后缀操作符)
         */
        
    }
    
    @objc private func composeStatus() {
        print("撰写微博")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController {
    
    func testMethod1() {
        print(#function)
    }
    //存在歧义的相同方法名时，可以使用强制类型转换来解决。
    @objc func testMethodWithBtn(btn: UIButton) {
        print(btn.titleLabel?.text)
    }
    
    @objc func testMethodWithBtn(str: String) {
        print(str)
    }

}

extension UIViewController {
    @objc private func privateMethod() {
        print(#function)
    }
}

