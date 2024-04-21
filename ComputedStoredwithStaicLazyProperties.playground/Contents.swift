import UIKit



// What are stored properties

struct MyStruct {
    let value: String = "This is stored value"
}
let myStruct = MyStruct()
print(myStruct.value)


struct MyStruct2 {
    var value: String = {
        ["some", "value", "out", "here"].randomElement() ?? "Default Valule"
    }()

    var newValue: String {
        ["some", "value", "out", "here"].randomElement() ?? "Default Valule"
    }
}

let myStruct2 = MyStruct2()
print(myStruct2.value)
print(myStruct2.newValue)

// Static here
print("-------------Static here---------------")
struct MyStatic1 {
    static let newLetVal: String = "This is static let value"
    static var newVarVal: String = "This is static var value"
}
let mystatic1 = MyStatic1.self
print(mystatic1.newLetVal)
print(mystatic1.newVarVal)
mystatic1.newVarVal = "NEW VAlule"
print(mystatic1.newVarVal)


// Lazy here
print("-------------Lazy here---------------")
struct MyLazy1 {
    /// Only lazy var are allowed because they are computed later and therefore only var
    /// REASON - LET cannot be mutated at later point in time
    /// This is stored prop
    lazy var newStoredVarVal: String = "This is a lazy stored property, evaluated when called"

    /// This is stored prop, once computed and stored will return the same value
    lazy var newStoredVal: String = {
        ["item11", "item22"].randomElement() ?? "defaultedValue"
    }()

    /// This is comp prop and therefore it is not allowing to write lazy
    /// This will be computed each time its
    var newComputedVal1: String {
        return ["item1", "item2"].randomElement() ?? "defaultedValue"
    }
}
var myLazy1 = MyLazy1()
print(myLazy1.newStoredVarVal)
print(myLazy1.newStoredVal)// this value is returned again.
print(myLazy1.newStoredVal)// return the old value, does not compute it again
print(myLazy1.newComputedVal1)
print(myLazy1.newComputedVal1)
print("----------------------------")
