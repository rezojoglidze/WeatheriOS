//
//  HomeViewController.swift
//  Covid19
//
//  Created by Rezo Joglidze on 9/9/20.
//  Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Foundation
import Viperit

class HomeViewController: UserInterface {
        
    override func viewDidLoad() {
        if _presenter != nil {
            super.viewDidLoad()
        }
       configureNavigationBar()
    }
    
    func configureNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeueLTGEO-75Bold", size: 15)!]
        navigationItem.title = "Weather App"
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if _presenter != nil {
            super.viewWillAppear(animated)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if _presenter != nil {
            super.viewDidAppear(animated)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if _presenter != nil {
            super.viewWillDisappear(animated)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if _presenter != nil {
            super.viewDidDisappear(animated)
        }
    }
}
