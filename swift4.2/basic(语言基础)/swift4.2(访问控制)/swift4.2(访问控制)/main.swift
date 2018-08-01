//
//  main.swift
//  swift4.2(访问控制)
//
//  Created by 范云飞 on 2018/7/31.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation


//MARK:---------------------------- 访问控制 ----------------------------

/**
 访问控制：限制其他源文件和模块对你的代码的访问。这个特性允许你隐藏代码的实现细节，并指定一个偏好的接口让其他代码可以访问和使用。你可以给特定的单个类型（类、结构体、枚举）设置访问级别。
 */

//FIXME:简洁起见，代码中可以设置访问级别的部分（属性、类型、函数），在下面的章节称为 “实体”


//MARK:------------------------ 1 模块和源文件

/**
  swift 的访问控制模型基于模块和源文件的概念
  1. 模块是单一的代码分配单元，可以使用swift 的 import 关键字导入到另一个模块中。
  2. 源文件是一个模型中的单个swift 源代码文件
 */



//MARK:------------------------ 2 访问级别

/**
  swift 为代码的实体提供了五个不同的访问级别
    * open 访问 和 public 访问， 允许实体被定义模块中的任意源文件访问，同样可以被另一个模块的源文件通过导入该定义模块来访问
    * internal 访问，允许实体被定义模块中的任意源文件访问，但不能被该模块之外的任何源文件访问
    * file-private 访问，将实体的使用限制于当前定义源文件中
    * private 访问，将实体的使用限制于封闭声明中
 
 由此可见，open 访问是最高访问级别，private 是最低的访问级别
 
 
 open 访问仅仅适用于类和类成员，它与public访问区别如下：
    * public访问，只能在其定义模块中被继承
    * public访问，只能被其定义模块的子类重写
    * open 可以在其定义模块中被继承，也可以在任何导入定义模块的其他模块中被继承
    * open 可以被其定义模块的子类重写，也可以被导入其定义米快的任何模块重写
 */


//MARK:2.1 访问级别的指导准则

/**
 swift 中的访问级别遵循一个总体指导准则：实体不可以被更低（限制更多）访问级别的实体定义
 */

//MARK:2.2 默认访问级别

/**
 如果你不指明访问级别的话，你的代码中的所有实体都会默认为 internal 级别。因此，大多数情况下你不需要明确指定访问级别
 */


//MARK:2.3 单目标应用的访问级别

/**
 当你编写一个简单的单目标应用时，你的应用中的代码都是在本应用中使用的并且不会再引用模块之外使用。默认的internal 访问级别已经匹配了这种需。因此，你不需要明确自定访问界别。但你可能会将代码的一些部分标注为 file-private 或 private 以对模块中的其他代码隐藏它们的实现细节
 */

//MARK:2.4 框架的访问级别

/**
 当你开发一个框架时，将该框架的面想公众的接口标注为 open 或 public, 这样它就能被其他的模块看到或访问，比如导入该框架的引用。这个面向公众的接口就是该框架的应用编程接口
 */

//FIXME:你框架的任何内部实现细节扔可以用internal默认访问级别，如果你想从框架的其他部分隐藏细节也可以将它们标注为 private 或 file private。 仅仅当你想将它设为框架的Api时，你才能将尸体标注为 open 或 public



//MARK:2.5 单元测试目标的访问级别

/**
 当你在写一个单元测试目标的应用时，你的代码应该能被模块访问到以用来进行测试。默认情况下只有标注为 open 或 public 的才可以被其他模块访问。但是，如果你使用@testable 属性标注了导入的生产模块并且用使能测试的方式编译了这个模块，单元测试目标就能访问任何internal 的实体。
 */



//MARK:------------------------ 3 访问控制语法

public class SomePublicClass {}

internal class SomeInternalClass {}

fileprivate class SomeFilePrivateClass {}

private class SomePrivateClass {}

public var somePublickVariable = 0

internal let someInternalConstant = 0

fileprivate func someFilePrivateFunction() {}

private func somePrivateFunction() {}

/**
 除非已经标注，否则都会使用默认的internal 访问级别，这一点在 《默认访问级别》 一节已经说明。这意味着SomeInternalClass 和 someInternalConstant 不需要指定访问级别也会是 internal 级别
 */

class AnotherSomeInternalClass {}

let anotherInternalConstant = 0



//MARK:------------------------ 4 自定义类型

/**
 1. 如果你想给自定义类型指明访问级别，那就在定义是指明。只要访问级别允许，新类型就可以被使用。例如，你定义了一个 fileprivate的类型，它就只能在定义文件中被当作属性类型、函数参数、返回类型使用。
 2. 类型的访问控制级别也会影响它的成员的默认访问级别（它的属性、方法、初始化方法、下标）。如果你将类型定义为private 或 fileprivate 级别，那么他的成员的默认访问级别也会是private或 fileprivate。如果你将类型定义为 internal 或 public 级别，那么他的成员的默认访问级别会是 internal.
 */

//FIXME:public 的类型默认拥有 internal 级别的成员，而不是public。如果你想让其中的一个类型成员是public的，你必须按示例代码指明。这个要求确保类型的面想公众的API是你选择的，并且可以避免将类型内部工作细节公开成API的失误。

public class AnotherSomePublicClass {
    public var somePublicProperty = 0
    var someInternalProperty = 0
    fileprivate func someFilePrivateMethod() {}
    private func somePrivateMethod() {}
}

class NewSomeInternalClass {
    var someInternalProperty = 0
    fileprivate func someFilePrivateMethod() {}
    private func somePrivateMethod() {}
}


fileprivate class NewSomeFilePrivateClass {
    func someFilePrivateMethod() {}
    private func somePrivateMethod() {}
}


private class NewSomePrivateClass {
    func somePrivateMethod() {}
}


//MARK:4.1 元组类型

/**
 元组类型的访问级别是所有类型里最严格的。例如，如果你将两个不同类型元素组成一个元组，一个元素的访问级别是 internal，另一个元素是private，那么这个元组类型是private 级别的
 */

//FIXME:元组类型不像类、结构体、枚举和函数那样有一个单独的定义。元组类型的访问级别会在使用的时候被自动推断出来，不需要显式指明


//MARK:4.2 函数类型

/**
 函数类型访问级别由函数成员类型和返回类型中的最严格访问级别决定。如果函数的计算访问级别与上下文环境默认级别不匹配，你必须在函数定义时，显式指出
 */

//func someFunction() -> (SomeInternalClass, SomePrivateClass) {
//    <#function body#>
//}

/**
 由于返回类型是private 级别的，你必须使用private 修饰符使其合法：
 */

//private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
//
//}


//MARK:4.3 枚举类型

/**
 枚举中的独立成员自动使用该枚举类型的访问级别。你不能给独立的成员指明一个不同的访问级别
 */

public enum CompassPoint {
    case north
    case south
    case east
    case west
}


//MARK:4.3.1 原始值和关联值

/**
 枚举定义中的原始值和关联值使用的类型必须有一个不低于枚举的访问级别。例如：你不能使用一个 private 类型作为一个internal 级别的枚举类型中的原始值类型
 */

//MARK:4.4 嵌套类型

/**
 private级别的类型中定义的嵌套类型自动为private 级别。
 fileprivate级别的类型中定义的嵌套类型自动为fileprivate几倍
 public或internal级别的类型中定义的嵌套类型自动为internal级别。如果你想让嵌套类型是public级别的，你必须将显式地指明为public
 */


//MARK:------------------------ 5 子类

/**
 1. 你可以继承任何类只要是当前可以访问的上下文环境中。但子类不能高于父类的访问级别，例如：你不能写一个internal父类的public子类
 2. 你可以重写任何类型成员（方法、属性、初始化器、下标），只要是在确定的访问域中是可见的
 3. 重写可以让一个继承类成员比它的父类中的更容易访问。
 */

public class A {
    fileprivate func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {
        super.someMethod()
    }
}

/**
 在上面的例子中，public 级别的类 A有一个fileprivate 基本的someMethod() 函数。B是A的子类，有一个降低的 “internal”级别。但是，类B 对 somtMethod() 函数进行了重写，即改为 “internal” 级别，这比 someMethod() 的原本实现级别更高：
 */


//MARK:------------------------ 6  常量、变量、属性、下标

/**
 常量、变量、属性不能拥有比他们类型更高的访问级别。例如，你不能协议public的属性而他的类型是private 的。
 */

//MARK:------------------------ 7 Getter 和 Setters

/**
 1. 常量、变量、属性 和下标的 getter 和 setter 自动接收他们所属常量、变量、属性和下标的访问级别
 2. 你可以给 setter 函数一个比相对应 getter 函数更低的访问级别以限制变量、属性、下标的读写权限。
 3. 你可以通过 在 var 和subscript 的置入器之前书写 fileprivate(set), private(set),或 internal(set) 来声明更低的访问级别
 */

//FIXME:上面的规则用于 存储属性和计算属性

struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

var stringToEdit = TrackedString()
stringToEdit.value = "This strng will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits"
stringToEdit.value += " Son will this one"
print("The number of edits is \(stringToEdit.numberOfEdits)")


public struct NewTrackedString {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    public init() {}
}



//MARK:------------------------ 8 初始化器

/**
 我们可以给自定义初始化器方法设置一个低于或等于他的所属的类型访问级别。唯一的例外是必要初始化器，必要初始化器必须和他所属类的访问级别一致。
 */


//MARK:8.1 默认初始化器

/**
 默认初始化器方法与所属类的访问级别一致，除非该类型定义为 public。 如果一个类定义为 public， 那么默认初始化器方法 为 进而那里 级别
 */


//MARK:8.2 结构体的默认成员初始化器

/**
 如果结构体的存储属性时private 的，那么他的默认成员初始化方法就是private级别。如果结构体的存储属性时fileprivate的，那么它的默认成员初始化方法就是fileprivate级别。否则就是默认的internal级别
 */


//MARK:------------------------ 9 协议

/**
 如果你想给一个协议类型分配一个显式的访问级别，那就在定义时指明。协议定义中的每一个要求的访问级别都自动设为与该协议相同
 */


//MARK:9.1 协议继承

/**
 如果你定义了一个继承已有协议的协议，这个新协议最高与它继承的协议访问级别一致
 */

//MARK:9.2 协议遵循

/**
 1. 类型可以遵循更低访问级别的协议
 2. 遵循协议的类的访问级别取这个协议和该类的访问级别的最小者
 3. 当你写或扩展一个类型以遵循协议时，你必须确保该类按协议要求的实现方法与该协议访问级别一致
 */


//MARK:------------------------ 10 扩展

/**
 1. 你可以在任何可访问的上下文环境中对类、结构体、枚举进行扩展。在扩展中添加的任何类型成员都有着和被扩展类型相同的访问权限
 2. 你可以显式标注扩展的访问级别
 3. 你不能给用于协议遵循的扩展显式标注访问权限修饰符
 */

//MARK:10.1 扩展中的私有成员

/**
 在同一个文件中的扩展比如类、结构体或者枚举，可以写成类似多个部分的类型声明。
 
   * 在原本的声明中声明一个私有成员，然后在同一个文件的扩展中访问他
   * 在扩展中声明一个私有成员，然后在同一文件的其他扩展中访问他
   * 在扩展中声明一个私有成员，然后在同一文件的原本声明中访问他
 */

protocol SomeProtocol {
    func dosomething() -> Int?
}

struct SomeStruct {
    private var privateVariable = 12
    private var num: Int = 10
}

extension SomeStruct: SomeProtocol {
    func dosomething() -> Int? {
        return privateVariable
    }
}

var  somestruct = SomeStruct()
print(somestruct.dosomething()!)




//MARK:------------------------ 11 泛型

/**
 泛指类型和泛指函数的访问级别取泛指类型或函数以及泛型类型参数的访问级别的最小值
 */



//MARK:------------------------ 12 类型别名

/**
 任何你定义的类型同义名的访问级别不高于原类型。
 */
