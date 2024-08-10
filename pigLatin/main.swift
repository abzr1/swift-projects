let input = getInput()
let splitInput = input.split(separator: " ")

for word in splitInput {
    print(pigLatin(String(word)))
}

func getInput() -> String {
    var input = ""

    while input == "" {
        print("Input words separated by spaces:", terminator: " ")
        input = readLine()!
    }

    return input
}

func pigLatin(_ word: String) -> String {
    switch word.first {
        case "a", "e", "i", "o", "u":
            return word + "-hay"
        default:
            var newWord = String(word[String.Index(utf16Offset: 1, in: word)...])
            newWord = "\(newWord)-\(word.first!)ay"
            return newWord
    }
}
