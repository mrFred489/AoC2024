// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

//let location = "Resources/testInput.txt"
let location = "Resources/input.txt"
let path = URL(fileURLWithPath: location)
let text = try? String(contentsOf: path, encoding:String.Encoding.utf8)

do {
    let regex = try NSRegularExpression(pattern: "mul\\([0-9]{1,3},[0-9]{1,3}\\)")
    let matches = regex.matches(in:text!, range: NSRange(text!.startIndex..., in: text!))
    let allMuls = matches.map {
        String(text![Range($0.range, in: text!)!])}
    var sum = 0
    for mul in allMuls {
        let numbers = mul.components(separatedBy: CharacterSet.decimalDigits.inverted)
          .filter {$0.count > 0}
          .map {Int($0)!}
        sum += numbers[0] * numbers[1]
    }
    print(sum)
} catch let error as NSError {
    print("Error creating NSRegularExpression: \(error)")
}


do {
    let regex = try NSRegularExpression(pattern: "(mul\\([0-9]{1,3},[0-9]{1,3}\\))|(don't\\(\\))|(do\\(\\))")
    let matches = regex.matches(in:text!, range: NSRange(text!.startIndex..., in: text!))
    let allExpressions = matches.map {
        String(text![Range($0.range, in: text!)!])}
    var sum = 0
    var active = true
    for expression in allExpressions {
        if expression == "do()" {
            active = true
            continue
        }
        else if expression == "don't()" {
            active = false
            continue
        }

        if !active {
            continue
        }
        
        let numbers = expression.components(separatedBy: CharacterSet.decimalDigits.inverted)
          .filter {$0.count > 0}
          .map {Int($0)!}
        sum += numbers[0] * numbers[1]
    }
    print(sum)
} catch let error as NSError {
    print("Error creating NSRegularExpression: \(error)")
}
