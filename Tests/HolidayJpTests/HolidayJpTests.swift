import XCTest
@testable import HolidayJp

class HolidayJpTests: XCTestCase {
    func test_isHoliday_year_month_day() {
        // 祝日が正しいか否か
        XCTAssertTrue(HolidayJp.isHoliday(year: 2011, month: 9, day: 19))
        XCTAssertFalse(HolidayJp.isHoliday(year: 2011, month: 9, day: 18))
        
        // 山の日
        XCTAssertFalse(HolidayJp.isHoliday(year: 2015, month: 8, day: 11))
        for i in 2016..<2051 {
            XCTAssertTrue(HolidayJp.isHoliday(year: i, month: 8, day: 11))
        }
    }

    func test_isHoliday_date() {
        let calendar = Calendar(identifier: .iso8601)
        
        // 祝日が正しいか否か
        let date1 = calendar.date(from: DateComponents(year: 2011, month: 9, day: 19))!
        let date2 = calendar.date(from: DateComponents(year: 2011, month: 9, day: 18))!
        XCTAssertTrue(HolidayJp.isHoliday(date1))
        XCTAssertTrue(HolidayJp.isHoliday(date1, calendar: calendar))
        XCTAssertFalse(HolidayJp.isHoliday(date2))
        XCTAssertFalse(HolidayJp.isHoliday(date2, calendar: calendar))
        
        // 山の日
        let date3 = calendar.date(from: DateComponents(year: 2015, month: 8, day: 11))!
        XCTAssertFalse(HolidayJp.isHoliday(date3))
        XCTAssertFalse(HolidayJp.isHoliday(date3, calendar: calendar))
        for i in 2016..<2051 {
            let date4 = calendar.date(from: DateComponents(year: i, month: 8, day: 11))!
            XCTAssertTrue(HolidayJp.isHoliday(date4))
            XCTAssertTrue(HolidayJp.isHoliday(date4, calendar: calendar))
        }
    }
    
    static var allTests = [
        ("test_isHoliday_year_month_day", test_isHoliday_year_month_day),
    ]
}
