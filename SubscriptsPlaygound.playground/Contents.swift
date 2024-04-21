import UIKit


struct MyClass {
    
    var array: [Int] = []
    subscript(index: Int) -> Int? {
        get {
            return array[index]
        }
        
        set {
            guard array[index] else {
                return
            }
            array.append(newValue)
            
//            if let array[index] = newValue {
//
//            }
        }
    }
}

var myClass = MyClass()

