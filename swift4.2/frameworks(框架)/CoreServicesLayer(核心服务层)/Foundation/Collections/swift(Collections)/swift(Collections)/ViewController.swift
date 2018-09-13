//
//  ViewController.swift
//  swift(Collections)
//
//  Created by 范云飞 on 2018/9/10.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

class Person: NSObject {
    var firstName: String
    var lastName: String
    var age: Int
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    override var description: String {
        return "\(firstName) \(lastName) \(age)"
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK:***************************** NSOrderedSet/NSMutableOrderSet *******************************
        /**
         NSOrderedSet: Immutable Ordered Set 不可变的有序集合
         NSMutableOrderSet: Mutable Ordered Set  可变的有序集合
         
         NSOrderedSet声明不同对象的静态集的编程接口。您在创建静态集时创建条目，然后无法修改条目。另一方面，为动态的不同对象集声明了一个编程接口。动态或可变集允许随时添加和删除条目，根据需要自动分配内存。NSMutableOrderedSet
         
         当元素的顺序很重要时，可以使用有序集作为数组的替代，并且在测试集合中是否包含对象时的性能是对数组成员资格的考虑测试比测试集合的成员资格要慢。
         */
        
        //MARK:----- 1. Initializing an Ordered Set (初始化有序集)
        //MARK: convenience init(array: [Any])
        /**
         使用给定数组中包含的对象初始化新分配的集合。
         */
        
        var array = ["11", "22", "33", "456"]
        let orderSet = NSOrderedSet.init(array: array)
        print("orderSet is \(orderSet)")
        print("orderSet.count is \(orderSet.count)")
        
        //MARK:convenience init(array set: [Any], copyItems flag: Bool)
        /**
         使用给定数组中包含的对象初始化新分配的集合，可选择复制项目
         */
        let copyOrderSet = NSOrderedSet.init(array: array, copyItems: true)
        print("copyOrderSet is \(copyOrderSet)")
        
        //MARK:convenience init(array set: [Any], range: NSRange, copyItems flag: Bool)
        /**
         使用包含咋指定数组范围内的对象初始化新分配的集合，可选择复制项目
         */
        
        let rangeOrderSet = NSOrderedSet.init(array: array, range: NSRange(location: 2, length: 2), copyItems: true)
        print("rangeOrderSet is \(rangeOrderSet)")
        
        
        //MARK:convenience init(object: Any)
        /**
         使用对象初始化新的有序集
         */
        
        let objectOrderSet = NSOrderedSet.init(object: "qunidayede")
        print("objectOrderSet is \(objectOrderSet)")
        print("objectOrderSet.count is \(objectOrderSet.count)")
        
        //MARK:init(objects: UnsafePointer<AnyObject>?, count cnt: Int)
        /**
         使用给定C对象数组中指定数量的对象初始化新分配的集合
         */
        let rangeValue = NSRange.init(location: 0, length: 5)
        let nsvalue = NSValue.init(range: rangeValue)
        print("nsvalue is \(nsvalue)")
        
        struct Strudent {
            var name: String = ""
            var age: Int = 0
            
            init(name: String, age: Int = 27) {
                self.name = name
            }
        }
        
        let stu = Strudent.init(name: "qunidayede")
        
        let object = UnsafeMutablePointer<AnyObject>.allocate(capacity: 1)
        object.pointee = stu as AnyObject
        
//        let string = UnsafeMutablePointer<AnyObject>.allocate(capacity: 1)
//        string.pointee = "qunidayede" as AnyObject
        
        let cOrderSet = NSOrderedSet.init(objects: object, count: 1)
        print("cOrderSet is \(cOrderSet)")
        
        
        //MARK:convenience init(orderedSet set: NSOrderedSet)
        /**
         使用集合内容初始化新的有序集
         */
        let newOrderSet = NSOrderedSet.init(orderedSet: orderSet)
        print("newOrderSet is \(newOrderSet)")
        
        //MARK:init(orderedSet: NSOrderedSet) 使用集合的内容初始化新的有序集。
        
        //MARK:init(orderedSet: NSOrderedSet, copyItems: Bool) 使用集合的内容初始化新的有序集合，可选择复制项目。
        
        //MARK:init(orderedSet: NSOrderedSet, range: NSRange, copyItems: Bool) 使用有序集的内容初始化新的有序集，可选择复制项。
        
        //MARK:convenience init(set: Set<AnyHashable>)
        /**
         使用集合的内容初始化新的有序集
         */
        
        let setAnyHashable = Set.init(["dd", "aa", "yy"])
        let setOrderSet = NSOrderedSet.init(set: setAnyHashable)
        print("setOrderSet is \(setOrderSet)")
        
        //MARK:convenience init(set: Set<AnyHashable>, copyItems flag: Bool)
        /**
         使用集合的内容初始化新的有序集合，可选择复制集合中的对象
         */
        
        //MARK:----- 2. Accessing Set Members (访问集成员)
        //MARK:func contains(_ object: Any) -> Bool // 返回一个Boolean值， 指示给定对象是否存在于有序集中
        //MARK:func enumrateObjects(at s: IndexSet, options opts: NSEnumerationOptions = [], using block: (Any, Int, UnsafeMutablePointer<ObjCBool>) -> Void)
        /**
         使用指定索引处的有序集中的对象执行给定块
         */
        
        
        let aaa = "aaa"
        let bbb = "bbb"
        let ccc = "ccc"
        let ddd = "ddd"
        let eee = "eee"
        let fff = "fff"
        
        let aArray = [aaa, bbb, ccc, ddd, eee, fff]
        let anOrderedSet = NSOrderedSet(array: aArray)
        let indexSet = NSIndexSet(indexesIn: NSRange(location: 2, length: 4))
        
        print("--------- anOrderSet.enumerateObjects ----------")
        anOrderedSet.enumerateObjects(at: indexSet as IndexSet, options: .concurrent, using: { obj, idx, stop in
            print(obj, idx, stop)
        })
        
        //MARK:func enumerateObjects(_ block: (Any, Int, UnsafeMutablePointer<ObjCBool>) -> Void)
        /**
         使用有序集中的每个对象执行给定块
         */
        print("--------- orderSet.enumerateObjects ----------")
        orderSet.enumerateObjects { (obj, idx, stop) in
            print(obj, idx, stop)
        }
        
        
        //MARK:func enumerateObjects(options opts: NSEnumerationOptions = [], using block: (Any, Int, UnsafeMutablePointer<ObjCBool>) -> Void)
        /**
         使用指定的枚举选项，使用集合中的每个对象执行给定的块
         */
        
        print("----------- orderSet.enumerateObjects(NSEnumerationOptions.reverse) -----------")
        orderSet.enumerateObjects(options: NSEnumerationOptions.reverse) { (obj, idx, stop) in
            print(obj, idx, stop)
        }
//        public struct NSEnumerationOptions : OptionSet {
//
//            public init(rawValue: UInt)
//
//
//            public static var concurrent: NSEnumerationOptions { get }
//
//            public static var reverse: NSEnumerationOptions { get }
//        }
        
        
        
        //MARK:var firstObject: Any? { get } // 有序集中的第一个对象
        //MARK:var lastObject: Any? { get } // 有序集中的最后一个对象
        //MARK:func object(at idx: Int) -> Any // 返回指定索引处的对象
        //MARK:subscript(idx: Int) -> Any { get } //返回指定索引处的对象
        //MARK:func objects(at: indexes: IndexSet) -> [Any] //返回指定索引处的有序集中的对象
        print("anOrderedSet.objects(at: indexSet as IndexSet) is \(anOrderedSet.objects(at: indexSet as IndexSet))")
        //MARK:func index(of object: Any) -> Int // 返回指定对象的索引
        print("anOrderedSet.index(of: ",eee,") is \(anOrderedSet.index(of: "eee"))")
        
        //MARK:func index(of object: Any, inSortedRange range: NSRange, options opts: NSBinarySearchingOptions = [], usingComparator cmp: (Any, Any) -> ComparisonResult) -> Int
        /**
         使用给定NSCompartor块返回与指定集合中的元素相比较的对象在指定范围内的索引
         */
        

        let index = orderSet.index(of: "456", inSortedRange: NSRange(location: 0, length: orderSet.count), options: []) { (obj, item) -> ComparisonResult in
            return (obj as! String).compare(item as! String)
        }
        print("index is \(index)")
        
        
        //MARK:func index(ofObjectAt s: IndexSet, options opts: NSEnumerationOptions = [], passingTest predicate: (Any, Int, UnsafeMutablePointer<ObjCBool>) -> Bool) -> Int
        /**
         返回有序集中对象的给定索引集的索引，该对象在给定的一组枚举选项的给定块中传递测试
         */
        let index1 = anOrderedSet.index(ofObjectAt: (indexSet as NSIndexSet) as IndexSet, options: NSEnumerationOptions.concurrent) { (obj, idx, stop) -> Bool in
            return (obj as! String) == ("ccc")
        }
        
        print("index1 is \(index1)")
        
        
        //MARK:func index(ofObjectPassingTest predicate: (Any, Int, UnsafeMutablePointer<ObjCBool>) -> Bool) -> Int
        /**
         返回在给定块中传递的有序集中的对象索引
         */
        let indx = orderSet.index { (obj, idx, stop) -> Bool in
            return (obj as! String) == ("456")
        }
        
        print("indx is \(indx)")
        
        
        //MARK:func index(_ opts: NSEnumerationOptions = [], ofObjectPassingTest predicate: (Any, Int, UnsafeMutablePointer<ObjCBool>) -> Bool) -> Int
        /**
         返回有序集中的对象的索引，该对象在给定的块中为给定的枚举选项集传递测试
         */
        let indx1 = orderSet.index(NSEnumerationOptions.concurrent) { (obj, idx, stop) -> Bool in
            return (obj as! String) == ("22")
        }
        print("indx1 is \(indx1)")
        
        
        //MARK:func indexes(ofObjectsAt s: IndexSet, options opts: NSEnumerationOptions = [], passingTest predicate: (Any, Int, UnsafeMutablePointer<ObjCBool>) -> Bool) -> IndexSet
        
        let index2 = anOrderedSet.indexes(ofObjectsAt: (indexSet as IndexSet), options: .concurrent, passingTest: {(obj, idx, stop) -> Bool in
            if (obj as! String) == "eee" {
                return true
            } else {
                return false
            }
        }) as NSIndexSet
        print("index2 is \(index2)")

        
        //MARK:func indexes(ofObjectsPassingTest predicate: (Any, Int, UnsafeMutablePointer<ObjCBool>) -> Bool) -> IndexSet
        /**
         返回在给定块中传递测试的有序集中的对象索引
         */
        
        let indexset = orderSet.indexes(ofObjectsPassingTest: {(obj, idx, stop ) -> Bool in
            if (obj as! String) == "456"{
                return true
            } else {
                return false
            }
            
        }) as NSIndexSet
        
        print("indexset is \(indexset)")
        
        
        //MARK:func objectEnumerator() -> NSEnumerator
        /**
         返回一个枚举对象，该对象允许你访问有序集中的每个对象
         */
        
        print("orderSet.objectEnumerator() is \(orderSet.objectEnumerator().description)")
        
        //MARK:func reverseOjbectEnumerator() -> NSEnumberator
        /**
         返回一个枚举器对象，该对象允许你访问有序集中的每个对象
         */
        
        //MARK:@NSCopying var reversed: NSOrderedSet { get }
        /**
         按反向顺序排列的有序集
         */
        print("orderSet.reversed is \(orderSet.reversed)")
        
        
        
        //MARK:----- 3. Key-Value Coding (键值编码)
        //MARK:func setValue(_ value: Any? forKey key: String)
        /**
         使用指定的值和密钥在每个接受者的成员上调用 setValue: forKey:
         */
        
        //MARK:func value(forKey key: String) -> Any
        /**
         返回一个有序集，其中包含在每个有序集的对象上使用键调用的结果
         */
    
        
        
        //MARK:----- 4. Key-Value Observing (键值观察)
        //MARK:func addObserver(_ observer: NSObject, forKeyPath keyPath: String, options: NSKeyValueObservingOptions = [], context: UnsafeMutableRawPointer?)
        /**
         添加观察者
         */
        
        //MARK:func removeObserver(_ observer: NSObject, forKeyPath keyPath: String)
        //MARK:func removeObserver(_ observer: NSObject, forKeyPath keyPath: String, context: UnsafeMutableRawPointer?)
        /**
         删除观察者
         */
        
        
        //MARK:----- 5. Comparing Sets (比较集)
        let currentArray = ["11", "22", "33", "44", "567"]
        let otherArray = ["11", "44", "567"]
        let currentOrderedSet = NSOrderedSet.init(array: currentArray)
        let otherOrderedSet = NSOrderedSet.init(array: otherArray)
        
        //MARK:func isEqual(to other: NSOrderedSet) -> Bool //将接收的有序集与另一个有序集进行比较
        print("currentOrderedSet.isEqual(to: otherOrderedSet) is \(currentOrderedSet.isEqual(to: otherOrderedSet))")
        
        //MARK:func intersects(_ other: NSOrderedSet) -> Bool // 返回一个布尔值，该值指示接收有序集中的知道一个对象是否也存在与另一个给定的有序集中
        print("currentOrderedSet.intersects(otherOrderedSet) is \(currentOrderedSet.intersects(otherOrderedSet))")
        
        //MARK:func intersectsSet(_ set: Set<AnyHashable>) -> Bool // 返回一个布尔值，指示接收有序集中的至少一个对象是否也存在与另一个给定集中
        let set = Set.init(["11", "22", "33", "44", "567"])
        print("currentOrderedSet.intersectsSet(set) is \(currentOrderedSet.intersectsSet(set))")
        
        //MARK:func isSubset(of other: NSOrderedSet) -> Bool // 返回一个布尔值，指示接收有序集中的每个对象是否也存在于另一个给定的有序集中
        let subOrderedSet = NSOrderedSet.init(array: otherArray)
        print("subOrderedSet.isSubset(of: currentOrderedSet) is \(subOrderedSet.isSubset(of: currentOrderedSet))")
        
        //MARK:func isSubset(of set: Set<AnyHashable>) -> Bool //返回一个布尔值，指示接收有序集中的每个对象是否也存在于另一个给定集中
        print("otherOrderedSet.isSubset(of: set) is \(otherOrderedSet.isSubset(of: set))")
        
        
        //MARK:----- 6. Creating a Sorted Array (创建排序数组)
        //MARK:func sortedArray(using sortDescriptors: [NSSortDescriptor]) -> [Any]
        /**
         返回按给定排序描述符数组指定的有序集合元素的数组
         */
        let alice = ["firstName": "Alice", "age" : 24] as [String : Any]
        let bob = ["firstName": "Bob", "age" : 27] as [String : Any]
        let charlie = ["firstName": "Charlie", "age" : 33] as [String : Any]
        let quentin = ["firstName": "Quentin", "age" : 31] as [String : Any]

        let people: NSMutableArray = [alice, bob, charlie, quentin]

        let firstNameSortDescriptor = NSSortDescriptor(key: "firstName", ascending: true)
        let sortedByFirstName = (people as NSArray).sortedArray(using: [firstNameSortDescriptor])
        print("sortedByFirstName is \(sortedByFirstName)")
        
        let ageSortDescriptor = NSSortDescriptor(key: "age", ascending: false)
        let sortedByAge = (people as NSArray).sortedArray(using: [ageSortDescriptor])
        print("sortedByAge is \(sortedByAge)")

        
        let data:NSMutableArray = [
            ["id":1,"published":"2016-12-02 10:00:00"],
            ["id":2,"published":"2016-12-01 12:00:00"],
            ["id":3,"published":"2016-12-02 11:00:00"]
        ]
        
        let sd = NSSortDescriptor(key:"published",ascending:false)
        let result = data.sortedArray(using: [sd]) as NSArray
        print("result is \(result)")
        
        
        //MARK:func sortedArray(comparator cmptr: (Any, Any) -> ComparisonResult) -> [Any]
        /**
         返回一个数组，按升序列数接收有序集的元素，有给定NSComparator块指定的比较方法确定
         */
        
        
        var firstNames = ["Bob", "Quentin","Alice", "Charlie"]
        var lastNames = ["Smith", "Jones", "Smith", "Alberts"]
        var ages = [24, 27, 33, 31]
        
        var people1: [Person] = []
        (firstNames as NSArray).enumerateObjects({ obj, idx, stop in
            let person = Person(firstName: firstNames[idx], lastName: lastNames[idx], age: ages[idx])
            people1.append(person)
        })

        print("people1 is \(people1.description)")
        
        let result1 = (people1 as NSArray).sortedArray(comparator: {(obj, obj1) -> ComparisonResult in
            return (obj as! Person).firstName.compare((obj1 as! Person).firstName)
        })
        print("result1 is \(result1.description)")
        
        
        //MARK:func sortedArray(options opts: NSSortOptions = [], usingComparator cmptr: (Any, Any) -> ComparisonResult) -> [Any]
        /**
         返回一个数组，按升序列出接收有序集的元素，由给定NSComparator块指定的比较方法确定
         */
        let result2 = (people1 as NSArray).sortedArray(options: NSSortOptions.concurrent, usingComparator: {(obj, obj1) ->ComparisonResult in
            return (obj as! Person).firstName.compare((obj1 as! Person).firstName)
        })
        print("result2 is \(result2.description)")
        
        //MARK:----- 7. filtering Ordered Sets (过滤有序集)
        //MARK:func filtered(using p: NSPredicate) -> NSOrderedSet
        /**
         针对接收有序集中的每个对象计算给定谓词，并返回包含谓词返回true的对象的新有序集
         */

        let predicate = NSPredicate.init(format: "SELF CONTAINS %@", "22")
        let resultOrderedSet = orderSet.filtered(using: predicate)
        print("resultOrderedSet is \(resultOrderedSet)")
        
        //MARK:----- 8. Describing a Set (描述一个集合)
        //MARK:var description: String { get } // 一个字符串，表示有序集的内容，格式为属性列表。
        
        //MARK:func description(withLocale locale: Any?) -> String // 返回表示有序集内容的字符串，格式为属性列表。
        
        //MARK:func description(withLocale locale: Any?, indent level: Int) -> String // 返回表示有序集内容的字符串，格式为属性列表。
        
        //MARK:----- 9. Converting Other Collections (转换其他集合)
        //MARK:var array: [Any] { get } //将有序集表示为数组
        let orderArray = orderSet.array
        print("orderArray is \(orderArray)")
        
        //MARK:var set: Set<AnyHashable> { get } //包含有序集内容的集合的表示
        let orderset = orderSet.set
        print("orderset is \(orderset)")
        
        //MARK:----- 10. Initializers (初始化器)
        
        //MARK:required convenience init(arrayLiteral elements: Any...)
        //MARK:init?(coder aDecoder: NSCoder)
        //MARK:convenience init(objects elements: Any...)
        //MARK:convenience init(objects: UnsafePointer<AnyObject>, count cnt: Int) // 创建并返回一个包含给定C对象数组中指定数量对象的集合。
        
        let cArray = UnsafeMutablePointer<AnyObject>.allocate(capacity: 1)
        cArray.pointee = array as AnyObject

        let cArr = UnsafePointer<AnyObject>.init(cArray)
        print("cArr.pointee is \(cArr.pointee)")

        let cOrderedSet = NSOrderedSet(objects: cArr, count: 1)
        print("cOrderedSet is \(cOrderedSet)")

        

        
        //MARK:----- 11. Instance Methods (实例方法)
        //MARK:func makeIterator() -> NSFastEnumerationIterator // 在此序列的元素上返回一个迭代器
        
        let iterator = orderset.makeIterator()
        print("iterator is \(iterator)")
        
        
     
        //MARK:***************************** NSIndexSet *********************************
        
        //MARK:***************************** NSCache ************************************
        
        //MARK:***************************** NSSortDescriptor ***************************
    }

    @objc func localizedStandardCompare(_ compare: Any) {

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension String {
    
}

