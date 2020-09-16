
//
//  LaunchScreenController.swift
//  WeatheriOS
//
//  Created by Rezo Joglidze on 9/16/20.
//  Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import UIKit

class LaunchScreenController: UIViewController {
    @IBOutlet weak var weatherLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.weatherLbl.transform = CGAffineTransform(translationX: 100, y: 10)
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.weatherLbl.transform = CGAffineTransform.identity
        }, completion: nil)
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
