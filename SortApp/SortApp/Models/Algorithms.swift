import Foundation

class Algorithms {
    //MARK: - Properties
    static var shared = Algorithms()
    
    var size: Int?
    var showSize: Int?
    var repCount: Int?
    var status: Bool = false
    
    var bubbleSort: Bubble
    var insertionSort: Insertion
    var quickSort: Quick
    
    var numArray: [Int]?
    var showArray: [Int]?
    
    init(){
        self.bubbleSort = Bubble()
        self.insertionSort = Insertion()
        self.quickSort = Quick()
    }
    
    //MARK: - Methods
    func startSorting(viewArr: [CustomView]) {
        if !status {
            checkAndStart(view: viewArr)
            self.status = false
        }
    }
    
    func checkAndStart(view: [CustomView]){
        let queue = DispatchQueue(label: "sorting.serial.queue")
        queue.async { [weak self] in
            if let repeats = self?.repCount {
                //self?.status = true
                for _ in 0 ..< repeats {
                    self?.status = true
                    
                    self?.configSorting()
                    guard let arr = self?.numArray else { return }
                    
                    if self?.bubbleSort.status == true {
                        self?.bubbleSort.start(array: arr, view: view[0])
                    }
                    
                    if self?.insertionSort.status == true{
                        self?.insertionSort.start(array: arr, view: view[1])
                    }
                    if self?.quickSort.status == true{
                        self?.quickSort.start(array: arr, view: view[2])
                    }
                }
                self?.status = false
            }
            //self?.status = false
        }
    }
    
    func clearSetting(){
        self.size = nil
        self.repCount = nil
        self.numArray = nil
        self.status = false
    }
    
    func configSorting() {
        if let n = size {
            numArray = (0..<n).map{ _ in Int.random(in: 1 ... 100) }
            print(numArray!)
        }
    }
    
    func configStepByStepArray() {
        if let n = showSize {
            showArray = (0..<n).map{ _ in Int.random(in: 1 ... 100) }
            print(showArray!)
        }
    }
    
    func resetShowArray() {
        showArray = []
    }
    
}

extension Collection where Element: Comparable {
    var isSorted: Bool {
        guard count > 1 else {
            return true
        }

        let pairs = zip(prefix(count - 1), suffix(count - 1))

        return !pairs.contains { previous, next in
            previous > next
        }
    }
}
