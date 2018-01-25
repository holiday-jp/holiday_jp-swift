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
    public static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = HolidayJp.calendar
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    public static func between(_ start: Date, and end: Date) -> [Holiday] {
        let startComponents = calendar.dateComponents([.year, .month, .day], from: start)
        let endComponents = calendar.dateComponents([.year, .month, .day], from: end)
        let startYmd = String(format: "%04d-%02d-%02", startComponents.year!, startComponents.month!, startComponents.day!)
        let endYmd = String(format: "%04d-%02d-%02d", endComponents.year!, endComponents.month!, endComponents.day!)
        
        return Holidays
            .filter { ymd, _ in startYmd <= ymd && ymd <= endYmd }
            .values
            .sorted(by: { $0.ymd < $1.ymd })
    }
    
    public static func isHoliday(_ date: Date, calendar: Calendar = HolidayJp.calendar) -> Bool {
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        let ymd = String(format: "%04d-%02d-%02d", components.year!, components.month!, components.day!)
        return Holidays[ymd] != nil
    }
    
    public static func isHoliday(year: Int, month: Int, day: Int) -> Bool {
        let ymd = String(format: "%04d-%02d-%02d", year, month, day)
        return Holidays[ymd] != nil
    }
}
