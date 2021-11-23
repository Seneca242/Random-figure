//
//  ViewController.swift
//  Random figure
//
//  Created by Дмитрий Дмитрий on 23.11.2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var minimumValueLabel: UILabel!
    @IBOutlet var maximumValueLabel: UILabel!

    @IBOutlet var randomNumberLabel: UILabel!
    
    @IBOutlet var getResultButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getResultButton.layer.cornerRadius = 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.minimumValue = minimumValueLabel.text
        settingsVC.maximumValue = maximumValueLabel.text
    }


    @IBAction func getResultButtonPressed() {
        
        let minimumNumber = Int(minimumValueLabel.text ?? "") ?? 0
        let maximumNumber = Int(maximumValueLabel.text ?? "") ?? 100
        
        randomNumberLabel.text = String(Int.random(in: minimumNumber...maximumNumber))
    }
        
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let settingsVC = segue.source as? SettingsViewController else { return }
        minimumValueLabel.text = settingsVC.minimumValueTF.text
        maximumValueLabel.text = settingsVC.maximumValueTF.text
    }
}

