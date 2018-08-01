//
//  main.swift
//  swift4.2(可选链)
//
//  Created by 范云飞 on 2018/7/28.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation

//MARK:--------------------------- 可选链 ----------------------------

/**
 可选链是一个调用和查询可选属性、方法、下标的过程，它可能为nil
 1. 如果可选项包含值，属性、方法、下标的调用成功
 2. 如果可选项是nil， 属性、方法、下标的调用会返回 nil
 
 多个查询可以链接在一起，如果链中任何一个节点是 nil，那么整个链就会得体地失败
 */



//MARK:---------------------- 1 可选链代替强制展开

/**
 可选链会在可选项为 nil 时得体地失败，而强制展开则在可选项为 nil 时触发运行时错误
 */

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()

//let roomCount = john.residence!.numberOfRooms

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room")
} else {
    print("Unable to retrieve the number of rooms")
}

john.residence = Residence()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room")
} else {
    print("Unable to retrieve the number of rooms")
}



//MARK:---------------------- 2 为可选链定义模型类

class NewPerson {
    var residence: NewResidence?
}

class NewResidence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}


class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}


class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingName != nil && street != nil {
            return "\(String(describing: buildingName)) \(String(describing: street))"
        } else {
            return nil
        }
    }
}


//MARK:---------------------- 3 通过可选链访问属性

/**
 你可以使用可选链来访问可选值里的属性，并且检查这个属性的访问是否成功
 */

let newJohn = NewPerson()
if let roomcount = newJohn.residence?.numberOfRooms {
    print("John's residence has \(roomcount) room ")
} else {
    print("Unable to retrieve the number of rooms")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
newJohn.residence?.address = someAddress



//MARK:---------------------- 4 通过可选链调用方法

if newJohn.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms")
} else {
    print("It was not possible to print the number of rooms")
}


if (newJohn.residence?.address = someAddress) != nil {
    print("It was possible to set the address")
} else {
    print("It was not possible to set the address")
}



//MARK:---------------------- 6 通过可选链访问下标

if let firstRoomName = newJohn.residence?[0].name {
    print("The first room name is \(firstRoomName)")
} else {
    print("Unable to retrieve the first room name")
}

let johnsHouse = NewResidence()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
newJohn.residence = johnsHouse

if let firstRoomName = newJohn.residence?[0].name {
    print("The first room name is \(firstRoomName)")
} else {
    print("Unable to retrieve the first room name.")
}


//MARK:6.1 访问可选类型的下标

var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72

print(testScores)



//MARK:---------------------- 7 链的多层连接

/**
 你可以通过连接多个可选链来在模型中深入访问属性、方法、下标。总之，多层可选链不会给返回的值添加多层的可选链
 */

if let johnsStreet = newJohn.residence?.address?.street {
    print("John's street name is \(johnsStreet) .")
} else {
    print("Unable to retrieve the address.")
}


let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
newJohn.residence?.address = johnsAddress

if let johnsStreet = newJohn.residence?.address?.street {
    print("John's street name is \(johnsStreet)")
} else {
    print("Unable to retrieve the address")
}



//MARK:7.1 用可选链返回值链接方法

if let buildingIdentifier = newJohn.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier)")
}


if let beginsWithThe = newJohn.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier does not begin with \"the\".")
    }
}
