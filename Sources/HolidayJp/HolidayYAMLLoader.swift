//
//  HolidayYAMLLoader.swift
//  HolidayJp
//
//  Created by Jotaro Sugiyama on 2025/05/16.
//

import Foundation

public class HolidayYAMLLoader {
    public static func loadHolidays(fromResource resource: String = "holidays_detailed", bundle: Bundle = .main) -> [String: Holiday] {
        guard let url = bundle.url(forResource: resource, withExtension: "yml") else {
            print("[HolidayYAMLLoader] YAMLファイルが見つかりません: \(resource).yml")
            return [:]
        }
        guard let content = try? String(contentsOf: url, encoding: .utf8) else {
            print("[HolidayYAMLLoader] YAMLファイルの読み込みに失敗しました")
            return [:]
        }
        var holidays: [String: Holiday] = [:]
        var currentKey: String? = nil
        var currentDict: [String: String] = [:]
        let lines = content.components(separatedBy: .newlines)
        for line in lines {
            let trimmed = line.trimmingCharacters(in: .whitespaces)
            if trimmed.isEmpty || trimmed == "---" { continue }
            if !line.hasPrefix(" ") && trimmed.hasSuffix(":") {
                if let key = currentKey, !currentDict.isEmpty {
                    if let holiday = HolidayYAMLLoader.dictToHoliday(dict: currentDict) {
                        holidays[key] = holiday
                    }
                }
                currentKey = String(trimmed.dropLast())
                currentDict = [:]
            } else if let range = trimmed.range(of: ": ") {
                let k = String(trimmed[..<range.lowerBound])
                let v = String(trimmed[range.upperBound...])
                currentDict[k] = v
            }
        }
        if let key = currentKey, !currentDict.isEmpty {
            if let holiday = HolidayYAMLLoader.dictToHoliday(dict: currentDict) {
                holidays[key] = holiday
            }
        }
        return holidays
    }
    
    private static func dictToHoliday(dict: [String: String]) -> Holiday? {
        guard let ymd = dict["date"],
              let week = dict["week"],
              let weekEn = dict["week_en"],
              let name = dict["name"],
              let nameEn = dict["name_en"] else {
            return nil
        }
        return Holiday(ymd: ymd, week: week, weekEn: weekEn, name: name, nameEn: nameEn)
    }
}
