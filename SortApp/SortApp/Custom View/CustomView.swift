import UIKit

class CustomView: UIView {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "CustomView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func configureTextLabel(title: String) {
        self.textLabel.text = title
    }
    
    func configureSeconds(title: String){
        self.secondsLabel.text = title
    }
}
