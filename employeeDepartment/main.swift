var company: [String: [String]] = [:]
displayUsage()

while true {
    let input = getInput()
    let splitInput = input.split(separator: " ")

    var splitStringInput: [String] = []

    for word in splitInput {
        splitStringInput.append(String(word))
    }

    switch splitStringInput.first! {
        case "h", "help":
            displayUsage()
        case "a", "add":
            if splitStringInput.count == 3 {
                addEmployeeToDepartment(employee: splitStringInput[1], department: splitStringInput[2])
            } else {
                print("invalid command \(input)")
            }
        case "l", "list":
            if splitStringInput.count == 2 {
                listEmployeesInDepartment(department: splitStringInput[1])
            } else if splitStringInput.count == 1 {
                listAllEmployeesInCompany()
            } else {
                print("invalid command \(input)")
            }
        default:
            print("invalid command \(input)")
    }
}

func displayUsage() {
    print("""
    usage:
    h, help                        : displays usage
    a, add [employee] [department] : add [employee] to [department]
    l, list [department]           : list employees in [department]
    l, list                        : list all employees in company
    """)
}

func getInput() -> String {
    var input = ""

    while input == "" {
        print(">>", terminator: " ")
        input = readLine()!
    }

    return input
}

func addEmployeeToDepartment(employee: String, department: String) {
    if let existingDepartment = company[department] {
        if existingDepartment.contains(employee) {
            print("Employee already exists in this department")
        } else {
            company[department]!.append(employee)
        }
    } else {
        company[department] = [employee]
    }
}

func listEmployeesInDepartment(department: String) {
    if let _ = company[department] {
        for employee in company[department]! {
            print(employee)
        }
    } else {
        print("no such department: \(department)")
    }
}

func listAllEmployeesInCompany() {
    for (department, employees) in company {
        print("Department:", department)

        for employee in employees {
            print(employee)
        }
    }
}
