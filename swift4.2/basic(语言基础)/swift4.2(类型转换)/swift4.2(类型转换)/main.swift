//
//  main.swift
//  swift4.2(类型转换)
//
//  Created by 范云飞 on 2018/7/29.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation


//MARK:---------------------------- 类型转换 --------------------------------

/**
 1. 类型转换可以判断实例的类型，也可以将该实例在其所在的类型层次中视为其父类或子类的实例
 2. swift 中类型转换的实现 为 is 和 as 操作符。这两个操作符使用了一种简单传神的方式来检查一个值的类型或将某个值转换为另一种类型
 3. 你还可以使用类型转换来检查类型是否遵循某个协议
 */


//MARK:---------------------- 1 为类型转换定义类层次

/**
 你可以在类及其子类层次中使用类型转换来判断特定类实例的类型并且在同一类层次中将该实例类型转换为另一个类。
 */

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]



//MARK:---------------------- 2 类型检查

/**
 使用类型检查操作符（is）来检查一个实例是否属于一个特定的子类。如果实例是该子类类型，类型检查操作符返回true， 否则返回 false
 */

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")



//MARK:---------------------- 3 向下类型转换

/**
 你可以尝试使用类型转换操作符（as？或者 as！）将它向下类型转换至其子类类型
 1. 如果不确定向下转换类型是否能够成功，使用 as？
 2. 确信向下转换类型会成功时，使用as！
 */

for item in library {
    if let movie = item as? Movie {
        print("Movie: '\(movie.name)', dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: '\(song.name)', by \(song.artist)")
    }
}

//FIXME:类型转换实际上不会改变实例及修改其值。实例不会改变；它只是将它当做要转换的类型来访问



//MARK:---------------------- 4 Any 和 AnyObject 的类型转换

/**
 swift 为不确定的类型提供了两种特殊的类型别名：
 1. AnyObject 可以表示任何类类型的实例
 2. Any 可以表示任何类型，包括函数类型
 */

var things = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "hello, \(name)" })

for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}

//FIXME:Any 类型表示了任意类型的值，包括可选类型。如果你给显示声明的Any 类型使用可选项，swift就会发出警告。如果你真心需要在Any 值中使用可选项，如下所示，你可以使用as 运算符来显示地转换可选项为Any

let optionalNumber: Int? = 3
things.append(optionalNumber as Any)
things.append(optionalNumber as Any)
print(things)
