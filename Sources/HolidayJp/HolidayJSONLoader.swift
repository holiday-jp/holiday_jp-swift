import Foundation

class HolidayJSONLoader {
    static func loadHolidays(
        fromResource resource: String = "holidays_detailed",
        bundle: Bundle = .main
    ) -> [String: Holiday] {
        guard let url = bundle.url(forResource: resource, withExtension: "json") else {
            fatalError("[HolidayJSONLoader] Unable to find the JSON file: \(resource).json")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("[HolidayJSONLoader] Failed to load the JSON data: \(url)")
        }
        do {
            let holidays = try JSONDecoder().decode([String: Holiday].self, from: data)
            return holidays
        } catch {
            fatalError("[HolidayJSONLoader] Failed to decode the JSON data: \(error)")
        }
    }
}
