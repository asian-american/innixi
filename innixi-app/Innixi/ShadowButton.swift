//
//  ShadowButton.swift
//  Innixi
//
//  Created by Rahul on 01/05/20.
//

import UIKit

@IBDesignable
class ShadowButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
         didSet {
            setNeedsLayout()
         }
      }
      @IBInspectable var shadowColor: UIColor = UIColor.darkGray {
         didSet {
            setNeedsLayout()
         }
      }
    @IBInspectable var shadowOffsetWidth: CGFloat = 2.0 {
         didSet {
            setNeedsLayout()
         }
      }
    @IBInspectable var shadowOffsetHeight: CGFloat = 2.0 {
         didSet {
            setNeedsLayout()
         }
      }
    @IBInspectable var shadowOpacity: Float = 1.0 {
         didSet {
            setNeedsLayout()
         }
      }
    @IBInspectable var shadowRadius: CGFloat = 2.0 {
         didSet {
            setNeedsLayout()
         }
      }
      private var shadowLayer: CAShapeLayer = CAShapeLayer() {
         didSet {
            setNeedsLayout()
         }
      }
      override func layoutSubviews() {
         super.layoutSubviews()
         layer.cornerRadius = cornerRadius
         shadowLayer.path = UIBezierPath(roundedRect: bounds,
            cornerRadius: cornerRadius).cgPath
         shadowLayer.fillColor = UIColor.white.cgColor
         shadowLayer.shadowColor = shadowColor.cgColor
         shadowLayer.shadowPath = shadowLayer.path
         shadowLayer.shadowOffset = CGSize(width: shadowOffsetWidth,
            height: shadowOffsetHeight)
         shadowLayer.shadowOpacity = shadowOpacity
         shadowLayer.shadowRadius = shadowRadius
         layer.insertSublayer(shadowLayer, at: 0)
      }


}
