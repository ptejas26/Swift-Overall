import UIKit

struct Singleton {
    private init() { }
    static var sharedInstance = Singleton()
    var counter: Int = 0
        //    mutating func increment(form thread: String) {
        //        counter += 1
        //        print("incremented value \(counter) from \(thread)")
        //    }

        ///This is not thread safe even if there is concurrent/serial queues to access a shared resource
        ///To check this and understand the underlying principles of this, create similar project in iOS app and enable
        ///Thread`Sanity` from `Edit scheme` for your target under `Diagnostic`
    private let concurrentQueue = DispatchQueue(label: "com.example.MyQueue", attributes: .concurrent)

    private let serialQueue = DispatchQueue(label: "mySerialQueue")

    mutating func incrementCounter(form thread: String) {
        serialQueue.sync(flags: .enforceQoS) {
            counter += 1
            print("incremented value \(counter) from \(thread)")
        }
    }

    func currentCount()->Int{
        serialQueue.sync { return self.counter }
    }
}

DispatchQueue.global().async {
    for _ in 1...100 {
        Singleton.sharedInstance.incrementCounter(form: "first thread")
    }
}

DispatchQueue.global().async {
    for _ in 1...100 {
        Singleton.sharedInstance.incrementCounter(form: "second thread")
    }
}

class Name {
    var firstName: String
    init(firstName: String) {
        self.firstName = firstName
    }
}

let tuple1: (name: Name, age: Int)
tuple1.name = Name(firstName: "Ram")
tuple1.age = 11
print(tuple1)

var tuple2 = tuple1
tuple2.name.firstName = "NAmE"
tuple2.age = 33
print(tuple1.name.firstName)
print(tuple2.name.firstName)

print(tuple1.age)
print(tuple2.age)

print(tuple1 === tuple2)
