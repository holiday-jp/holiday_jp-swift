//
//  Holiday.swift
//  holiday_jp-swift
//
//  Created by Pine Mizune on 2018/01/24.
//

import Foundation

public struct Holiday {
    public let ymd: String
    public let week: String
    public let weekEn: String
    public let name: String
    public let nameEn: String
    
    init(
        ymd: String,
        week: String,
        weekEn: String,
        name: String,
        nameEn: String
    ) {
        self.ymd = ymd
        self.week = week
        self.weekEn = weekEn
        self.name = name
        self.nameEn = nameEn
    }
    
    func date(calendar: Calendar = HolidayJp.calendar) -> Date {
        let yearStartIndex = self.ymd.index(self.ymd.startIndex, offsetBy: 4)
        let monthStartIndex = self.ymd.index(self.ymd.startIndex, offsetBy: 5)
        let monthEndIndex = self.ymd.index(monthStartIndex, offsetBy: 2)
        let dayStartIndex = self.ymd.index(self.ymd.startIndex, offsetBy: 8)
        let dayEndIndex = self.ymd.index(dayStartIndex, offsetBy: 2)
        
        let year = Int(self.ymd[..<yearStartIndex])!
        let month = Int(self.ymd[monthStartIndex..<monthEndIndex])!
        let day = Int(self.ymd[dayStartIndex..<dayEndIndex])!
        
        return calendar.date(from: DateComponents(year: year, month: month, day: day))!
    }
}
