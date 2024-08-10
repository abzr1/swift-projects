var numbers = getNumbers()
print("Median:", calculateMedian(numbers))
print("Mode:", calculateMode(numbers))

func getNumbers() -> [Int] {
    var numbers: [Int] = []

    var input = ""

    while input == "" {
        print("Input numbers separated by spaces:", terminator: " ")
        input = readLine()!
    }

    for word in input.split(separator: " ") {
        if let number = Int(word) {
            numbers.append(number)
        } else {
            print("error: not a number: \(word)")
        }
    }

    return numbers
}

func calculateMedian(_ numbers: [Int]) -> Int {
    var temp = numbers
    temp.sort()
    let median = temp[temp.count / 2]
    return median
}

func calculateMode(_ numbers: [Int]) -> Int {
    var frequencies: [Int: Int] = [:]

    for n in numbers {
        if let _ = frequencies[n] {
            frequencies[n]! += 1
        } else {
            frequencies[n] = 1
        }
    }

    var mode = frequencies.first!.key
    var highestFrequency = frequencies.first!.value

    for (number, frequency) in frequencies {
        if frequency > highestFrequency {
            mode = number
            highestFrequency = frequency
        }
    }

    return mode
}
