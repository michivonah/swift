import Foundation

// Swift Basics
// Michi von Ah
// 10.08.2024

// Video course for swift: https://youtube.com/playlist?list=PLwvDm4VfkdpiLvzZFJI6rVIBtdolrJBVB&si=9uwpJ9Sdnbo-28gs

// Variables & constants

// variable
var hello: String = "World"
// constant
let pi = 3.14

/*  Multi
    line
    comment */

// Single comment


// Conditions & Functions
func conditions(){
    var myNumber = 12
    let no: Bool = false
    
    myNumber += 1

    if myNumber >= 10 {
        print("Hey, I'm greater ten.")
    }
    else if myNumber >= 5{
        print("Its between 5 and 10 but I don't say you what excactly")
    }
    else{
        print("I am smaller than five")
    }
    
    if !no{
        print("hi")
    }

}

// inline if/else statement
myBool ? "Value when true" : "Value when false"

// toggle Boolean
myBool.toggle()

// function with parameters & return value
// hint: when a return the only thing is in a function you don't have to write return in swift
func divideBy(num1: Double, num2: Double) -> Double {
    let result: Double = num1 / num2
    return result
}

// execute function
conditions()
let myMath: Double = divideBy(num1: 12, num2: 97.0)


// Optionals
// Bool? = true, false or nil is possible
let myBool: Bool? = nil

// with ?? you can set a default value if its nil
print(myBool ?? false)


// Datatypes (tuples, etc.)
// Tuples

let myFirstTuple: (String, Int, Double) = ("Hello World!", 12, 7.68)
let anotherTuple = (7, 8, "nine")

func getUserinfo() -> (name: String, age: Int){
    return ("Max", 21)
}

print(getUserinfo.1) // returns 21
print(getUserinfo.name) // returns "Max"


// structs
// structs are faster & stored in the Stack
struct Quiz {
    let title: String
    let creationDate: Date
    
    // structs are automatically initializied but you can do it also manually
    // as example
    init(title: String, creationDate: Date) {
        self.title = title
        self.creationDate = creationDate
    }
}

// Imutable struct = only uses constants (let) = cannot be changed

// create item from struct
// .now == current date
let myQuiz: Quiz = Quiz(title: "My first Quiz", creationDate: .now)

print(myQuiz.name) // returns "My first Quiz"


// enums
// Enums are like structs but for cases/data we already now at the runtime of the code
// In a enum we have to define all possible options
// --> Only works for hard coded cases, not when fetching data from a db or the internet
// enums are imutable -> cannot be changed

// example with car brands
struct car {
    let brand: carBrand
    let model: String
}

enum carBrand{
    case tesla
    case toyota
    case mercedes
    case skoda
}

// short form of enum case definition
enum carBrandShort{
    case tesla, toyota, mercedes, skoda
}

// create enum object
var myCar1: car = car(brand: .tesla, model: "Model 3")
var myCar2: car = car(brand: .toyota, model: "Yaris")

// switch case
let fruits = ("Apple", "Banana", "Pineapple", "Orange")
switch fruits{
case "Apple":
    return "Hello"
case "Banana":
    return "World"
default:
    return "Hi"
}


// classes
// classes are slower than structs/enums
// classe are stored in the heap
// classes have no intiazlier/were not initalized by default

class ScreenViewModel {
    let title: String
    // private(set) makes that the variable only can modified inside of the class
    private(set) var loggedIn: Bool
    
    // init is for class required
    init(title: String, loggedIn: Bool) {
        self.title = title
        self.loggedIn = loggedIn
    }
    
    // functions inside class
    func changeLoginStatus(myValue: Bool){
        loggedIn = myValue
    }
}

// classes are created as constant but because its a pointer we can change the values inside
let myScreen: ScreenViewModel = ScreenViewModel(title: "First Screen", loggedIn: false)
myScreen.changeLoginStatus(myValue: true)

// public & private variabels
// public variables can be access & edited from outside of the object
// private variables in comparison can only by access from inside the object
// private(set) makes the read public and write private
// you should restrict anything as much as possible

// Arrays & sets
// arrays are defined in []
// array = ordered list of items
// sets works similiar to arrays but cannot contains duplicates
// Arrays can contain duplicated elements
// Also arrays are ordered and sets not

// the following is a array of the type String
var fruitsNew: [String] = ["Apple", "Banana", "Pineapple"]

// define a set
let vegtables: Set<String> = ["Carrot", "Potato"]

// arrays can get counted easily
print(fruitsNew.count)

// append a element
fruitsNew.append("Peach")

// bulk append
fruitsNew.append(contentsOf: ["Mango", "Cherry"])

// access object
print(fruitsNew[3]) // returns Peach

// insert at specific index of array
fruitsNew.insert("Coconut", at: 2)

// remove item from array
fruitsNew.remove(at: 3)

// Dictionary
// A dictionary is a key value store
// dictionary are indexed
// keys have to be unique, values can be duplicate

// create a dict
var attractions: [String:Double] = ["BlueFire" : 1.5, "Arthur" : 4.5]

// add value
attractions["SilverStar"] = 3

// remove element from dict
attractions.removeValue(forKey: "BlueFire")

// While Loop
var funnyNumber: Int = 2
while funnyNumber <= 10 {
    print(funnyNumber)
    funnyNumber += 1
}

// For Loop / Foreach
let words: [String] = ["Hello", "World", "My", "Friend"]

for word: String in words{
    print(word)
}

// Ranges
print(1..<100) // print all numbers from 1 to 100

// String interpolation
let myVar: Int = 78
print("my var: \(myVar)")

// SwiftUI stuff
// switftui needs to be imported when you want to build UI with it
// import SwiftUI

// states & bindings
// States are needed, becuase a struct in swift gets destroyed and recreated. With states you can make the UI/variables stateful
// @State private var isNight: Bool = false
// bindings are used for handing over stateful variables to view structs, etc.
// with a binding you can pass over the value
@Binding var isNight: Bool
// then its required to pass a @State variable over to this struct on creation
// to pass a variable you need to add $ in front of it
BackgroundView(isNight: $isNight)