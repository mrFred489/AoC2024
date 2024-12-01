// The Swift Programming Language
// https://docs.swift.org/swift-boo
import Foundation



//let location = "Resources/testInput.txt"
let location = "Resources/input.txt"
let path = URL(fileURLWithPath: location)
let text = try? String(contentsOf: path)

let lines = text!.components(separatedBy: "\n")
var list1: [Int] = []
var list2: [Int] = []
for line in lines {
    let numbers = line.components(separatedBy: "   ")
    if numbers.count != 2 {
        continue
    }

    list1.append(Int(numbers[0])!)
    list2.append(Int(numbers[1])!)
}

list1.sort()
list2.sort()


var diff = 0

for i in 0..<list1.count {
    diff += abs(list1[i]-list2[i])
}

print("answer 1: " + String(diff))

var counts: [Int:Int] = [:]

for number in list2 {
    counts[number, default: 0] += 1
}


var similarity = 0
for number in list1 {
    similarity += number * counts[number, default: 0]
}
print("answer 1: " + String(similarity))
