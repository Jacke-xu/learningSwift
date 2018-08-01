//
//  main.swift
//  swift4.2(内嵌类型)
//
//  Created by 范云飞 on 2018/7/29.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation


//MARK:---------------------------------- 内嵌类型 ---------------------------------

/**
 swift 允许你定义内嵌类型，借此在支持类型的定义中嵌套枚举、类、结构体
 */



//MARK:---------------------- 1 内嵌类型的使用

struct BlackjackCard {
    
    enum Suit: Character {
        case Spades = "♠", Hearts = "♡", Diamonds = "♢", Clubs = "♣"
    }
    
    enum Rank: Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
        struct Values {
            let first: Int, second: Int?
        }
        
        var values: Values {
            switch self {
            case .Ace:
                return Values(first: 1, second: 11)
            case .Jack, .Queen, .King:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    let rank:Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}


let theAceOfSpades = BlackjackCard(rank: .Ace, suit: .Spades)
print("theAceOfSpades: \(theAceOfSpades.description)")



//MARK:---------------------- 2 引用内嵌类型

/**
 要在外部使用内嵌类型，只需在其前缀加上内嵌了它的类的类型名即可：
 */

let heartsSymbol = BlackjackCard.Suit.Hearts.rawValue
print("heartsSymbol is \(heartsSymbol)")
