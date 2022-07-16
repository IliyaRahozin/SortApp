import UIKit

class SortAlgViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var sizeTextField: UITextField!
    @IBOutlet weak var repeatTextField: UITextField!
    
    @IBOutlet weak var bubbleSwitch: UISwitch!
    @IBOutlet weak var selectionSwitch: UISwitch!
    @IBOutlet weak var quickSwitch: UISwitch!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var contentStackView: UIStackView!
    
    @IBOutlet weak var firstUIView: CustomView!
    @IBOutlet weak var secondUIView: CustomView!
    @IBOutlet weak var thirdUIView: CustomView!
    
    // MARK: - Algo instance
    private var algo = Algorithms.shared
   
    
    // MARK: - Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Switch Buttons
    @IBAction func bubbleSwitch(_ sender: UISwitch) {
        checkSwitch(sender: sender, customView: firstUIView, methodStatus: &algo.bubbleSort.status, textType: K.SortingText.Bubble.rawValue)
    }
    
    @IBAction func selectSwitch(_ sender: UISwitch) {
        checkSwitch(sender: sender, customView: secondUIView, methodStatus: &algo.insertionSort.status , textType: K.SortingText.Selection.rawValue)
    }
    
    @IBAction func quickSwitch(_ sender: UISwitch) {
        checkSwitch(sender: sender, customView: thirdUIView,methodStatus: &algo.quickSort.status, textType: K.SortingText.Quick.rawValue)
    }
    
    
    
    func checkSwitch(sender: UISwitch, customView: CustomView,  methodStatus: inout Bool, textType: String) {
        if sender.isOn {
            UIView.animate(withDuration: 0.2) {
                customView.isHidden = false
                customView.textLabel.text = textType
            }
            methodStatus = true
            
        } else {
            UIView.animate(withDuration: 0.2) {
                customView.isHidden = true
            }
            methodStatus = false
        }
    }
    
    
    // MARK: - Start Button
    @IBAction func startPressed(_ sender: UIButton) {
        checkForValidFields()
        algo.startSorting(viewArr: [firstUIView,secondUIView,thirdUIView])
    }
    
}


// MARK: - Text Validation
extension SortAlgViewController {
    
    /// Array validation
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
    
    /// RepeatCpounter validation
    func invalidRepeatCounter(_ inputTF: UITextField) -> Bool {
        if let value = inputTF.text {
            let set = CharacterSet(charactersIn: value)
            
            if !CharacterSet.decimalDigits.isSuperset(of: set) {
                inputTF.textColor = .red
                print("Log: Repeat variable\n" +
                      "Message: must contain only digits\n")
                return false
            }
            
            if let intValue = Int(value), intValue <  1 || value.hasPrefix("0"){
                inputTF.textColor = .red
                print("Log: Repeat variable\n" +
                      "Message: must be grater than [1,+inf]\n")
                return false
            }
            inputTF.textColor = .black
            return true
        } else { return false }
    }
    
    func checkForValidFields() {
        algo.clearSetting()
        if invalidArraySize(sizeTextField) {
            if let size = Int(sizeTextField.text!) {
                algo.size = size
            }
        }
        
        if  invalidRepeatCounter(repeatTextField) {
            if let repCount = Int(repeatTextField.text!) {
                algo.repCount = repCount
            }
        }
    }
    
}
