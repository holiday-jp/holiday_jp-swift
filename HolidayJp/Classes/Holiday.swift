//
//  Holiday.swift
//  holiday_jp-swift
//
//  Created by Pine Mizune on 2018/01/24.
//

public struct Holiday {
    public let ymd: String
    public let week: String
    public let weekEn: String
    public let name: String
    public let nameEn: String
    
    public lazy var date: Date =
        HolidayJp.sharedFormatter.date(from: self.ymd)!
    
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
}
