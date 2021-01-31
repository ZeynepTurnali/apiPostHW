//
//  Splash.swift
//  apiPostHW


import UIKit

class Splash: UIViewController {

    @IBOutlet weak var splashLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 3.0) {
            self.splashLabel.alpha = 0
        }

        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { (timer) in
            self.performSegue(withIdentifier: "main", sender: nil)
        }
    }

}
