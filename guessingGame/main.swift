print("Guess the number between 1 and 100!")
var secretNumber = Int.random(in: 1...100)
var numberOfAttempts = 0
var guessedTheNumber = false

while !guessedTheNumber {
    numberOfAttempts += 1
    print("Input your guess:", terminator: " ")
    let guess = readLine()!

    if let number = Int(guess) {
        if number == secretNumber {
            print("You win! It took you \(numberOfAttempts) attempts.")
            guessedTheNumber.toggle()
        } else if number > secretNumber {
            print("Too high!")
        } else {
            print("Too low!")
        }
    } else {
        print("\(guess) isn't a number!")
    }
}
