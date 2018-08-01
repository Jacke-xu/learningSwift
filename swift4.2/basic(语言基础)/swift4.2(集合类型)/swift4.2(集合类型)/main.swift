//
//  main.swift
//  swift4.2(集合类型)
//
//  Created by 范云飞 on 2018/7/23.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation

//MARK:---------------------------------- 集合类型 ------------------------------------

/**
 1.swift 提供了三种主要的集合类型，所谓的数组（Array）、合集（Set）、字典（Dictionary）。其中，数组是有序的值的集合，合集是唯一值的无序集合，字典是无序的键值对集合
 2.swift 中的数组、合集和字典总是明确能存储的值的类型以及他们能存储的键。就是说你不会意外地插入一个错误类型的值到集合中去。它同样意味着你可以从集合当中取回确定类型的值
 */

//FIXME:swift 的数组、合集和字典是以泛型集合实现的


//MARK:-------------------------- 1 集合的可变性

/**
 如果你创建一个在数组、合集或者一个字典，并且赋值给一个变量，那么创建的集合就是可变的。这意味着你随后可以通过添加、移除、或者改变集合中的元素来改变集合。如果你把数组、合集或者字典赋值给一个常量，则集合就成了不可变，它的大小和内容都不能被改变。
 */



//MARK:-------------------------- 2 数组

/* 数组以有序的方式来存储相同类型的值。相同类型的值可以在数组的不同地方多次出现 */

//FIXME:swift 的Array 类型被桥接到了基础框架的 NSArray 类上


//MARK:2.1 数组类型简写语法

/**
 swift 数组的类型完整写法是 Array<Element>, Element是数组允许存入的值的类型。你同样可以简写数组的类型为[Element]. 尽管两种格式功能上相同，我们更推荐简写并且全书涉及到数组类型的时候都会使用简写
 */


//MARK:2.2 创建一个空数组

var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items")

someInts.append(3)
print(someInts)


//MARK:2.3 使用默认值创建数组

/**
 1. swift 的Array 类型提供了初始化器来创建确定大小且元素都设定为相同默认值的数组。你可以传给初始化器对应类型的默认值（叫做repeating） 和新数组元素的数量（叫做 count）
 */

var threeDoubles = Array(repeating: 0.0, count: 3)
print(threeDoubles)



//MARK:2.4 通过连接两个数组来创建数组

/**
 你可以通过把连个兼容类型的现存数组用加运算符（+）加在一起来创建一个新数组。新数组的类型将从你相加的数组里推断出来：
 */

var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles
print(sixDoubles)


//MARK:2.5 使用数组字面量创建数组

/**
  你同样可以使用数组字面量来初始化一个数组，它是一种以数组集合来写一个或者多个值的简写方式。数组字面量写做一系列的值，用都好分隔，用括号括起来：
 */
var shoppingList:[String] = ["Eggs", "Milk"]

/**
 依托于swift 的类型推断，如果你用包含相同类型值的数组字面量初始化数组，就不需要写明数组的类型。shoppingList 的初始化可以写得更短：
 */

var shoppingList1 = ["Eggs", "Milk"]
print(shoppingList1)


//MARK:2.6 访问和修改数组

/**
 你可以通过数组的方法和属性来修改数组，或者使用下标脚本yufa
 */

/* 1. 要得出数组中元素的数量，检查只读的 count 属性 */
print("The shopping list contains \(shoppingList1.count) items")

/* 2. 使用布尔量 isEmpty 属性来作为检查 count 属性是否等于 0 的快捷方式 */
if shoppingList1.isEmpty {
    print("The shopping list is empty")
} else {
    print("The shopping list is not empty")
}

/* 3. 通过 append(_:)方法给数组末尾添加新的元素 */
shoppingList1.append("Flour")
print(shoppingList1)

/* 4.使用加赋值运算符（+=）来在数组末尾添加一个或者多个同类型元素 */
shoppingList1 += ["Baking Powder"]
print(shoppingList1)

shoppingList1 += ["Chocolate Spread", "Cheese", "Butter"]
print(shoppingList1)

/* 5. 通过下标脚本语法来从数组当中取回一个值，在紧跟数组名后的方括号内传入你想要取回的值的索引 */
var firstItem = shoppingList1[0]
print(firstItem)

/* 6. 可以使用下标脚本语法来改变给定索引中已经存在的值 */
shoppingList1[0] = "Six eggs"

/* 7. 同样可以使用下标脚本语法来一次改变一个范围的值，就算替换与范围长度不同的值的合集也行。 */
shoppingList1[4...6] = ["Bananas", "Apples"]
print(shoppingList1)

//FIXME:你不能用下标脚本语法来追加一个新元素到数组的末尾

/* 8. 要把元素插入到特定的索引位置，调用数组的 insert(_:at:) 方法*/
shoppingList1.insert("Maple Syrup", at: 0)
print(shoppingList1)

/* 9. 类似地，你可以使用 remove(at:) 方法来移除一个元素。这个方法移除特定索引的元素并且返回它 */
let mapleSyrup = shoppingList1.remove(at: 0)
print(shoppingList1)

//FIXME:如果你访问或者修改一个超出数组边界索引的值，你将会触发运行时错误。你可以在使用索引前通过对比数组的 count 属性来检查他。除非当 count 为0 ，否则最大的合法索引永远都是 count - 1 ，因为数组的索引从零开始

/* 10. 如果你想要移除数组最后一个元素，使用 removeLase() 方法而不是 remove(at:) 方法以避免查询数组的 count属性。与 remove(at:)方法相同， removeLast() 返回删除了的元素 */

let apples = shoppingList1.removeLast()
print(apples)


//MARK:2.7 遍历一个数组

/* 1.你可以用 for-in 循环来遍历整个数组中值的合集 */
for item in shoppingList1 {
    print(item)
}

/* 2. 如果你需要每个元素以及值的整数索引，使用enumerated() 方法来遍历数组。enumerated() 方法返回数组中每一个元素的元组，包含了这个元素的索引和值。你可以分解元组为临时的常量或者变量作为遍历的一部分 */

for (index, value) in shoppingList1.enumerated() {
    print("Item \(index + 1): \(value)")
}



//MARK:-------------------------- 3 合集

/**
 合集将同一类型且不重复的值无序地储存在一个集合当中。当元素的谁许不那么重要的时候你就可以使用合集来代替数组，或者你需要确保元素不会重复的时候
 */

//FIXME:Set 类型桥接到了基础框架 NSSet 类上

//MARK:3.1 Set类型的哈希值

/**
 1.为了能让类型储存在合集当中，它必须是可哈希的------就是说类型必须提供计算他自身哈希值的方法。哈希值是Int值且所有的对比起来相等对象都相同，比如 a == b，他遵循 a.hashValue == b.hashValue
 2. 所有swift的基础类型（String，Int，Double和Bool）默认都是可哈希的，并且可以用于合集或者字典的键。
 */

//FIXME:你可以使用你自己自定义的类型作为合集的值类型或者字典的键类型，只要让他们遵循swift基础库的 Hashable协议即可。


//MARK:3.2 合集类型语法

/* swift的合集类型写做 Set<Element>,这里的Element 是合集要储存的类型。不同于数组，合集没有等价的简写 */


//MARK:3.3 创建并初始化一个空合集

/* 1.你可以使用初始化器语法来创建一个确定类型的空合集 */
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items")

//FIXME:letters 变量的类型被推断为 Set<Character>，基于初始化器的类型


//MARK:3.4 使用数组字面量创建合集
/* 1. 可以使用数组字面量来初始化一个合集，算是一种写一个或者多个合集值的快捷方式 */
var favoriteGenres: Set<String> = ["Rock","Classical","Hip hop"]
print(favoriteGenres)

//FIXME:合集 favoriteGenres 作为变量（用var标记）而不是常量（用let标记）是因为元素会在下边的例子中添加和移除

var favoriteGenres1:Set = ["Rock","Classical","Hip hop"]
print(favoriteGenres1)


//MARK:3.5 访问和修改合集

/**
 1.你可以通过合集的方法和属性来访问和修改合集，要得出合集当中元素的数量，检查它的只读 count 属性：
 */
print("I have \( favoriteGenres.count) favorite music genres")


/**
 2. 使用布尔量 isEmpty 属性作为检查count 属性是否等于0 的快捷方式：
 */

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky")
} else {
    print("I have particular music preferences")
}

/**
 3. 通过调用 insert(_:) 方法来添加一个新的元素到合集
 */

favoriteGenres.insert("Jazz")
print(favoriteGenres)


/**
 4.调用 remove(_:)方法来从合集当中移除一个元素，如果元素是合集的成员就移除它，并且返回移除的值，如果合集没有这个成员就返回 nil。另外，合集当中所有的元素可以用 removeAll() 一次性移除
 */

if let removeGenre = favoriteGenres.remove("Rock") {
    print("\(removeGenre)? I'm over it")
} else {
    print("I never much cared for that")
}

/**
 5. 检查合集是否包含了特定元素，使用 contains(_:)方法
 */

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot")
} else {
    print("It's too funky in here")
}


//MARK:3.6 遍历合集

/* 你可以在 for-in 循环里遍历合集的值 */
for genre in favoriteGenres {
    print("\(genre)")
}

/**
 swift的 Set类型是无序的。要以特定的顺序遍历合集的值，使用 sorted() 方法，它把合集的元素作为使用 < 运算符排序了的数组返回
 */
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}



//MARK:-------------------------- 4 执行合集操作
/**
 你可以高效地执行基本地合集操作，比如：合并两个合集、确定两个合集共有哪个值、确定两个合集是否包含所有或者某些或者没有相同的值
 */

//MARK:4.1 基本合集操作

/**
 1. 使用 intersection(_:)方法来创建一个只包含两个合集共有值的新合集
 2. 使用 symmetricDifference(_:) 方法来创建一个只包含两个合集各自有的非共有值的新合集
 3. 使用 union(_:)方法来创建一个包含两个合集所有值的新合集
 4. 使用 subtraction(_:) 方法来创建一个两个合集当中不包含某个合集值的新合集
 */

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

print(oddDigits.union(evenDigits).sorted())

print(oddDigits.intersection(evenDigits).sorted())

print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())

print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())


//MARK:4.2 合集成员关系和相等性
/**
 1. 使用 “相等” 运算符 （==）来判断两个合集是否包含有相同的值
 2. 使用 isSubset(of:)方法来确定一个合集的所有值是被某合集包含
 3. 使用 isSuperset(of:) 方法来确定一个合集是否包含某个合集的所有值
 4. 使用 isStrictSubset(of:) 或者 isStrictSuperset(of:) 方法来确定是个合集是否为某个合集的子或者超集，但并不相等
 5. 使用 isDisjoint(with:) 方法来判断两个合集是否拥有完全不同的值
 */

let houseAnimals: Set = ["?", "?"]
let farmAnimals: Set = ["?","?","?","?","?"]
let cityAnimals: Set = ["?", "?"]

print(houseAnimals.isSubset(of: farmAnimals))

print(farmAnimals.isSuperset(of: houseAnimals))

print(farmAnimals.isDisjoint(with: cityAnimals))


//MARK:-------------------------- 5 字典

/**
 字典储存无序的互相关联的同一类型的键和同一类型的值的集合
 */

/**
 字典储存无序的相互关联的同一类型的键和同一类型的值的集合。每一个值都与唯一的键相关联，它就好像这个值的身份标记一样。不同于数组中的元素，字典中的元素没有特定的顺序。当你需要查找基于特定标记的值的时候使用字典，很类似于显示生活中字典用来查找特定子的定义
 */

//FIXME:swift 的 Dictionary 桥接到了基础框架的 NSDictionary 类


//MARK:5.1 字典类型简写语法

/**
 swift 的字典类型的完成书写格式： Dictionary<Key, Value>, 其中的Key 是用来作为字典键的值类型，Value 就是字典为这些储存的值的类型，当然你同样可以用简写的形式来写字典的类型为 [Key： Value].尽管两种写法是完全相同的，但本书所有提及字典的地方都会使用简写形式
 */
//FIXME:字典的Key 类型必须遵循 Hashable 协议，就像合集的值的类型


//MARK:5.2 创建一个空字典
/* 就像数组，你可以用初始化器语法来创建一个空 Dictionary */
var namesOfIntegers = [Int: String]()



//MARK:5.3 用字典字面量创建字典
/**
 字典字面量是写一个或者朵儿键值对为 Dictionary集合的快捷方式
 */

var airports: [String: String] = ["YYZ":"Toronto Pearson", "DUB": "Dublin"]

//FIXME:airports 字典被声明为变量（使用 var 标记），而不是常量（使用let标记），因为下边的例子还有给他添加更多机场

/* 与数组一样，如果你用一致类型的字典字面量初始化字典，就不需要写出字典的类型了。 airports 的初始化就能写的更短 */
var airports1 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]


//MARK:5.4 访问和修改字典
/**
 1. 你可以铜鼓字典自身的方法和属性来方位和修改它，或者通过使用下标脚本语法，如同数组，你可以使用 count 只读属性来找出 Dictionary 拥有多少元素
 */

print("The ariports dictionary contains \(airports.count) items")

/**
 2. 使用布尔量 isEmpty 属性作为检查 count 属性是否等于 0 的快捷方式
 */
if airports.isEmpty {
    print("The airports dictionary is empty")
} else {
    print("The airports dictionary is not empty")
}


/* 3. 你可以使用下标脚本给地点添加新元素，使用正确类型的新键作为下标脚本的索引，然后赋值一个正确类型的值 */
airports["LHR"] = "London"
print(airports)

/**
 4. 使用字典的 updateValue(_forKey:)方法来设置或者更新新键的值。就像上边下标脚本的例子，updateValue(_:forKey:)方法会在键没有值的时候设置一个值，或者在键已经存在的时候更新它。总之，不同于下标脚本， updateValue(_:forKey:) 方法在执行更新之后返回旧的值。
 */

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue)")
}
print(airports)

/**
 5. 使用下标脚本语法来从字典的特点建中取回值。由于可能请求的键没有值，字典的下标脚本返回可选的字典值类型。如果字典包含了请求的键的值，下标脚本就返回一个包含这个键的值的可选项。否则，下标脚本返回 nil：
 */

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName)")
} else {
    print("That airport is not in the airports dictionary")
}


/**
 6.使用下标脚本语法给一个键赋值 nil 来从字典当中移除一个键值对
 */
airports["APL"] = "Apple International"
airports["APL"] = nil
print(airports)


/**
 7. 使用 removeValue(forKey:) 来从字典里移除键值对。这个方法移除键值对如果他们存在的话，并且返回移除的值，如果值不存则返回 nil：
 */

if let removeValue = airports.removeValue(forKey: "DUB") {
    print("THe removed airport's name is \(removeValue)")
} else {
    print("The airports dictionary does not cntain a value for DUB")
}


//MARK:5.5 遍历字典

/**
 1.你可以用 for-in 循环来遍历字典的键值对。字典中的每一元素返回为 （key, value） 元组，你可以解开元组成员到临时的常量或者变量作为遍历的一部分
 */

for (airportCode, airportName) in airports {
    print("\(airportCode) : \(airportName)")
}

/**
 2. 通过访问字典的keys和 values属性来取回可遍历的字典的键或值的集合
 */

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

/**
 3. 如果你需要和接收 Array实例的API 一起使用字典的键或值，就用keys 或 values 属性来初始化一个新数组：
 */

let airportCodes = [String](airports.keys)
print(airportCodes)
let airportNames = [String](airports.values)
print(airportNames)

/**
 4. swift 的 Dictionary类型是无序的。要以特定的顺序遍历字典的键或值，使用键或值的 sorted() 方法
 */

