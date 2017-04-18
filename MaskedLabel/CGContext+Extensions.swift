//
//  CGContext+Extensions.swift
//  MaskedLabel
//
//  Created by Diego Rincon on 4/17/17.
//  Copyright © 2017 Scire Studios. All rights reserved.
//

import UIKit

internal extension CGContext {
    func mask(with option: FillOption) -> CGImage? {
        guard let image = makeImage() else {
            print("******** WARNING (MaskedLabel): Unable to create image from graphics context")
            return nil
        }
        
        switch option {
        case .background:
            if let imageMask = imageMask(from: image) {
                return imageMask
            }
            else {
                return image
            }
        case .text:
            return image
        }
    }
    
    func drawGradient(withColorComponents components: [CGFloat], locations: [CGFloat]?, startPoint: CGPoint, endPoint: CGPoint) {
        guard let gradient = CGGradient(colorSpace: CGColorSpaceCreateDeviceRGB(),
                                        colorComponents: components,
                                        locations: locations,
                                        count: components.count / 4) else {
                                            print("******** WARNING (MaskedLabel): Unable to create gradient from gradient colors")
                                            return
        }
        
        drawLinearGradient(gradient, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: 0))
    }
    
    func fill(_ rect: CGRect, with color: UIColor) {
        setFillColor(color.cgColor)
        fill(CGRect(x: 0.0, y: 0.0, width: rect.width, height: rect.height))
    }
    
    // MARK: Auxiliary methods
    
    func imageMask(from image:CGImage) -> CGImage? {
        guard
            let dataProvider = image.dataProvider,
            let imageMask = CGImage(maskWidth: image.width,
                                    height: image.height,
                                    bitsPerComponent: image.bitsPerComponent,
                                    bitsPerPixel: image.bitsPerPixel,
                                    bytesPerRow: image.bytesPerRow,
                                    provider: dataProvider,
                                    decode: image.decode,
                                    shouldInterpolate: true) else {
                                        print("******** WARNING (MaskedLabel): Unable to create image mask from graphics context")
                                        return nil
        }
        
        return imageMask
    }
}
