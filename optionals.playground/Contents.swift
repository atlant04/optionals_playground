//Float, Int, String, Double, Bool

let SashaAge: Int = calculateAge()
print(SashaAge) //Возраст или ошибка?


let SashaAgeError: Int = calculateAge(error: false)
if SashaAgeError < 0 {
    print("Ошибка, не знаем сколько лет Саше")
} else {
    print("Саше \(SashaAge) лет!")
}

let tempOutside = calculateTemp(error: true)
print(tempOutside)

if tempOutside < 0 {
    print("Ошибка, не понятно холодно или тепло на улице")
} else {
    print("На улице \(tempOutside) градусов")
}


let optionalSashaAge: Int? = calculateAge()
print(type(of: optionalSashaAge))
print(optionalSashaAge)

let optionalSashaAgeError: Int? = calculateAge(error: true)

if optionalSashaAgeError == nil {
    print("Ошибка, не знаем сколько лет Саше")
}

if let actualAge = optionalSashaAge {
    print("Саше \(actualAge) лет (связывание)")
}

var outsideTemp: Int! = nil
//print(outsideTemp + 5) //Выдает ошибку

outsideTemp = calculateTemperature()
print(type(of: outsideTemp))
print(type(of: outsideTemp) == type(of: 5)) //Типы не равны, так как один из них optional
print(outsideTemp + 5)

let ages = [2, nil, 4, 0, nil, 20, 30]
var count = 0

//останавливается на 2
while let age = ages[count] {
    print(age)
    count += 1
}

//compact map может отфильровывать опциональные значения
let onlyRealAges = ages.compactMap { $0 }
print(type(of: ages)) //Array<Optional<Int>>
print(type(of: onlyRealAges)) //Array<Int>

struct Point: CustomStringConvertible {
    let x: Float
    let y: Float

    //failable initializer, может вернуть nil из консруктора
    init?(dict: [String: Float]) {
        guard let x = dict["x"],
              let y = dict["y"]
        else { return nil }
        self.x = x
        self.y = y
    }

    var description: String {
        "(\(x), \(y))"
    }
}

let point = Point(dict: ["x": 3, "y": 29])
let notPoint = Point(dict: ["x": 3]) //не указали у, будет nil

print(point!)
print(notPoint)


//выдает nil при ошибке
func calculateAge(error: Bool = false) -> Int? {
    return error ? nil : Int.random(in: 0...30)
}

//выдает -1 при ошибке
func calculateAge(error: Bool = false) -> Int {
    return error ? -1: 0
}

//выдает -1 при ошибке
func calculateTemp(error: Bool = false) -> Int {
    return error ? -1 : -22
}

//выдает nil при ошибке
func calculateTemperature(error: Bool = false) -> Int? {
    return error ? nil : -1 * Int.random(in: 10...30)
}
