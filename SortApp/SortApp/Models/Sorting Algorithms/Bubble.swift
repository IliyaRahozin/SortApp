import Foundation

final class Bubble: SortingConfig {
    
    var timer = Stopwatch()
    var status: Bool = false
    
    
    func start(array: [Int], view: CustomView) {
        let group = DispatchGroup()
        group.enter()
        DispatchQueue.global(qos: .background).async{
            self.timer.start(view: view)
            group.leave()
        }
        group.wait()
        self.bubbleMethod(array)
        self.timer.stop()
    }
    
    func bubbleMethod(_ array: [Int]) {
        var arr = array
        for i in 0..<arr.count {
            for j in 1..<arr.count - i {
                if arr[j] < arr[j-1] {
                    let tmp = arr[j-1]
                    arr[j-1] = arr[j]
                    arr[j] = tmp
                }
            }
        }
        print("end")
    }
    
}

