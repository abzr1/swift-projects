enum SquareRootError: Error {
    case outOfBounds
    case noRoot
}

func findIntegerRoot(of number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw SquareRootError.outOfBounds
    }

    for i in 0...100 {
        if i * i == number {
            return i
        }
    }

    throw SquareRootError.noRoot
}

do {
    print("found root:", try findIntegerRoot(of: 10_000)) // found root: 100
    print("found root:", try findIntegerRoot(of: 31)) // error: noRoot
} catch {
    print("error:", error)
}
