//
//  MaskedLabel.swift
//  MaskedLabel
//
//  Created by Diego Rincon on 4/17/17.
//  Copyright © 2017 Scire Studios. All rights reserved.
//

import UIKit

public enum FillOption {
    case background, text
}

open class MaskedLabel: UILabel {

    open var gradientColors: [UIColor]?
    open var gradientLocations: [CGFloat]?
    open var startPoint: CGPoint?
    open var endPoint: CGPoint?
    open var fillColor: UIColor = UIColor.black
    open var fillOption = FillOption.text
    
    // TODO: Change to private
    internal var colorComponents: [CGFloat]? {
        get {
            guard let gradientColors = gradientColors, gradientColors.count > 0 else {
                return nil
            }
            
            var colorComponents = [CGFloat]()
            
            for color in gradientColors {
                var red = CGFloat(0.0)
                var green = CGFloat(0.0)
                var blue = CGFloat(0.0)
                var alpha = CGFloat(0.0)
                
                color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
                colorComponents += [red, green, blue, alpha]
            }
            
            if colorComponents.count <= 4 {
                colorComponents += colorComponents
            }
            
            return colorComponents
        }
    }
    
    public init() {
        super.init(frame: CGRect.zero)
        
        commonInit()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        textColor = UIColor.white
    }
    
    override open func drawText(in rect: CGRect) {
        super.drawText(in: rect)
        
        let context = UIGraphicsGetCurrentContext()
        
        defer {
            context?.restoreGState()
        }
        
        guard let mask = context?.mask(with: fillOption) else {
            return
        }
        
        context?.saveGState()
        context?.concatenate(CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: rect.height))
        
        context?.clear(rect)
        context?.clip(to: rect, mask: mask)
        
        if let colorComponents = colorComponents {
            let startPoint = self.startPoint ?? CGPoint(x: rect.minX, y: rect.minY)
            let endPoint = self.endPoint ?? CGPoint(x: rect.maxX, y: rect.maxY)
            
            context?.concatenate(CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: rect.height))
            context?.drawGradient(withColorComponents: colorComponents, locations: gradientLocations, startPoint: startPoint, endPoint: endPoint)
        }
        else {
            context?.fill(rect, with: fillColor)
        }
    }
}
