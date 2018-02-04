# holiday_jp Swift &nbsp;[![Build Status](https://travis-ci.org/pine/holiday_jp-swift.svg?branch=master)](https://travis-ci.org/pine/holiday_jp-swift) [![CircleCI](https://circleci.com/gh/pine/holiday_jp-swift/tree/master.svg?style=shield)](https://circleci.com/gh/pine/holiday_jp-swift/tree/master)

:crossed_flags: Japanese holiday for Swift

## Installing
### CocoaPods

```ruby
pod 'HolidayJp', '~> 0.1'
```

### Carthage

```
github 'pine/holiday_jp-swift' ~> 0.1
```

### Swift Package Manager

```swift
.Package(url: "https://github.com/pine/holiday_jp-swift.git", majorVersion: 0, minor: 1),
```

## Example

```swift
import Foundation
import HolidayJp

let today = Date()
if HolidayJp.isHoliday(today) {
  print("Today is a holiday!")
}
```

## API
### `class HolidayJp`
#### `HolidayJp.isHoliday(_: Date) -> Bool`
#### `HolidayJp.isHoliday(_: Date, calendar: Calendar) -> Bool`
#### `HolidayJp.isHoliday(year: Int, month: Int: day: Int) -> Bool`

Judge whether it is a holiday in Japan. If a date is holiday, return `true`.

#### `HolidayJp.between(_: Date, and: Date) -> [Holiday]`
#### `HolidayJp.between(_: Date, and: Date, calendar: Calendar) -> [Holiday]`

Return all holidays in period.

### `struct Holiday`
`Holiday` struct represents holiday data.

```
let calendar = Calendar(identifier: .iso8601)
let date = calendar.date(from: DateComponents(year: 2014, month: 9, day: 23, hour: 0, minute: 0, second: 1))!
let holiday = HolidayJp.between(date, and: date)

print(holiday.ymd)    // "2015-09-23"
print(holiday.week)   // "火"
print(holiday.weekEn) // "Tuesday"
print(holiday.name)   // "秋分の日"
print(holiday.nameEn) // "Autumnal Equinox Day"
print(holiday.date()) // Date(2015-09-23 15:00:00 +0000)
```

## See also
- https://github.com/holiday-jp/holiday_jp

## License
MIT &copy; Pine Mizune
