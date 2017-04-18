//
//  ViewController.swift
//  MaskedLabel
//
//  Created by Diego Rincon on 4/17/17.
//  Copyright © 2017 Scire Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var maskedLabel: MaskedLabel!
    @IBOutlet weak var fillSegmentedControl: UISegmentedControl!
    @IBOutlet weak var useSegmentedControl: UISegmentedControl!
    
    var gradientColors = [UIColor(red:0.79, green:0.30, blue:0.64, alpha:1.00),
                          UIColor(red:0.08, green:0.33, blue:0.82, alpha:1.00)]
    
    var labelText: String {
        var text: String
        
        if fillSegmentedControl.selectedSegmentIndex == 0 {
            text = "BACKGROUND "
        }
        else {
            text = "TEXT "
        }
        
        if useSegmentedControl.selectedSegmentIndex == 0 {
            text += "COLOR"
        }
        else {
            text += "GRADIENT"
        }
        
        return "\(text)\n\(text)\n\(text)\n\(text)"
    }
    
    // MARK: Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupMaskedLabel()
    }
    
    override func viewDidLayoutSubviews() {
        setupGradientPoints()
    }
    
    // MARK: Setup
    
    func setupMaskedLabel() {
        maskedLabel.text = labelText
        maskedLabel.fillColor = UIColor.red
        maskedLabel.gradientColors = nil
        maskedLabel.fillOption = .background
    }
    
    func setupGradientPoints() {
        maskedLabel.startPoint = CGPoint(x: 0.0, y: 0.0)
        maskedLabel.endPoint = CGPoint(x: maskedLabel.frame.width, y: maskedLabel.frame.height)
    }
    
    // MARK: Action methods
    
    @IBAction func fillSegmentedControlDidChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            maskedLabel.fillOption = .background
        }
        else {
            maskedLabel.fillOption = .text
        }
        
        maskedLabel.text = labelText
    }
    
    @IBAction func useSegmentedControlDidChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            maskedLabel.gradientColors = nil
        }
        else {
            maskedLabel.gradientColors = gradientColors
        }
        
        maskedLabel.text = labelText
    }
}

