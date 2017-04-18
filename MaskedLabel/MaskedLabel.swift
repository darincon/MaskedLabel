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

    /// An array of UIColor that defines the gradient. If it contains only one
    /// element, it will be applied as start and end color. In case this property
    /// is nil or an empty array, the value of fillColor will be used instead.
    open var gradientColors: [UIColor]?
    
    /// The location for each color provided in components. Each location must be a
    /// CGFloat value in the range of 0 to 1, inclusive. If 0 and 1 are not in the 
    /// locations array, Quartz uses the colors provided that are closest to 0 and
    /// 1 for those locations.
    open var gradientLocations: [CGFloat]?
    
    /// The coordinate that defines the starting point of the gradient.
    open var startPoint: CGPoint?
    
    /// The coordinate that defines the ending point of the gradient.
    open var endPoint: CGPoint?
    
    /// Set this property when a constant color is needed instead of a gradient. 
    /// If both this property and gradientColors are set, this color is omitted 
    /// and the gradient will be applied to the text. The default value is
    /// UIColor.black.
    open var fillColor: UIColor = UIColor.black
    
    /// A constant indicating if the gradient, or color, will be applied to the 
    /// label's background, making the text transparent, or to the text.
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
