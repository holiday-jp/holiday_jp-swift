//
//  HolidayJp.swift
//  holiday_jp-swift
//
//  Created by Pine Mizune on 2018/01/24.
//

import Foundation

public class HolidayJp {
    private init() { }
    
    public static let calendar: Calendar = Calendar(identifier: .iso8601)
    
    private static let holidays: [String: Holiday] = HolidayJSONLoader.loadHolidays(bundle: Bundle.module)
    
    public static func between(
        _ start: Date,
        and end: Date,
        calendar: Calendar = HolidayJp.calendar
    ) -> [Holiday] {
        let startComponents = calendar.dateComponents([.year, .month, .day], from: start)
        let endComponents = calendar.dateComponents([.year, .month, .day], from: end)
        let startYmd = String(format: "%04d-%02d-%02d", startComponents.year!, startComponents.month!, startComponents.day!)
        let endYmd = String(format: "%04d-%02d-%02d", endComponents.year!, endComponents.month!, endComponents.day!)
        
        return holidays
            .filter { ymd, _ in startYmd <= ymd && ymd <= endYmd }
            .values
            .sorted(by: { $0.ymd < $1.ymd })
    }
    
    public static func isHoliday(_ date: Date, calendar: Calendar = HolidayJp.calendar) -> Bool {
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        let ymd = String(format: "%04d-%02d-%02d", components.year!, components.month!, components.day!)
        return holidays[ymd] != nil
    }
    
    public static func isHoliday(year: Int, month: Int, day: Int) -> Bool {
        let ymd = String(format: "%04d-%02d-%02d", year, month, day)
        return holidays[ymd] != nil
    }
}
