import Foundation
import UIKit

struct K {
    enum SortingText: String {
        case Bubble = "Bubble: "
        case Selection = "Selection:"
        case Quick = "Quick: "
    }
}


// MARK: - SortingConfig Protocol
protocol SortingConfig {
    var timer: Stopwatch { get set}
    var status: Bool {get set}
    
    func start(array:[Int], view: CustomView)
}


// MARK: - Example of start func
//func start(array: [Int], view: CustomView) {
//    let queue = DispatchQueue(label: "sortingQueue", attributes: .concurrent)
//    queue.sync { [weak self] in
//        self?.timer.start(view: view)
//        self?.insertionMethod(array: array)
//        self?.timer.stop()
//    }
//    //return ar
//}

//let queue = DispatchQueue(label: "sortingQueue", attributes: .concurrent)
//queue.sync { [weak self] in
//    self?.timer.start(view: view)
//    self?.insertionMethod(array: array)
//    self?.timer.stop()
//}

//        group.enter()
//        DispatchQueue.global(qos: .default).sync{
//            self.bubbleMethod(array)
//            self.timer.stop()
//            group.leave()
//        }
//        group.wait()
