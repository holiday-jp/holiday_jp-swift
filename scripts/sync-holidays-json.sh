#!/bin/bash
set -eu
cd "$(dirname "$0")/.."
yq -o=json '.' holiday_jp/holidays_detailed.yml > Sources/HolidayJp/holidays_detailed.json