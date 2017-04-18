//
//  ViewController.swift
//  GradientTextLabel
//
//  Created by Diego Rincon on 4/17/17.
//  Copyright © 2017 Scire Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Config {
        static let labelFont                = UIFont(name: "HelveticaNeue-Bold", size: 25)
        
        static let widthMultiplier          = CGFloat(0.9)
        static let topMarginMultiplier      = CGFloat(0.05)
        static let labelHeight              = CGFloat(250)
    }
    
    lazy var gradientLabel: GradientTextLabel = { [unowned self] in
        let text = "Lorem ipsum dolor sit amet, usu everti eligendi te, ei eam enim agam mazim, graecis platonem contentiones ad sea. Et mel reque delectus, meis libris vim id. Harum temporibus pro ne, te dicunt facilisis elaboraret nec."
        
        let labelWidth = self.view.frame.width * Config.widthMultiplier
        let labelHeight = Config.labelHeight
        
        let label = GradientTextLabel()
        label.text = text
        label.numberOfLines = 0
        label.font = Config.labelFont
        label.fillColor = UIColor.red
//        label.gradientColors = [UIColor.yellow, UIColor.blue, UIColor.red, UIColor.black, UIColor.cyan, UIColor.green]
//        label.gradientLocations = [0.0, 0.5, 1.0]
        label.startPoint = CGPoint(x: 0.0, y: labelHeight)
        label.endPoint = CGPoint(x: labelWidth, y: 0.0)
        label.fillOption = .background
        
        return label
    } ()
    
    // MARK: Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        layoutLabel()
    }
    
    // MARK: Setup
    
    // MARK: Layout
    
    func layoutLabel() {
        let width = view.bounds.width * Config.widthMultiplier
        let height = Config.labelHeight
        let originX = (view.bounds.width - width) / 2.0
        let originY = view.bounds.height * Config.topMarginMultiplier
        
        gradientLabel.frame = CGRect(x: originX, y: originY, width: width, height: height)
    }
}

