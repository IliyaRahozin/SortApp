import Foundation

final class Quick: SortingConfig {
    
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
        self.quickMethod(array)
        self.timer.stop()
    }
    
    func quickMethod(_ array: [Int]) {
        var arr = array
        quickSort(&arr, 0, arr.count - 1)
        print("end")
    }
    
    func quickSort(_ array: inout [Int], _ start: Int, _ end: Int ){
        //base case
        if start > end {
            return
        }
        
        //recursive case
        let pIndex = partition(&array, start, end)
        quickSort(&array, start, pIndex - 1)
        quickSort(&array, pIndex + 1, end)
        
    }
    
    func partition(_ array: inout [Int], _ start: Int, _ end: Int) -> Int {
        let pivot = array[end]
        var pIndex = start
        
        for i in start..<end {
            if(array[i] < pivot){
                let temp = array[i]
                array[i] = array[pIndex]
                array[pIndex] = temp
                pIndex += 1
            }
        }
        
        let temp = array[pIndex]
        array[pIndex] = pivot
        array[end] = temp
        
        return pIndex
    }
}
