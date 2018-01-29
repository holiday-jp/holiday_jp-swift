//
//  HolidayTest.swift
//  holiday_jp-swift
//
//  Created by Pine Mizune on 2018/01/30.
//

import Foundation
import XCTest

@testable import HolidayJp

class HolidayTests: XCTestCase {
    func test_init() {
        let holiday = Holiday(
            ymd: "2018-01-30",
            week: "火",
            weekEn: "Tuesday",
            name: "テストの日",
            nameEn: "Test Day"
        )
        
        XCTAssertEqual(holiday.ymd, "2018-01-30")
        XCTAssertEqual(holiday.week, "火")
        XCTAssertEqual(holiday.weekEn, "Tuesday")
        XCTAssertEqual(holiday.name, "テストの日")
        XCTAssertEqual(holiday.nameEn, "Test Day")
    }
    
    func test_date() {
        let calendar = Calendar(identifier: .iso8601)
        let holiday = Holiday(ymd: "2018-01-30", week: "-", weekEn: "-", name: "-", nameEn: "-")
        
        let components1 = calendar.dateComponents([.year, .month, .day], from: holiday.date())
        XCTAssertEqual(components1.year!, 2018)
        XCTAssertEqual(components1.month!, 1)
        XCTAssertEqual(components1.day!, 30)
        
        let components2 = calendar.dateComponents([.year, .month, .day], from: holiday.date(calendar: calendar))
        XCTAssertEqual(components2.year!, 2018)
        XCTAssertEqual(components2.month!, 1)
        XCTAssertEqual(components2.day!, 30)
    }
    
    static var allTests = [
        ("test_init", test_init),
    ]
}
