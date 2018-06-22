//
//  ViewController.swift
//  HUDExample
//
//  Created by Ranjith Kumar on 6/22/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import UIKit

class ViewController: UIViewController,HUDShowing {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.showHUD(title: "Fetching details...")
        
        self.perform(#selector(stopHUD), with: nil, afterDelay: 2.0)
    }
    
    @objc private func stopHUD() {
        self.hideHUD()
    }
    
}

