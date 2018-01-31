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
TODO

#### `HolidayJp.between(_: Date, and: Date) -> [Holiday]`
#### `HolidayJp.between(_: Date, and: Date, calendar: Calendar) -> [Holiday]`
TODO

### `struct Holiday`
TODO

## See also
- https://github.com/holiday-jp/holiday_jp

## License
MIT &copy; Pine Mizune
