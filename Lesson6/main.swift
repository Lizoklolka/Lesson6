import Foundation


class Box {
    var sideA: Double
    var sideB: Double
    
    func perimeter () -> Double {
        return (sideA + sideB) * 2
    }
    
    init(sideA: Double, sideB: Double) {
        self.sideA = sideA
        self.sideB = sideB
    }
}

class Plate {
    var radius: Double
    
    func calculatePerimeter() -> Double {
        return 2.0 * Double.pi * radius
    }
    
    init(radius: Double) {
        self.radius = radius
    }
}

struct Queue<T> {
    
    private var elements = [T]()
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        guard elements.count > 0 else { return nil }
        return elements.removeLast()
    }
   public var isEmpty: Bool {
        return elements.count == 0
    }
  func printMyQueue() {
        print(elements)
    }
      public var CheckLast: T? {
        if isEmpty {
            print("There are no elements here.")
            return nil
        } else {
            print("Last element is \(elements.last!)")
            return elements.last
        }
    }
    
    public var CheckFirst: T? {
        if isEmpty {
            print("There are no elements here.")
            return nil
        } else {
            print("First element is \(elements.first!)")
            return elements.first
        }
    }
}
extension Queue {
    func myFilter(predicate:(T) -> Bool) -> [T] {
        var result = [T]()
        for i in elements {
            if predicate(i) {
                result.append(i)
            }
        }
        return result
    }
}

var QueueBox = Queue<Box>()
var QueuePlate = Queue<Plate>()

QueueBox.push(Box(sideA: 5, sideB: 10))
QueueBox.push(Box(sideA: 3, sideB: 3))
QueueBox.push(Box(sideA: 6, sideB: 10))

QueuePlate.push(Plate(radius: 8))
QueuePlate.push(Plate(radius: 5))
QueuePlate.push(Plate(radius: 6))
QueuePlate.push(Plate(radius: 9))

QueueBox.printMyQueue()
QueuePlate.printMyQueue()
QueueBox.CheckFirst
QueueBox.CheckLast
QueuePlate.CheckFirst
QueuePlate.CheckLast

QueueBox.pop()
QueueBox.pop()
QueueBox.pop()
QueuePlate.pop()
QueuePlate.pop()
QueuePlate.pop()
QueuePlate.pop()
QueuePlate.pop()
QueueBox.CheckFirst
QueueBox.CheckLast
QueuePlate.CheckFirst
QueuePlate.CheckLast

let BigBox = QueueBox.myFilter(predicate: {$0.sideA >= 7 || $0.sideB >= 7})
print(BigBox)

let BigPlate = QueuePlate.myFilter(predicate: {$0.radius >= 9})
print(BigPlate)
