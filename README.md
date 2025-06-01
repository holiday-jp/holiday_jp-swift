# holiday_jp Swift

[![Build Status](https://travis-ci.org/holiday-jp/holiday_jp-swift.svg?branch=master)](https://travis-ci.org/holiday-jp/holiday_jp-swift)
[![CircleCI](https://circleci.com/gh/holiday-jp/holiday_jp-swift/tree/master.svg?style=shield)](https://circleci.com/gh/holiday-jp/holiday_jp-swift/tree/master)
![CocoaPods Compatible](https://img.shields.io/cocoapods/v/HolidayJp.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=shield)](https://github.com/Carthage/Carthage)
![Platform](https://img.shields.io/cocoapods/p/HolidayJp.svg?style=shield)

:crossed_flags: Japanese holiday for Swift

## Requirements

- Swift 4

## Installing
### CocoaPods

```ruby
pod 'HolidayJp', '~> 0.1'
```

### Carthage

```
github 'holiday-jp/holiday_jp-swift' ~> 0.1
```

### Swift Package Manager

```swift
.Package(url: "https://github.com/holiday-jp/holiday_jp-swift.git", majorVersion: 0, minor: 1),
```

## Example

```swift
import HolidayJp

let today = Date()
if HolidayJp.isHoliday(today) {
    print("Today is a holiday!")
}
```

## API
### `class HolidayJp`
#### `HolidayJp.isHoliday(_: Date) -> Bool`

Judge whether it is a holiday in Japan. If a date is holiday, return `true`.

```swift
let today = Date()
if HolidayJp.isHoliday(today) {
    print("Today is a holiday!")
}
```

#### `HolidayJp.isHoliday(_: Date, calendar: Calendar) -> Bool`

Judge whether it is a holiday in Japan. If a date is holiday, return `true`.
`calendar` is used to compute `YYYY-MM-DD`.

```swift
let calendar = Calendar(identifier: .iso8601)
let today = Date()

if HolidayJp.isHoliday(today, calendar: calendar) {
    print("Today is a holiday!")
}
```

#### `HolidayJp.isHoliday(year: Int, month: Int: day: Int) -> Bool`

Judge whether it is a holiday in Japan. If a date is holiday, return `true`.

```swift
if HolidayJp.isHoliday(year: 2018, month: 12, day: 1) {
    print("2018/12/01 is a holiday!")
}
```


#### `HolidayJp.between(_: Date, and: Date) -> [Holiday]`

Return all holidays in period.

```swift
let calendar = Calendar(identifier: .iso8601)
let date1 = calendar.date(from: DateComponents(year: 2017, month: 1, day: 1))!
let date2 = calendar.date(from: DateComponents(year: 2017, month: 1, day: 31))!

// Show all holidays in 2017/01/01 ~ 2017/1/31
let holidays = HolidayJp.between(date1, and: date2)
for holiday in holidays {
    print(holiday.ymd)
}
```

#### `HolidayJp.between(_: Date, and: Date, calendar: Calendar) -> [Holiday]`

Return all holidays in period.
`calendar` is used to compute `YYYY-MM-DD`.

```swift
let calendar = Calendar(identifier: .iso8601)
let date1 = calendar.date(from: DateComponents(year: 2017, month: 1, day: 1))!
let date2 = calendar.date(from: DateComponents(year: 2017, month: 1, day: 31))!

// Show all holidays in 2017/01/01 ~ 2017/1/31
let holidays = HolidayJp.between(date1, and: date2, calendar: calendar)
for holiday in holidays {
    print(holiday.ymd)
}
```

### `struct Holiday`
`Holiday` struct represents holiday data.

```swift
let calendar = Calendar(identifier: .iso8601)
let date = calendar.date(from: DateComponents(year: 2014, month: 9, day: 23))!
let holiday = HolidayJp.between(date, and: date).first!

print(holiday.ymd)    // "2015-09-23"
print(holiday.week)   // "火"
print(holiday.weekEn) // "Tuesday"
print(holiday.name)   // "秋分の日"
print(holiday.nameEn) // "Autumnal Equinox Day"
print(holiday.date()) // Date(2015-09-23 15:00:00 +0000)
```

## For developer
### Development
Please create Xcode project with Swift Package Manager, and open it.

```
$ swift package generate-xcodeproj
$ open HolidayJp.xcodeproj
```

#### Syncing holidays_detailed.json
This repository uses a YAML file for holiday data, which is managed as a submodule. To update the JSON resource file used by SwiftPM, run:

```
$ ./scripts/sync-holidays-json.sh
```

This script converts the latest `holidays_detailed.yml` from the submodule to `Sources/HolidayJp/holidays_detailed.json`.

#### Automatically update submodule and sync holidays_detailed.json
To automatically update the `holiday_jp` submodule to the latest release (the most recently published tag), and then sync and commit the updated `holidays_detailed.json`, use the following script:

```
$ ./scripts/update-holiday-jp-and-sync.sh
```

This script will:
- Update the `holiday_jp` submodule to the latest release tag (by release date)
- Commit the submodule update if there are changes
- Run `sync-holidays-json.sh` to update `holidays_detailed.json`
- Commit the updated `holidays_detailed.json` if there are changes

### Test

```
$ swift test
```

### Publish to CocoaPods

```
$ pod lib lint
$ pod trunk push
```

## See also
- https://github.com/holiday-jp/holiday_jp

## License
MIT &copy; Pine Mizune

## Contributors
- Pine Mizune
- [Jotaro Sugiyama](https://github.com/sugijotaro)
