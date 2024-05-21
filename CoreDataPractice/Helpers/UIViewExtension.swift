//
//  UIViewExtension.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 21/05/24.
//

import UIKit

extension UIView {
    
    @IBInspectable open var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable open var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable open var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue!.cgColor
        }
    }
    
    @IBInspectable open var shadowColor: UIColor? {
        set {
            self.layer.shadowColor = newValue!.cgColor
            self.layer.masksToBounds = false
            self.clipsToBounds = false
        }
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            } else {
                return nil
            }
        }
    }
    
    @IBInspectable open var shadowOpacity: Float {
        set {
            layer.shadowOpacity = newValue
        }
        get {
            return layer.shadowOpacity
        }
    }
    
    @IBInspectable open var shadowOffset: CGPoint {
        set {
            layer.shadowOffset = CGSize(width: newValue.x, height: newValue.y)
        }
        get {
            return CGPoint(x: layer.shadowOffset.width, y: layer.shadowOffset.height)
        }
    }
    
    @IBInspectable open var shadowRadius: CGFloat {
        set {
            self.layer.shadowRadius = newValue
            self.layer.masksToBounds = false
            self.clipsToBounds = false
        }
        get {
            return layer.shadowRadius
        }
    }
    
}
