//
//  ArcTabBar.swift
//  CGPractice
//
//  Created by Hay Tran Van on 10/9/18.
//  Copyright © 2018 Hay Tran Van. All rights reserved.
//

import UIKit

protocol ArcTabBarDelegate {
    func didClickedCircle(position: Int)
}

@IBDesignable
class ArcTabBar: UIView {
    var mPrimaryCircle: Circle!
    var mSecondaryCircles: [Circle]!
    var mSecondaryCirlceRadius: CGFloat = 30
    var delegate: ArcTabBarDelegate?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        generateView()
        drawCircle(cirlce: mPrimaryCircle, fillColor: UIColor.red, strokeColor: UIColor.black)
        drawCircle(cirlce: mSecondaryCircles[0], fillColor: UIColor.green, strokeColor: UIColor.green)
        drawCircle(cirlce: mSecondaryCircles[1], fillColor: UIColor.green, strokeColor: UIColor.green)
        drawCircle(cirlce: mSecondaryCircles[2], fillColor: UIColor.green, strokeColor: UIColor.green)
    }
    
    func generateView() {
        mPrimaryCircle = getPrimaryCircle()
        let firstCircle = getSecondaryCircle(degree: 252)
        let secondCircle = getSecondaryCircle(degree: 270)
        let thirdCircle = getSecondaryCircle(degree: 288)
        
        mSecondaryCircles = [Circle]()
        mSecondaryCircles.append(firstCircle)
        mSecondaryCircles.append(secondCircle)
        mSecondaryCircles.append(thirdCircle)
    }
    
    func getPrimaryCircle() -> Circle {
        let cx = bounds.size.width / 2
        let cy = bounds.size.width + mSecondaryCirlceRadius
        let radius = cy - mSecondaryCirlceRadius
        let cPoint = CGPoint(x: cx, y: cy)
        return Circle(cPoint: cPoint, radius: radius)
    }
    
    func getSecondaryCircle(degree: CGFloat) -> Circle {
        let cPoint = mPrimaryCircle.getPointInDegree(degree: degree)
        let radius = mSecondaryCirlceRadius
        return Circle(cPoint: cPoint, radius: CGFloat(radius))
    }
    
    func drawCircle(cirlce: Circle, fillColor: UIColor, strokeColor: UIColor) {
        let circlePath = UIBezierPath(arcCenter: cirlce.cPoint, radius: cirlce.radius, startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        //change the fill color
        shapeLayer.fillColor = fillColor.cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = strokeColor.cgColor
        //you can change the line width
        shapeLayer.lineWidth = 3.0
        self.layer.addSublayer(shapeLayer)
    }
}
