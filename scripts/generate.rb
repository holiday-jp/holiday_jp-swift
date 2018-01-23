#!/usr/bin/ruby
# coding: utf-8

require 'yaml'
require 'erb'

holidays_detailed = YAML.load_file('./holiday_jp/holidays_detailed.yml')
holidays = holidays_detailed.map {|k, v| v }.sort_by {|v| v['date'] }

outputPath = File.join('./HolidayJp/Classes/Holidays.generated.swift')
File.open(outputPath, 'w') do |io|
  io.write ERB.new(DATA.read, nil, '-').result
end


__END__
let Holidays: [String: Holiday] = {
    var holidays: [String: Holiday] = [:]

    <%- holidays.each do |holiday| -%>
    holidays["<%= holiday['date'] %>"] = Holiday(
        ymd: "<%= holiday['date'] %>",
        week: "<%= holiday['week'] %>",
        weekEn: "<%= holiday['week_en'] %>",
        name: "<%= holiday['name'] %>",
        nameEn: "<%= holiday['name_en'] %>"
    )
    <%- end -%>

    return holidays
}()

