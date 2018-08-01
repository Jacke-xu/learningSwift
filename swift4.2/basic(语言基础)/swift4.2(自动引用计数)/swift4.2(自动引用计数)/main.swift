//
//  main.swift
//  swift4.2(自动引用计数)
//
//  Created by 范云飞 on 2018/7/27.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation

//MARK:----------------------------  自动引用计数 ------------------------------

/**
 swift 中使用 arc 管理内存 和 Objective-C 中使用 arc 十分相似
 */

//FIXME:引用计数只应用于 类的实例。结构体和枚举都是值类型，不是引用类型，没有通过引用存储和传递


//MARK:---------------------- 1 ARC的工作机制

/**
 1. 每次你创建一个类的实例，arc会分配一大块内存来存储这个实例的信息。
 2. 当实例不在需要时，arc 会释放该实例所占用的内存，然而，如果arc释放了正在使用的实例内存，如果你试图去访问该实例，会crash 掉。
 3. 为了确保使用中的实例不会消失，arc会跟踪和计算当前实例被多少属性、常量、变量所引用。
 */


//MARK:---------------------- 2 ARC


class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}




var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")

reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
/**
 John Appleseed is being initialized
 */

reference3 = nil

/**
 John Appleseed is being deinitialized
 */

/**
 从上面的例子中可以看出： Person 实例有了三个强引用，当reference3 = nil 的时候，也就是最后一个强引用被断开的时候arc 会销毁它
 */



//MARK:---------------------- 3 类实例之间的循环强引用

/**
 如果两个类实例彼此持有对方的强引用，因而每个实例都让对方一直存在，就会发生这种情况。这就是的所谓的循环强引用。
 */

class NewPerson {
    let name: String
    init(name: String) {
        self.name = name
    }
    
    var apartment: Apartment?
    deinit {
        print("\(name) is being deinitialized")
    }
}


class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    var tenant: NewPerson?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}


var john: NewPerson?
var unit4A: Apartment?

john = NewPerson(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

/**
 在两个实例的强引用创建和分配之后，John 变量对NewPerson实例有一个强引用，unit4A 变量对 Apartment 实例有一个强引用
 */

john!.apartment = unit4A
unit4A!.tenant = john
/**
 现在把两个实例关联在一起会产生一个循环强引用。NewPerson 实例现在有了一个指向 Apartment 实例的强引用，而Apartment 实例也有了一个指向 NewPerson 实例的强引用。因此，当你断开john 和 unit4A 变量所持有的强引用时，引用计数并不会降零，实例也不会被ARC释放
 */

john = nil
unit4A = nil



//MARK:---------------------- 4 解决实例之间的循环强引用

/**
 swift 提供了两种办法用来解决你在使用类的属性时所遇到的循环强引用问题：若引用 和 无主引用
 1. 对于生命周期总会变为 nil 的实例，使用弱引用
 2. 对于初始化赋值后在也不会被赋值为 nil 的实例，使用无主引用
 */


//MARK:3.1 弱引用

/**
 由于弱引用不会强保持对实例的引用，所以说实例被释放了若引用仍旧引用着这个实例也是有可能的。因此，ARC会在被引用的实例被释放是自动地设置弱引用为 nil。由于弱引用需要允许他们的值为nil，他们一定得是可选类型的
 */

//FIXME:在ARC 给若引用设置 nil 是不会调用属性观察者

class AnotherPerson {
    let name: String
    init(name: String) {
        self.name = name
    }
    var apartment: AnotherApartment?
    deinit {
        print("\(name) is being deinitialized")
    }
}


class AnotherApartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    weak var tenant: AnotherPerson?
    deinit {
        print("AnotherApartment \(unit) is being deinitizlized")
    }
}

var anotherJohn: AnotherPerson?
var anotherUnit4A: AnotherApartment?

anotherJohn = AnotherPerson(name: "Another John Appleseed")
anotherUnit4A = AnotherApartment(unit: "Another 4A")


anotherJohn!.apartment = anotherUnit4A
anotherUnit4A!.tenant = anotherJohn

anotherJohn = nil
anotherUnit4A = nil

/**
 1. AnotherPerson 实例依然保持对 AnotherApartment 实例的强引用，但是 AnotherApartment 实例现在对 AnotherPerson 实例是若引用。这意味着当你断开 anotherJohn 变量所保持的强引用时，在也没有指向 AnotherPerson 实例的强引用了，由于在也没有指向 AnotherPerson实例的强引用，该实例会被释放
 2. 现在只剩下来自 AnotherUnit4A 变量对 AnotherApartment 实例的强引用，如果你打断这个强引用，那么 AnotherApartment 实例就在也没有强引用了
 */


//MARK:3.2 无主引用

/**
 1. 和弱引用类似，无主引用不会牢牢保持住引用的实例。但是不像弱引用，总之，无主引用假定是永远有值的，因此，无主引用总是被定义为非可选类型。
 2. 由于无主引用是非可选类型，你不需要在使用它的时候将他展开。不过ARC 无法再实例被释放后将无主引用设为nil，因为非可选类型变量不允许被赋值为 nil
 */

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}

var newJohn: Customer?
newJohn = Customer(name: "New John AppleSeed")

newJohn!.card = CreditCard(number: 1234_5678_9012_3456, customer: newJohn!)

/**
 现在 Customer 实例对 CreditCard 实例有一个强引用， 并且 CreditCard 实例对 Customer 实例有一个无主引用。
 由于Customer 的无主引用，当你断开new John 变量持有的强引用时，那么就在也没有指向 Customer实例的强引用了。Customer实例被释放了。其后，在也没有指向 CreditCard 实例的强引用，该实例也随之被释放了
 */

newJohn = nil


//MARK:3.3 无主引用和隐式展开的可选属性

/**
 1. Person和 Apartment 的例子展示了两个属性的值都允许为 nil， 并会潜在的产生循环强引用。 这种场景适合用弱引用来解决
 2. Customer和 CreditCard 的例子展示了一个属性的值允许为 nil， 而另一个属性的值不允许为 nil， 这也可能导致循环强引用。这种场景最好使用无主引用来解决
 3. 第三种场景中，两个属性都必须有值，并且初始化完成后永远都不会为nil。在这种场景中，徐亚一个类使用无主属性，而另外一个类使用隐式展开的可选属性。
 */


class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}


class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}


/**
 以上的意义在于你可以通过一条语句同时创建Country 和 City 的实例，而不产生循环强引用
 */

var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital is called \(country.capitalCity.name)")



//MARK:---------------------- 5 闭包的循环强引用

/**
 循环强引用还会出现在你把一个闭包分配给类实例属性的时候，并且这个闭包中由捕获了这个实例。
 */

class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)"
        } else {
            return "<\(self.name)/>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}


let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}

print(heading.asHTML())


var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())

paragraph = nil

/**
 尽管 paragraph = nil, HTMLELement 并没有执行deinit 方法。实例的asHTML 属性有闭包的强引用，闭包在其闭包体内使用 self，因此闭包捕获了self，这意味着闭包有反过来 持有了 HTMLElement 实例的强引用。这样就产生的循环强引用。
 */



//MARK:---------------------- 6 解决闭包实例之间循环强引用

/**
 你可以通过定义捕获列表作为闭包的定义来解决在闭包和类实例之间的循环强引用。
 */


//MARK:6.1 定义捕获列表

/**
 捕获列表中的每一项都有weak 或者 unowned 关键字与类实例的引用（如 self） 或初始化过的变量（如： delegate = self.delegate!）成对组成。
 */

/*
lazy var someClosure: (Int, String) -> String = {
    [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
    
    // closure body goes here
}
 
 
 lazy var someClosure: () -> String = {
      [unowned self, weak delegate = self.delegate!] in
      //closure body goes here
 }
 */


//MARK:6.2 弱引用和无主引用

/**
 1.在闭包和捕获的实例总是互相引用并且总是同时释放时， 将闭包内的捕获定义为无主引用。
 2.在被捕获的引用可能会变为 nil 时， 定义一个若引用的捕获。弱引用总是可选项，当实例的引用释放时会自动变为 nil。这时我们可以在闭包体内检查他们是否存在
 */

//FIXME:如果被捕获的引用 永远不会为nil， 应该用无主引用而不是弱引用


class NewHTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)/>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var newParagraph: NewHTMLElement? = NewHTMLElement(name: "p", text: "hello, world")
print(newParagraph!.asHTML())

newParagraph = nil
