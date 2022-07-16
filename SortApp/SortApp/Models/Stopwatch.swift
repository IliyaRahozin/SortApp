import Foundation

class Stopwatch {
    
    var timer = Timer()
    var seconds = 0
    var status: Bool = true
    
    func start(view: CustomView) {
        resetSecondsLabel(view: view)
        DispatchQueue.global(qos: .background).async {
            if self.status {
                print("Timer started")
                self.status = false
                self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
                    DispatchQueue.main.async {
                        if let seconds = self?.seconds {
                            view.secondsLabel.text = "\(seconds) s"
                            self?.seconds += 1
                            view.secondsLabel.text = "\(seconds) s"
                        }
                    }
                }
                RunLoop.current.add(self.timer, forMode: .common)
                RunLoop.current.run()
            }
        }
    }
    
    func stop(){
        timer.invalidate()
        status = true
        seconds = 0
        print("Timer stopped")
    }
    
    func resetSecondsLabel(view: CustomView){
        DispatchQueue.main.async {
            view.secondsLabel.text = "\(self.seconds) s"
        }
    }
    
}

