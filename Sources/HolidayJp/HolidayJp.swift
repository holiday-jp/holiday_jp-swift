//
//  HolidayJp.swift
//  holiday_jp-swift
//
//  Created by Pine Mizune on 2018/01/24.
//

import Foundation

public class HolidayJp {
    private init() { }
    
    public static let sharedFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
    public static func between(
        _ start: Date,
        and end: Date,
        formatter: DateFormatter = HolidayJp.sharedFormatter
    ) -> [Holiday] {
        let startYmd = formatter.string(from: start)
        let endYmd = formatter.string(from: end)
        
        return Holidays
            .filter { ymd, _ in startYmd <= ymd && ymd <= endYmd }
            .values
            .sorted(by: { $0.ymd < $1.ymd })
    }
    
    public static func isHoliday(
        _ date: Date,
        formatter: DateFormatter = HolidayJp.sharedFormatter
    ) -> Bool {
        let ymd = formatter.string(from: date)
        return Holidays[ymd] != nil
    }
}
