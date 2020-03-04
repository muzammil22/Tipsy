//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Muzammil Muneer on 02/03/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var finalResult: String?
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = finalResult

    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
