//
//  ViewController.swift
//  swift(DataTime)
//
//  Created by 范云飞 on 2018/9/13.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

let aDate  = Date.init(timeInterval: .init(3600 * 8), since: Date.init()) //东八区时间


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:************************** NSCalendar/Calendar ***************************
        /**
         参考资料： https://developer.apple.com/documentation/foundation/nscalendar
                  https://blog.csdn.net/shenjie_xsj/article/details/79033861
         */
        
        //MARK:----- 1. Creating and Initializing Calendars (创建和初始化日历)
        //MARK:init?(identifier calendarIdentifierConstant: NSCalendar.Identifier) // 创建由给定标识符指定的新日历
        let calendar = NSCalendar.init(identifier: NSCalendar.Identifier.republicOfChina)
        print("----------calendar is \(String(describing: calendar))")
        
        //MARK:init?(calendarIdentifier ident: NSCalendar.Identifier) // 根据给定的标识符初始化日历
        let calendar1 = NSCalendar.init(calendarIdentifier: NSCalendar.Identifier.republicOfChina)
        if let cal = calendar1 {
            print("----------calendar1 is \(cal)")
        }

        
        //MARK: struct NSCalendar.Identifier // 支持的日历类型 https://developer.apple.com/documentation/foundation/nscalendar/identifier
        
        //MARK:----- 2. Getting the User's Calendar (获得用户的日历)
        
        //MARK:class var current: Calendar { get } // 用户的当前日历
        print("----------NSCalendar.current is \(NSCalendar.current)")
        
        //MARK:class var autoupdatingCurrent: Calendar { get } // 跟踪用户首选日历更改的日历
        print("----------NSCalendar.autoupdatingCurrent is \(NSCalendar.autoupdatingCurrent)")
        
        //MARK:----- 3. Extracting Components (提取组件)
        
        //MARK:func date(_ date: Date, matchesComponents components: DateComponents) -> Bool // 返回给定日期是否与所有给定日期组件匹配
        
        let date = Date.init()
        
        print("----------date is \(date)") // 获得的是零时区的时间， 和当前时间相差8个小时，因为我们这里是中国（中国的时间使用的时区是东八区）
        var dateComponent = DateComponents()
        dateComponent.weekday = 7
        print("----------dateComponent is \(dateComponent.description)")
        
        let calendar2 = NSCalendar.init(calendarIdentifier: NSCalendar.Identifier.chinese)
        if let cal = calendar2 {
            print("----------calendar2 is \(cal)")
        }
        
        if let cal =  calendar2?.date(date, matchesComponents: dateComponent){
            print("----------calendar2?.date(date, matchesComponents: dateComponent) is \(cal)")
        }
        
        
        
        //MARK:func component(_ unit: NSCalendar.Unit, from date: Date) -> Int // 返回给定日期的指定日期组件
    
        let component = calendar2?.component(NSCalendar.Unit.day, from: date)
        if let com = component {
            print("----------component is \(com)")
        }
        
        //MARK:func components(_ unit: NSCalendar.Unit, from date: Date) -> DateComponents // 返回表示给定日期的日期组件
        let components = calendar2?.components(NSCalendar.Unit.day, from: date)
        if let com = components {
            print("----------components is \(com)")
        }
        
        //MARK:func components(_ unitFlags: NSCalendar.Unit, from startingDate: Date, to resultDate: Date, options opts: NSCalendar.Options = []) -> DateComponents
        /**
         返回作为日期组件给出的开始日期和结束日期之间的差异
         */
        let startingDate = Date.init()
        let resultDate = Date.init(timeIntervalSinceNow: TimeInterval.init(3600 * 100))
        let dateComponent1 = calendar2?.components(NSCalendar.Unit.day, from: startingDate, to: resultDate, options: NSCalendar.Options.matchFirst)
        if let dateComponent = dateComponent1 {
            print("----------dateComponent1 is \(dateComponent)")
        }
        
        //MARK:func components(_ unitFlags: NSCalendar.Unit, from startingDateComp: DateComponents, to resultDateComp: DateComponents, options: NSCalendar.Options = []) -> DateComponents
        /**
         返回作为日期组件给出的开始日期和结束日期之间的差异
         */
        
        var staringDateComp = DateComponents.init()
        staringDateComp.year = 2018
        staringDateComp.month = 9
        staringDateComp.day = 14
        
        var resultDateComp = DateComponents.init()
        resultDateComp.year = 2018
        resultDateComp.month = 10
        resultDateComp.day = 1
        
        let dateComponent2 = calendar2?.components(NSCalendar.Unit.day, from: staringDateComp, to: resultDateComp, options: NSCalendar.Options.matchFirst)
        if let dateComp = dateComponent2 {
            print("----------dateComponent2 is \(dateComp)")
        }
        
        //MARK:func components(in timezone: TimeZone, from date: Date) -> DateComponents
        /**
         返回日期的所有日期组件，就像在给定时区中一样
         */
        let timeZoneComp = calendar2?.components(in: TimeZone.init(secondsFromGMT: 8)!, from: aDate)
        if let dateComp = timeZoneComp {
            print("----------timeZoneComp is \(dateComp)")
        }
        
        //MARK:func getEra(_ eraValuePointer: UnsafeMutablePointer<Int>?, year yearValuePointer: UnsafeMutablePointer<Int>?, month monthValuePointer: UnsafeMutablePointer<Int>?, day dayValuePointer: UnsafeMutablePointer<Int>?, from date: Date)
        /**
         通过引用返回给定日期的年代，年份，星期和工作日组件值。
         */
        let eraValue = UnsafeMutablePointer<Int>.allocate(capacity: 1)
        let year = UnsafeMutablePointer<Int>.allocate(capacity: 1)
        let month = UnsafeMutablePointer<Int>.allocate(capacity: 1)
        let day = UnsafeMutablePointer<Int>.allocate(capacity: 1)
        calendar2?.getEra(eraValue, year: year, month: month, day: day, from:aDate)
        print("----------eraValue.pointee is \(eraValue.pointee), year.pointee is \(year.pointee), month.pointee is \(month.pointee), day.pointee is \(day.pointee)")
        
        //MARK:func getEra(_ eraValuePointer: UnsafeMutablePointer<Int>?, yearForWeekOfYear yearValuePointer: UnsafeMutablePointer<Int>?, weekOfYear weekValuePointer: UnsafeMutablePointer<Int>?, weekday weekdayValuePointer: UnsafeMutablePointer<Int>?, from date: Date)
        
        /**
         通过引用返回给定日期的年代，年份，星期和工作日组件值。
         */
        let yearForWeekOfYear = UnsafeMutablePointer<Int>.allocate(capacity: 1)
        let weekOfYear = UnsafeMutablePointer<Int>.allocate(capacity: 1)
        let weekday = UnsafeMutablePointer<Int>.allocate(capacity: 1)
        calendar2?.getEra(eraValue, yearForWeekOfYear: yearForWeekOfYear, weekOfYear: weekOfYear, weekday: weekday, from: Date.init(timeInterval: .init(3600 * 8), since: date))
        print("----------eraValue.pointee is \(eraValue.pointee), yearForWeekOfYear.pointee is \(yearForWeekOfYear.pointee), weekOfYear.pointee is \(weekOfYear.pointee), weekday.pointee is \(weekday.pointee)")
        
        
        //MARK:func getHour(_ hourValuePointer: UnsafeMutablePointer<Int>?, minute minuteValuePointer: UnsafeMutablePointer<Int>?, second secondValuePointer: UnsafeMutablePointer<Int>?, nanosecond nanosecondValuePointer: UnsafeMutablePointer<Int>?, from date: Date)
        /**
         通过引用返回给定日期的小时，分​​钟，秒和纳秒组件值。
         */
        let hourValue = UnsafeMutablePointer<Int>.allocate(capacity: 1)
        let minuteValue = UnsafeMutablePointer<Int>.allocate(capacity: 1)
        let secondValue = UnsafeMutablePointer<Int>.allocate(capacity: 1)
        let nanosecondValue = UnsafeMutablePointer<Int>.allocate(capacity: 1)
        calendar2?.getHour(hourValue, minute: minuteValue, second: secondValue, nanosecond: nanosecondValue, from: Date.init(timeInterval: .init(3600 * 8), since: date))
        print("----------hourValue.pointee is \(hourValue.pointee), minuteValuer.pointee is \(minuteValue.pointee), secondValue.pointee is \(secondValue.pointee), nanosecondValue.pointee is \(nanosecondValue.pointee)")
        
        //MARK:----- 4. Getting Calendar Information (获得日历信息)
        //MARK:func var calendarIdentifier: NSCalendar.Identifier { get } // 日历的标识符
        if let calendarIdentifier = calendar2?.calendarIdentifier {
            print("----------calendar2?.calendarIdentifier is \(calendarIdentifier)")
        }
        
        //MARK:var firstWeekday: Int { get } // 接收器第一个工作日的索引
        if let weekday = calendar2?.firstWeekday {
            print("----------calendar2?.firstWeekday is \(weekday)")
        }
        
        //MARK:var locale: Locale? { get } // 接收器的区域设置
        if let locale = calendar2?.locale {
            print("----------calendar2?.locale is \(locale)")
        }
        
        
        //MARK:var timeZone: TimeZone { get } // 日历的时区
        if let timeZone = calendar2?.timeZone {
            print("----------calendar2?.timeZone is \(timeZone)")
        }
        
        //MARK:func maximumRange(of unit: NSCalendar.Unit) -> NSRange // 返回给定单位可以采用的值的最大范围限制
        if let maximumRange = calendar2?.maximumRange(of: NSCalendar.Unit.day) {
            print("----------calendar2?.maximumRange(of: NSCalendar.Unit.day) is \(maximumRange)")
        }
        
        //MARK:func minimumRange(of unit: NSCalendar.Unit) -> NSRange // 返回给定单位可以采用的值的最小范围限制
        if let minimumRange = calendar2?.minimumRange(of: NSCalendar.Unit.day) {
            print("----------calendar2?.minimumRange(of: NSCalendar.Unit.day) is \(minimumRange)")
        }
        
        //MARK:var minimumDaysInFirstWeek: Int { get } // 接收器第一周的最小天数
        if let minimumDaysInfirstWeek = calendar2?.minimumDaysInFirstWeek {
            print("----------calendar2?.minimumDaysInFirstWeek is \(minimumDaysInfirstWeek)")
        }
        
        //MARK:func ordinality(of smaller: NSCalendar.Unit, in larger: NSCalendar.Unit, for date: Date) -> Int
        /**
         对于给定的绝对时间，返回指定的较大日历单位（例如一周） 内较小日历单位（例如一天）的序号
         */
        if let ordinality = calendar2?.ordinality(of: NSCalendar.Unit.month, in: NSCalendar.Unit.year, for: Date.init()) {
            print("----------calendar2?.ordinality(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: Date.init()) is \(ordinality)")
        }
        
        
        
        //MARK:func range(of smaller: NSCalendar.Unit, in larger: NSCalendar.Unit, for date: Date) -> NSRange
        /**
         返回较小日历单位（例如一天）在包含指定绝对时间的较大日历单位（例如一个月）中可以采用的绝对时间值范围
         */
        if let range = calendar2?.range(of: NSCalendar.Unit.month, in: NSCalendar.Unit.year, for: aDate) {
            print("----------calendar2?.range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: aDate) is \(range)")
        }
        
        
        //MARK:func range(of unit: NSCalendar.Unit, start datep: AutoreleasingUnsafeMutablePointer<NSDate?>?, interval tip: UnsafeMutablePointer<TimeInterval>?, for date: Date) -> Bool
        
        /**
         
         通过引用返回包含给定日期的给定日历单元的开始时间和持续时间
         
         ----- Parameters：
         * unit : 日历单位（请参阅可能的值）。NSCalendar.Unit
         * datep : 返回时，包含unit包含日期的日历单元的开始时间date
         * tip : 返回时，包含unit包含日期的日历单位的持续时间date
         * date : 一个约会。
         ----- Return Value:
         true如果可以计算单位的开始时间和持续时间，否则false。
         
         */
        let unsafeMutablePointerNSDate = UnsafeMutablePointer<NSDate?>.allocate(capacity: 1)
        let unsafeMutablePointerTimeInterval = UnsafeMutablePointer<TimeInterval>.allocate(capacity: 1)
        let autoreleasingDate = AutoreleasingUnsafeMutablePointer<NSDate?>(unsafeMutablePointerNSDate)
        
        if let bool = calendar2?.range(of: NSCalendar.Unit.month, start: autoreleasingDate, interval: unsafeMutablePointerTimeInterval, for: aDate) {
            print(" ----------bool is \(bool), \n autoreleasingDate is \(String(describing: autoreleasingDate.pointee)), \n usafeMutablePointerTimeInterval is \(unsafeMutablePointerTimeInterval.pointee), \n aDate is \(aDate)")
        }
        
        
        //MARK:func range(ofWeekendStart datep: AutoreleasingUnsafeMutablePointer<NSDate?>?, interval tip: UnsafeMutablePointer<TimeInterval>?, containing date: Date) -> Bool
        /**
         返回给定日期是否属于周末时段，如果是，则通过引用返回周末范围的开始日期和时间间隔
         参数:
         * datep : 返回时，包含下周末的开始日期。
         * tip : 返回时，包含下周末时段的时间间隔。
         * date : 用于执行计算的日期。
         回报价值:
         true如果给定日期在周末期间，否则false。
         */
        if let bool = calendar2?.range(ofWeekendStart: autoreleasingDate, interval: unsafeMutablePointerTimeInterval, containing: aDate) {
            print(" ----------bool is \(bool), \n autoreleasingDate is \(String(describing: autoreleasingDate.pointee)), \n usafeMutablePointerTimeInterval is \(unsafeMutablePointerTimeInterval.pointee), \n aDate is \(aDate)")
        }
        
        //MARK:struct NSCalendar.Unit //日历单位，如年，月，日和小时。
//        public struct Unit : OptionSet {
//
//            public init(rawValue: UInt)
//
//
//            public static var era: NSCalendar.Unit { get }
//
//            public static var year: NSCalendar.Unit { get }
//
//            public static var month: NSCalendar.Unit { get }
//
//            public static var day: NSCalendar.Unit { get }
//
//            public static var hour: NSCalendar.Unit { get }
//
//            public static var minute: NSCalendar.Unit { get }
//
//            public static var second: NSCalendar.Unit { get }
//
//            public static var weekday: NSCalendar.Unit { get }
//
//            public static var weekdayOrdinal: NSCalendar.Unit { get }
//
//            @available(iOS 4.0, *)
//            public static var quarter: NSCalendar.Unit { get }
//
//            @available(iOS 5.0, *)
//            public static var weekOfMonth: NSCalendar.Unit { get }
//
//            @available(iOS 5.0, *)
//            public static var weekOfYear: NSCalendar.Unit { get }
//
//            @available(iOS 5.0, *)
//            public static var yearForWeekOfYear: NSCalendar.Unit { get }
//
//            @available(iOS 5.0, *)
//            public static var nanosecond: NSCalendar.Unit { get }
//
//            @available(iOS 4.0, *)
//            public static var calendar: NSCalendar.Unit { get }
//
//            @available(iOS 4.0, *)
//            public static var timeZone: NSCalendar.Unit { get }
//
//        }

        
        
        //MARK:----- 5. Scanning Dates (扫描日期)
        
        //MARK:func startOfDay(for date: Date) -> Date // 返回给定日期的第一个时刻作为日期实例
        if let date = calendar2?.startOfDay(for: aDate) {
            print("----------calendar2?.startOfDay(for: aDate) is \(date)")
        }
        
        
        //MARK:func enumerateDates(startingAfter start: Date, matching comps: DateComponents, options opts: NSCalendar.Options = [], using block: (Date?, Bool, UnsafeMutablePointer<ObjCBool>) -> Void)
        /**
         计算与给定的一组组件匹配（或最匹配）的日期，并为每个组件调用一次，直到枚举停止
         */
        //下面展示了一种获取随后50个闰年的方法：
        var dateComponent3 = DateComponents.init()
        dateComponent3.month = 2
        dateComponent3.day = 29
   
        var dateCount : Int  = 0
        calendar2?.enumerateDates(startingAfter: Date.init(), matching: dateComponent3, options: NSCalendar.Options.matchNextTime, using: { (date, idx, stop:UnsafeMutablePointer<ObjCBool>) in
            
            if let aDate = date {
                print("date is \(aDate)")
            }
            
            dateCount += 1
            if dateCount == 50 {
                stop.pointee = true
            }
        })
 
        
        //MARK:func nextDate(after date: Date, matching comps: DateComponents, options: NSCalendar.Options = []) -> Date?
        /**
         返回与给定组件匹配的给定日期之后的下一个日期。
         */
        var dateComponent4 = DateComponents.init()
        dateComponent4.weekday = 7

        if let date = calendar2?.nextDate(after: aDate, matching: dateComponent4, options: NSCalendar.Options.matchNextTime) {
            print("----------date is \(Date.init(timeInterval: .init(3600 * 8), since: date))") //需要转成东八区
        }
        
        
        //MARK:func nextDate(after date: Date, matchingHour hourValue: Int, minute minuteValue: Int, second secondValue: Int, options: NSCalendar.Options = []) -> Date?
        /**
         返回给定日期之后的下一个日期，该日期与给定的小时，分钟和秒组件值匹配
         */
        let dateComponent5 = calendar2?.components(in: TimeZone.init(secondsFromGMT: 8)!, from: aDate)
        if let date = calendar2?.nextDate(after: aDate, matchingHour: (dateComponent5?.hour)!, minute: (dateComponent5?.minute)!, second: (dateComponent5?.second)!, options: NSCalendar.Options.matchNextTime) {
            print("----------calendar2?.nextDate(after: aDate, matchingHour: dateComponent5?.hour, minute: dateComponent5?.minute, second: dateComponent5?.second, options: NSCalendar.Options.matchNextTime) is \(Date.init(timeInterval: .init(3600 * 8), since: date))")
        }
        
        
        //MARK:func nextDate(after date: Date, matching unit: NSCalendar.Unit, value: Int, options: NSCalendar.Options = []) -> Date?
        /**
         返回与给定日历单位值匹配的给定日期之后的下一个日期
         */
        //按NSCalendar.Unit.hour 进行匹配
        if let date = calendar2?.nextDate(after: aDate, matching: NSCalendar.Unit.hour, value: (dateComponent5?.hour)!, options: NSCalendar.Options.matchNextTime) {
            print("-----------calendar2?.nextDate(after: aDate, matching: NSCalendar.Unit.day, value: (dateComponent5?.day)!, options: NSCalendar.Options.matchNextTime) is \(Date.init(timeInterval: .init(3600 * 8), since: date)))")
        }
        
        //MARK:struct NSCalendar.Options // 涉及日历的算术运算选项。
//        public struct Options : OptionSet {
//
//            public init(rawValue: UInt)
//
//
//            public static var wrapComponents: NSCalendar.Options { get } // option for arithmetic operations that do calendar addition
//
//
//            @available(iOS 7.0, *)
//            public static var matchStrictly: NSCalendar.Options { get }
//
//            @available(iOS 7.0, *)
//            public static var searchBackwards: NSCalendar.Options { get }
//
//
//            @available(iOS 7.0, *)
//            public static var matchPreviousTimePreservingSmallerUnits: NSCalendar.Options { get }
//
//            @available(iOS 7.0, *)
//            public static var matchNextTimePreservingSmallerUnits: NSCalendar.Options { get }
//
//            @available(iOS 7.0, *)
//            public static var matchNextTime: NSCalendar.Options { get }
//
//
//            @available(iOS 7.0, *)
//            public static var matchFirst: NSCalendar.Options { get }
//
//            @available(iOS 7.0, *)
//            public static var matchLast: NSCalendar.Options { get }
//        }

        
        //MARK:----- 6. Calculating Dates (计算日期)
        //MARK:func date(from comps: DateComponents) -> Date? // 返回表示从给定组件计算的绝对时间的日期
        if let date = calendar2?.date(from: dateComponent5!) {
            print("------------calendar2?.date(from: dateComponent5!) is \(date)")
        }
        
        
        //MARK:func date(byAdding comps: DateComponents, to date: Date, options opts: NSCalendar.Options = []) -> Date?
        /**
         返回表示通过将给定组件添加到给定日期而计算的绝对时间的日期
         */
        let addDateComponent = DateComponents.init()
        if let date = calendar2?.date(byAdding: addDateComponent, to: aDate, options: NSCalendar.Options.matchNextTime) {
            print("-----------calendar2?.date(byAdding: addDateComponent, to: aDate, options: NSCalendar.Options.matchNextTime) is \(date)")
        }
        
        
        //MARK:func date(byAdding unit: NSCalendar.Unit, value: Int, to date: Date, options: NSCalendar.Options = []) -> Date?
        /**
         返回表示通过将给定组件的值添加到给定日期而计算的绝对时间的日期
         */
        if let date = calendar2?.date(byAdding: NSCalendar.Unit.hour, value: (dateComponent5?.hour)!, to: aDate, options: NSCalendar.Options.matchNextTime) {
            print("-----------calendar2?.date(byAdding: NSCalendar.Unit.hour, value: (dateComponent5?.day)!, to: aDate, options: NSCalendar.Options.matchNextTime) is \(date)")
        }
        
        
        //MARK:func date(bySettingHour h: Int, minute m: Int, second s: Int, of date: Date, options opts: NSCalendar.Options = []) -> Date?
        /**
         创建使用给定时间计算的新日期
         */
        
        var nowDateComponent = NSCalendar.current.dateComponents(in: TimeZone.init(secondsFromGMT: 8)!, from: aDate)
        if let date = calendar2?.date(bySettingHour: nowDateComponent.hour!, minute: 40, second: 0, of: aDate, options: NSCalendar.Options.matchNextTime) {
            print("--------- calendar2?.date(bySettingHour: nowDateComponent.hour!, minute: 40, second: 0, of: aDate, options: NSCalendar.Options.matchNextTime) is \(Date.init(timeInterval: .init(3600 * 8), since: date))")
        }
        
        
        //MARK:func date(bySettingUnit unit: NSCalendar.Unit, value v: Int, of date: Date, options opts: NSCalendar.Options = []) -> Date?
        /**
         返回表示通过将给定日期的特定组件设置为给定值而计算的日期的新日期，同时尝试保持较低的组件相同
         */
        
        if let date = calendar2?.date(bySettingUnit: NSCalendar.Unit.hour, value: nowDateComponent.hour!, of: aDate, options: NSCalendar.Options.matchNextTime) {
            print("-----------calendar2?.date(bySettingUnit: NSCalendar.Unit.day, value: nowDateComponent.hour! + 1, of: aDate, options: NSCalendar.Options.matchNextTime) is \(Date.init(timeInterval: TimeInterval.init(3600 * 8), since: date))")
        }
        
        //MARK:func date(era eraValue: Int, year yearValue: Int, month monthValue: Int, day dayValue: Int, hour hourValue: Int, minute minuteValue: Int, second secondValue: Int, nanosecond nanosecondValue: Int) -> Date?
        /**
         返回使用给定组件创建的日期
         */
        if let date = calendar2?.date(era: eraValue.pointee, year: year.pointee, month: month.pointee, day: day.pointee, hour: 12, minute: 0, second: 0, nanosecond: 0) {
            print("----------calendar2?.date(era: eraValue.pointee, year: year.pointee, month: month.pointee, day: day.pointee, hour: 12, minute: 0, second: 0, nanosecond: 0) is \(Date.init(timeInterval: TimeInterval.init(3600 * 8), since: date))")
        }
        
        //MARK:func date(era eraValue: Int, yearForWeekOfYear yearValue: Int, weekOfYear weekValue: Int, weekday weekdayValue: Int, hour hourValue: Int, minute minuteValue: Int, second secondValue: Int, nanosecond nanosecondValue: Int) -> Date?
        /**
         返回使用给定组件创建的新日期，该日期基于一周的值
         */
        
        if let date = calendar2?.date(era: eraValue.pointee, yearForWeekOfYear: yearForWeekOfYear.pointee, weekOfYear: weekOfYear.pointee, weekday: weekday.pointee, hour: 13, minute: 0, second: 0, nanosecond: 0) {
            print("----------calendar2?.date(era: eraValue.pointee, yearForWeekOfYear: yearForWeekOfYear.pointee, weekOfYear: weekOfYear.pointee, weekday: weekday.pointee, hour: 13, minute: 0, second: 0, nanosecond: 0) is \(Date.init(timeInterval: TimeInterval.init(3600 * 8), since: date))")
        }
        
        
        //MARK: func nextWeekendStart(_ datep: AutoreleasingUnsafeMutablePointer<NSDate?>?, interval tip: UnsafeMutablePointer<TimeInterval>?, options: NSCalendar.Options = [], after date: Date) -> Bool
        
        
        
        //MARK:----- 7. Comparing Dates (比较日期)
        //MARK:func compare(_ date1: Date, to date2: Date, toUnitGranularity unit: NSCalendar.Unit) -> ComparisonResult
        /**
         返回两个给定日期的排序，基于它们的组件，直到给定的单位粒度
         */
        let date1 = Date.init(timeInterval: TimeInterval.init(3600 * 8), since: date)
        let date2 = Date.init(timeInterval: TimeInterval.init(3600 * 8 + 3600), since: date)
        if let comparionsonResult = calendar2?.compare(date1, to: date2, toUnitGranularity: NSCalendar.Unit.second) {
            print("----------comparionsonResult is \(comparionsonResult.rawValue)")
        }
        
        //MARK:func isDate(_ date1: Date, equalTO date2: Date, toUnitGranularity unit: NSCalendar.Unit) -> Bool
        /**
         判断两个日期是否等于给定的粒度单位
         */
        if let isDate = calendar2?.isDate(date1, equalTo: date2, toUnitGranularity: NSCalendar.Unit.second) {
            print("----------isDate is \(isDate)")
        }
        
        //MARK:func isDate(_ date1: Date, isSameDayAs date2: Date) -> Bool
        /**
         判断两个日期是否在同一天
         */
        if let isSameDay = calendar2?.isDate(date1, inSameDayAs: date2) {
            print("----------isSameDay is \(isSameDay)")
        }
        
        
        //MARK:func isDateInToday(_ date: Date) -> Bool
        //指示给定日期是否在“今天”。
        
        //MARK:func isDateInTomorrow(_ date: Date) -> Bool
        //指示给定日期是否在“明天”。
        
        //MARK:func isDateInWeekend(_ date: Date) -> Bool
        //指示给定日期是否在日历和日历的区域设置定义的周末时段内。
        
        //MARK:func isDateInYesterday(_ date: Date) -> Bool
        //指示给定日期是否在“昨天”。
        
        //MARK:----- 8. Getting AM and PM Symbols (获得AM和PM符号)
        //MARK:var amSymbol: String { get }
        if let amSymbol = calendar2?.amSymbol {
            print("----------calendar2?.amSymbol is \(amSymbol)")
        }
        //MARK:var pmSymbol: String { get }
        if let pmSymbol = calendar2?.pmSymbol {
            print("----------calendar2?.pmSymbol is \(pmSymbol)")
        }
        
        
        //MARK:----- 9. Getting Weekday Symbols (获得平日符号)
        
        //MARK:var weekdaySymbols: [String] { get } //此日历中的工作日列表
        if let weekdaySymbols = calendar2?.weekdaySymbols {
            print("----------calendar2?.weekdaySymbols is \(weekdaySymbols)")
        }
        
        //MARK:var shortWeekdaySymbols: [String] { get } //此日历中名称较短的工作日列表。
        if let shortWeekdaySymbols = calendar2?.shortWeekdaySymbols {
            print("---------calendar2?.shortWeekdaySymbols is \(shortWeekdaySymbols)")
        }
        
        //MARK:var veryShortWeekdaySymbols: [String] { get } //此日历中很快命名的工作日列表。
        if let veryShortWeekdaySymbols = calendar2?.veryShortWeekdaySymbols {
            print("---------alendar2?.veryShortWeekdaySymbols is \(veryShortWeekdaySymbols)")
        }
        
        //MARK:var standaloneWeekdaySymbols: [String] { get } //此日历的独立工作日符号列表。
        if let standaloneWeekdaySymbols = calendar2?.standaloneWeekdaySymbols {
            print("-----------calendar2?.standaloneWeekdaySymbols is \(standaloneWeekdaySymbols)")
        }
        
        //MARK:var shortStandaloneWeekdaySymbols: [String] { get } //此日历的短独立工作日符号列表。
        if let shortStandaloneWeekdaySymbols = calendar2?.shortStandaloneWeekdaySymbols {
            print("-----------calendar2?.shortStandaloneWeekdaySymbols is \(shortStandaloneWeekdaySymbols)")
        }
        
        //MARK:var veryShortStandaloneWeekdaySymbols: [String] { get } //此日历的非常短的独立工作日符号列表。
        if let veryShortStandaloneWeekdaySymbols = calendar2?.veryShortStandaloneWeekdaySymbols {
            print("-----------calendar2?.veryShortStandaloneWeekdaySymbols is \(veryShortStandaloneWeekdaySymbols)")
        }

        
        
        //MARK:----- 10. Getting Month Symbols (获得月份符号)
        
        
        //MARK:var monthSymbols: [String] { get } //此日历的月份符号列表。
        if let monthSymbols = calendar2?.monthSymbols {
            print("----------calendar2?.monthSymbols is \(monthSymbols)")
        }
        
        //MARK:var shortMonthSymbols: [String] { get } //此日历的短月份符号列表。
        if let shortMonthSymbols = calendar2?.shortMonthSymbols {
            print("----------calendar2?.shortMonthSymbols is \(shortMonthSymbols)")
        }
        
        //MARK:var veryShortMonthSymbols: [String] { get } //此日历的非常短的月份符号列表。
        if let veryShortMonthSymbols = calendar2?.veryShortMonthSymbols {
            print("----------calendar2?.veryShortMonthSymbols is \(veryShortMonthSymbols)")
        }
        
        //MARK:var standaloneMonthSymbols: [String] { get } //此日历的独立月份符号列表。
        if let standaloneMonthSymbols = calendar2?.standaloneMonthSymbols {
            print("----------calendar2?.standaloneMonthSymbols is \(standaloneMonthSymbols)")
        }
        
        //MARK:var shortStandaloneMonthSymbols: [String] { get } //此日历的短独立月份符号列表。
        if let shortStandaloneMonthSymbols = calendar2?.shortStandaloneMonthSymbols {
            print("----------calendar2?.shortStandaloneMonthSymbols is \(shortStandaloneMonthSymbols)")
        }
        
        //MARK:var veryShortStandaloneMonthSymbols: [String] { get } //此日历的非常短的月份符号列表。
        if let veryShortStandaloneMonthSymbols = calendar2?.veryShortStandaloneMonthSymbols {
            print("----------calendar2?.veryShortStandaloneMonthSymbols is \(veryShortStandaloneMonthSymbols)")
        }

        

        //MARK:----- 11. Getting Quarter Symbols (获的Quarter符号)
        //MARK:var quarterSymbols: [String] { get } //此日历的四分之一符号列表。
        if let quarterSymbols = calendar2?.quarterSymbols {
            print("----------calendar2?.quarterSymbols is \(quarterSymbols)")
        }
        
        //MARK:var shortQuarterSymbols: [String] { get } //此日历的短四分之一符号列表。
        if let shortQuarterSymbols = calendar2?.shortQuarterSymbols {
            print("----------calendar2?.shortQuarterSymbols is \(shortQuarterSymbols)")
        }
        
        //MARK:var standaloneQuarterSymbols: [String] { get } //此日历的独立四分之一符号列表。
        if let standaloneQuarterSymbols = calendar2?.standaloneQuarterSymbols {
            print("----------calendar2?.standaloneQuarterSymbols is \(standaloneQuarterSymbols)")
        }
        
        //MARK:var shortStandaloneQuarterSymbols: [String] { get } //此日历的短独立季度符号列表。
        if let shortStandaloneQuarterSymbols = calendar2?.shortStandaloneQuarterSymbols {
            print("----------calendar2?.shortStandaloneQuarterSymbols is \(shortStandaloneQuarterSymbols)")
        }

        
        //MARK:----- 12. Getting Era Symbols (获得时代符号)
        //MARK:var eraSymbols: [String] { get } //此日历的时代符号列表。
        if let eraSymbols = calendar2?.eraSymbols {
            print("----------calendar2?.eraSymbols is \(eraSymbols)")
        }
        
        //MARK:var longEraSymbols: [String] { get } //此日历的长时代符号列表。
        if let longEraSymbols = calendar2?.longEraSymbols {
            print("----------calendar2?.longEraSymbols is \(longEraSymbols)")
        }

        //MARK:----- 13. Recognizing Notifications (识别通知)
        //MARK:static let NSCalendarDayChanged: NSNotification.Name // 每当系统日历日发生更改时发布的通知，由系统日历，区域设置和时区决定。
        
        //MARK:************************** NSDateComponents/DateComponents *********************
        //MARK:************************** NSDate/Date *******************************
        //MARK:************************** NSDateInterval/DateInterva *************************
        //MARK:************************** NSTimeZone/TimeZone ***************************
        //MARK:************************** NSDataFormatter/DataFormatter ************************
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

