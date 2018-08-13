//
//  ViewController.swift
//  swift(NSString)
//
//  Created by 范云飞 on 2018/8/2.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var string: String = String.init("nidayeda")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //MARK:----------------------- string ------------------------
        
        //MARK:public init()
        /**
         \~chinese:
         创建一个空字符串
         
         \~english:
         creates an empty string
         */
        
        let empty = ""
        let alsoEmpty = String()
        print("empty is \(empty)")
        print("alsoEmpty is \(alsoEmpty)")
        
        
        
        //MARK:public init(cString: UnsafePointer<CChar>)
        /**
         \~chinese:
         通过复制由给定指针引用的以null结尾的UTF-8数据 来创建一个新的string
         
         \~english:
         creates a new string by copying the null-terminated UTF-8 data referenced by the given pointer
         */
        
        let validUTF8: [CChar] = [67, 97, 102, -61, -87, 0]
        validUTF8.withUnsafeBufferPointer { ptr in let s = String(cString: ptr.baseAddress!); print(s) }
        
        
        //MARK:public init(cString: UnsafePointer<UInt8>)
        /**
         \~chinese:
         通过复制由给定指针引用的以null结尾的UTF-8数据 来创建一个新的string
         
         \~english:
         creates a new string by copying the null-terminated UTF-8 data referenced by the given pointer.
         */
        
        let validUInt8: [UInt8] = [23, 45, 86, 78, 0]
        validUInt8.withUnsafeBufferPointer { ptr in let s = String(cString: ptr.baseAddress!); print(s) }
        
        
        //MARK:public init?(validatingUTF8 cString: UnsafePointer<CChar>)
        /**
         \~chinese:
         通过复制和验证由给定指针引用的以null 为结尾的UTF-8数据来创建一个新的string
         
         \~english:
         creates a new string by copying and validating the null-terminated UTF-8 data referenced by the given pointer.
         */
        validUTF8.withUnsafeBufferPointer { ptr in
            let s = String(validatingUTF8:ptr.baseAddress!)
            print(s!)
        }
        
        let invalideUTF8: [CChar] = [67, 97, 102, -61, 0]
        invalideUTF8.withUnsafeBufferPointer { ptr in
            let s = String(validatingUTF8: ptr.baseAddress!)
            print(s)
        }
        
        
        //MARK: public static func decodeCString<Encoding>(_ cString: UnsafePointer<Encoding.CodeUnit>?, as encoding: Encoding.Type, repairingInvalidCodeUnits isRepairing: Bool = default) -> (result: String, repairsMade: Bool)? where Encoding : _UnicodeEncoding
        
        /**
         \~chinese:
         通过复制由给定指针引用的以null结尾的UTF-8数据按照特定的编码创建一个新的string
         
         \~english:
         creates a new string by copying  the null-terminated data referenced by the given pointer using the specified encoding.
         */
        
        let validUTF81: [UInt8] = [67, 97, 102, 195, 169, 0]
        validUTF81.withUnsafeBufferPointer { ptr in
            let s = String.decodeCString(ptr.baseAddress, as: UTF8.self, repairingInvalidCodeUnits: true)
            print(s)
        }
        
        let validUTF82: [UInt8] = [67, 97, 102, 195, 0]
        validUTF82.withUnsafeBufferPointer { ptr in
            let s = String.decodeCString(ptr.baseAddress, as: UTF8.self, repairingInvalidCodeUnits: true)
            print(s!)
        }
        
        /* [UInt8] 转化为 [Int32] */
        var numbers: [Int32] = [0, 0]
        let byteValues: [UInt8] = [0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00]
        
        numbers.withUnsafeMutableBytes { destBytes in
            byteValues.withUnsafeBytes { srcBytes in
                destBytes.copyMemory(from: srcBytes)
                
            }
        }
        print("numbers is \(numbers)")
        
        /* [Int32] 转化为 [UInt8] */
        let numbers1: [Int32] = [1, 2, 3]
        var byteBuffer: [UInt8] = []
        numbers1.withUnsafeBytes {
            byteBuffer.append(contentsOf: $0)
            print($0)
        }
        print("numbers1 is \(byteBuffer)")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

