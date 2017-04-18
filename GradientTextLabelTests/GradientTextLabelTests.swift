//
//  GradientTextLabelTests.swift
//  GradientTextLabelTests
//
//  Created by Diego Rincon on 4/17/17.
//  Copyright © 2017 Scire Studios. All rights reserved.
//

import XCTest

class GradientTextLabelTests: XCTestCase {
    
    var gradientTextLabel: GradientTextLabel?
    
    override func setUp() {
        super.setUp()
        
        gradientTextLabel = GradientTextLabel()
    }
    
    func testNoGradientColors() {
        gradientTextLabel?.gradientColors = [UIColor]()
        
        XCTAssertNil(gradientTextLabel?.colorComponents)
    }
    
    func testOneGradientColor() {
        gradientTextLabel?.gradientColors = [UIColor.red]
        let colorComponents = gradientTextLabel?.colorComponents
        
        XCTAssertEqual(colorComponents?.count, 8)
        
        // Test color component of the first color
        XCTAssertEqual(colorComponents?[0], 1.0)
        XCTAssertEqual(colorComponents?[1], 0.0)
        XCTAssertEqual(colorComponents?[2], 0.0)
        XCTAssertEqual(colorComponents?[3], 1.0)
        
        // Test first and second color components are the same
        XCTAssertEqual(colorComponents?[0], colorComponents?[4])
        XCTAssertEqual(colorComponents?[1], colorComponents?[5])
        XCTAssertEqual(colorComponents?[2], colorComponents?[6])
        XCTAssertEqual(colorComponents?[3], colorComponents?[7])
    }
    
    func testTwoGradientColors() {
        gradientTextLabel?.gradientColors = [UIColor.red, UIColor.green]
        let colorComponents = gradientTextLabel?.colorComponents
        
        XCTAssertEqual(gradientTextLabel?.colorComponents?.count, 8)
        
        // Test color component of the first color
        XCTAssertEqual(colorComponents?[0], 1.0)
        XCTAssertEqual(colorComponents?[1], 0.0)
        XCTAssertEqual(colorComponents?[2], 0.0)
        XCTAssertEqual(colorComponents?[3], 1.0)
        
        // Test color component of the second color
        XCTAssertEqual(colorComponents?[4], 0.0)
        XCTAssertEqual(colorComponents?[5], 1.0)
        XCTAssertEqual(colorComponents?[6], 0.0)
        XCTAssertEqual(colorComponents?[7], 1.0)
    }
    
    func testThreeGradientColors() {
        gradientTextLabel?.gradientColors = [UIColor.red, UIColor.green, UIColor.blue]
        let colorComponents = gradientTextLabel?.colorComponents
        
        XCTAssertEqual(gradientTextLabel?.colorComponents?.count, 12)
        
        // Test color component of the first color
        XCTAssertEqual(colorComponents?[0], 1.0)
        XCTAssertEqual(colorComponents?[1], 0.0)
        XCTAssertEqual(colorComponents?[2], 0.0)
        XCTAssertEqual(colorComponents?[3], 1.0)
        
        // Test color component of the second color
        XCTAssertEqual(colorComponents?[4], 0.0)
        XCTAssertEqual(colorComponents?[5], 1.0)
        XCTAssertEqual(colorComponents?[6], 0.0)
        XCTAssertEqual(colorComponents?[7], 1.0)
        
        // Test color component of the third color
        XCTAssertEqual(colorComponents?[8], 0.0)
        XCTAssertEqual(colorComponents?[9], 0.0)
        XCTAssertEqual(colorComponents?[10], 1.0)
        XCTAssertEqual(colorComponents?[11], 1.0)
    }
    
    func testSixGradientColors() {
        gradientTextLabel?.gradientColors = [UIColor.red, UIColor.green, UIColor.blue, UIColor.orange, UIColor.brown, UIColor.purple]
        let colorComponents = gradientTextLabel?.colorComponents
        
        XCTAssertEqual(gradientTextLabel?.colorComponents?.count, 24)
        
        // Test color component of the first color
        XCTAssertEqual(colorComponents?[0], 1.0)
        XCTAssertEqual(colorComponents?[1], 0.0)
        XCTAssertEqual(colorComponents?[2], 0.0)
        XCTAssertEqual(colorComponents?[3], 1.0)
        
        // Test color component of the second color
        XCTAssertEqual(colorComponents?[4], 0.0)
        XCTAssertEqual(colorComponents?[5], 1.0)
        XCTAssertEqual(colorComponents?[6], 0.0)
        XCTAssertEqual(colorComponents?[7], 1.0)
        
        // Test color component of the third color
        XCTAssertEqual(colorComponents?[8], 0.0)
        XCTAssertEqual(colorComponents?[9], 0.0)
        XCTAssertEqual(colorComponents?[10], 1.0)
        XCTAssertEqual(colorComponents?[11], 1.0)
        
        // Test color component of the forth color
        XCTAssertEqual(colorComponents?[12], 1.0)
        XCTAssertEqual(colorComponents?[13], 0.5)
        XCTAssertEqual(colorComponents?[14], 0.0)
        XCTAssertEqual(colorComponents?[15], 1.0)
        
        // Test color component of the fifth color
        XCTAssertEqual(colorComponents?[16], 0.6)
        XCTAssertEqual(colorComponents?[17], 0.4)
        XCTAssertEqual(colorComponents?[18], 0.2)
        XCTAssertEqual(colorComponents?[19], 1.0)
        
        // Test color component of the sixth color
        XCTAssertEqual(colorComponents?[20], 0.5)
        XCTAssertEqual(colorComponents?[21], 0.0)
        XCTAssertEqual(colorComponents?[22], 0.5)
        XCTAssertEqual(colorComponents?[23], 1.0)
    }
}
