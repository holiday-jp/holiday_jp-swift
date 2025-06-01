import Foundation

public class HolidayJSONLoader {
    public static func loadHolidays(fromResource resource: String = "holidays_detailed", bundle: Bundle = .main) -> [String: Holiday] {
        guard let url = bundle.url(forResource: resource, withExtension: "json") else {
            print("[HolidayJSONLoader] JSONファイルが見つかりません: \(resource).json")
            return [:]
        }
        guard let data = try? Data(contentsOf: url) else {
            print("[HolidayJSONLoader] JSONファイルの読み込みに失敗しました")
            return [:]
        }
        do {
            let holidays = try JSONDecoder().decode([String: Holiday].self, from: data)
            return holidays
        } catch {
            print("[HolidayJSONLoader] JSONのデコードに失敗しました: \(error)")
            return [:]
        }
    }
}
