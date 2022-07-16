import UIKit

class DemoViewController: UIViewController {
    
    @IBOutlet weak var sizeTF: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Algo instance
    private var algo = Algorithms.shared
    private var idCell = "elementCell"
    private var size = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    @IBAction func restartPressed(_ sender: UIButton) {
        checkForValidFields()
        algo.resetShowArray()
        algo.configStepByStepArray()
        algo.insertionSort.resetLoop()
        tableView.reloadData()

    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        if algo.showArray != nil {
            algo.showArray = algo.insertionSort.stepByStep(algo.showArray!)
            algo.insertionSort.updateLoop()
            updateTable()
        }
        
    }
    
}

// MARK: - TableView
extension DemoViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return algo.showArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "allCell") ??
                   UITableViewCell(style: .default, reuseIdentifier: "allCell")
        
        let element = algo.showArray?[indexPath.row] //number
        cell.textLabel?.text = String(element ?? 0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    
    func updateTable(){
        let swap = algo.insertionSort.swap
        for element in 0 ..< swap.count {
            let indexPath = IndexPath(item: swap[element], section: 0)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }
    
}

// MARK: - SizeTF
extension DemoViewController {
    
    func checkForValidFields() {
        if invalidArraySize(sizeTF) {
            if let size = Int(sizeTF.text!) {
                algo.showSize = size
            }
        }
    }
    
    func invalidArraySize(_ inputTF: UITextField) -> Bool {
        if let value = inputTF.text {
            let set = CharacterSet(charactersIn: value)
            
            if !CharacterSet.decimalDigits.isSuperset(of: set) {
                inputTF.textColor = .red
                print("Log: Array-Size variable\n" +
                      "Message: must contain only digits\n")
                return false
            }
            
            if let intValue = Int(value), intValue < 2 || value.hasPrefix("0") {
                inputTF.textColor = .red
                print("Log: Array-Size variable\n" +
                      "Message: must be grater than [2,+inf]\n")
                return false
            }
            inputTF.textColor = .black
            return true
        } else { return false }
    }
    
}



