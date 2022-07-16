import Foundation
import UIKit

final class Insertion: SortingConfig {
    
    var timer = Stopwatch()
    var status: Bool = false
    var temp: Int = 0
    var swap: [Int] = [0,0]
    
    func start(array: [Int], view: CustomView) {
        let group = DispatchGroup()
        group.enter()
        DispatchQueue.global(qos: .background).async{
            self.timer.start(view: view)
            group.leave()
        }
        group.wait()
        self.insertionMethod(array)
        self.timer.stop()
    }
    
    func insertionMethod(_ array: [Int]){
        var arr = array
        for x in 1..<arr.count {
            var y = x
            while y > 0 && arr[y] < arr[y - 1] {
                arr.swapAt(y - 1, y)
                y -= 1
            }
        }
        //return arr
    }
    
}

// MARK: - Step-by-Step
extension Insertion {
    
    func stepByStep(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }
        var a = array
        if array.isSorted {
            print("Sorting: Done ✅")
            temp = 0
            return array
        }
        else {
            for x in temp ..< a.count - 1 {
                var lowest = x
                for y in x + 1 ..< a.count {
                    if a[y] < a[lowest] {
                        lowest = y
                    }
                }
                
                if x != lowest {
                    swap[0] = x
                    swap[1] = lowest
                    a.swapAt(x, lowest)
                }
                print(a)
                return a
        }}
        return a
    }
    
    func updateLoop() {
        temp += 1
    }
    
    func resetLoop() {
        temp = 0
    }
    
    
}


