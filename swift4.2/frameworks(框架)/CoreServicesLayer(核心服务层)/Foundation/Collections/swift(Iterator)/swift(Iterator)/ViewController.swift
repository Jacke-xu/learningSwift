//
//  ViewController.swift
//  swift(Iterator)
//
//  Created by 范云飞 on 2018/8/12.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //MARK:------------------------ Iterator (迭代器) -------------------------
        
        /* IteratorProtocol协议和 Sequence 的联系是非常紧密的。序列通过创建一个迭代器来访问它们的元素，迭代器跟踪他的迭代过程并在它通过序列前进时每次返回一个元素 */
        
        print("----------------- 利用 for -in 遍历 array -----------------")
        let animals = ["Antelope", "Butterfly", "Camel", "Dolphin"]
        for animal in animals {
            print(animal)
        }
        
        
        print("-------------- 利用 makeIterator 遍历array --------------")
        var animalIterator = animals.makeIterator()
        print(animalIterator)
        while let animal = animalIterator.next() {
            print(animal)
        }
        /* 上面的例子中，animals.makeIterator() 返回当前数组的迭代器，下一步当 whitle 循环调用了迭代器的next（）方法时， 元素就被一个一个取出来了，直到next()返回nil的时候推出 */
        
        
        //MARK:直接使用迭代器
        let longestAnimal = animals.reduce1 { (current, element) -> String in
            if current.count > element.count {
                return current
            } else {
                return element
            }
        }
        
        print("----------------- 直接使用迭代器 ------------------")
        
        print("longestAnimal! is \(longestAnimal!)")
        
        
        
        print("---------------- 自定义类中添加IteratorProtocol协议 -----------------")
        //MARK:在自定义类型中合适的添加IteratorProtocol 协议
        struct CountDown: Sequence {
            let start: Int
            func makeIterator() -> CountDownIterator {
                return CountDownIterator(self)
            }
        }
        
        struct CountDownIterator: IteratorProtocol {
            let countdown: CountDown
            var times = 0
            
            init(_ countdown: CountDown) {
                self.countdown = countdown
            }
            
            mutating func next() -> Int? {
                let nextNumber = countdown.start -  times
                guard nextNumber > 0 else {
                    return nil
                }
                
                times  += 1
                return nextNumber
            }
        }
        
        let threeTwoOne = CountDown(start: 10)
        for count in threeTwoOne {
            print("\(count)......")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension Sequence {
    func reduce1(_ nextPartialResult: (Iterator.Element, Iterator.Element) ->Iterator.Element) -> Iterator.Element? {
        var i = makeIterator()//Returns an iterator over the elements of this sequence.
        guard var accumulated = i.next() else {
            return nil
        }
    
        while let element = i.next() {
            accumulated = nextPartialResult(accumulated, element)
        }
        
        return accumulated
    }
}

