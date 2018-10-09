//
//  Circle.swift
//  CGPractice
//
//  Created by Hay Tran Van on 10/9/18.
//  Copyright © 2018 Hay Tran Van. All rights reserved.
//

import Foundation
import UIKit

class Circle {
    let cPoint: CGPoint
    let radius: CGFloat
    
    init(cPoint: CGPoint, radius: CGFloat) {
        self.cPoint = cPoint
        self.radius = radius
    }
    
    func getPointInDegree(degree: CGFloat) -> CGPoint {
        let radian = Double(degree)*(Double.pi/180)
        let x = Double(cPoint.x) + Double(radius)*cos(radian)
        let y = Double(cPoint.y) + Double(radius)*sin(radian)
        return CGPoint(x: x, y: y)
    }
    
    func hasPoint(forPoint: CGPoint) -> Bool {
        if (cPoint.calculateDistance(forPoint: forPoint) < radius) {
            return true
        } else {
            return false
        }
    }
    
}

extension CGPoint {
    func calculateDistance(forPoint: CGPoint) -> CGFloat {
        let dx = pow(forPoint.x - self.x, 2)
        let dy = pow(forPoint.y - self.y, 2)
        return sqrt(dx + dy)
    }
}
