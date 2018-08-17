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
//只给遵守aProtocol协议的UIView 添加了拓展
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
        view.width = 100
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
    
        
        
        
        //MARK:******************************* 在表达式和类型使用的关键字 *******************************
        
        //MARK:<-------------- 1. do catch /try / throws / rethrows --------------->
        /* do 关键字应该属于语句中使用的关键字， 由于这里个catch/ try/ throws / rethrows 等关键在实际应用中很紧密，所以在此就柔和到一块讲解 */
        
        //MARK:******************************* 模式中使用的关键字 *******************************
        //MARK:******************************* 以数字符号#开头的关键字 *******************************
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
        
        
        //FIXME:以下标记被当做保留符号，不能用于自定义操作符
        /**
         ( 、 ) 、 { 、 } 、 [ 、 ] 、 . 、 , 、 : 、 ; 、 = 、 @ 、 # 、 & （作为前缀操作符）、 -> 、 `  、 ? 和 ! (作为后缀操作符)
         */
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



