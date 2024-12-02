// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

//let location = "Resources/testInput.txt"
let location = "Resources/input.txt"
let path = URL(fileURLWithPath: location)
let text = try? String(contentsOf: path)

let lines = text!.components(separatedBy: "\n")

var reports: [[Int]] = []

for line in lines {
    let numbers = line.components(separatedBy: " ")
    if numbers.count < 2 {
        continue
    }

    reports.append(numbers.map{n in return Int(n)!})
}

func CheckIfSafe(report: [Int]) -> Bool {
    let increasing = report[0] < report[1]
    var prev = report[0]

    for i in 1..<report.count {
        if ((prev < report[i]) != increasing
              || prev == report[i]
              || abs(prev - report[i]) > 3) {
            return false
        }

        prev = report[i]
    }

    return true
}

var safeReportsv1 = 0
for report in reports {
    if (CheckIfSafe(report:report)) {
        safeReportsv1 += 1
    }

}

print(safeReportsv1)

var safeReportsv2 = 0

for report in reports {
    if (CheckIfSafe(report:report)) {
        safeReportsv2 += 1
        continue
    }

    for i in 0..<report.count {
        
        let tempReport = report[..<i] + report[(i+1)...]
        if (CheckIfSafe(report:Array(tempReport))) {
            safeReportsv2 += 1
            break
        }
        
    }

}

print(safeReportsv2)
