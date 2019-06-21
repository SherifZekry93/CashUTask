//
//  UIStoryBoard.swift
//  WorkForceApplication
//
//  Created by Sherif  Wagih on 12/19/18.
//  Copyright © 2018 Sherif  Wagih. All rights reserved.
//

import UIKit
extension UIView
{
    func fadeTo(alphaValue:CGFloat,withDuration duration:TimeInterval)
    {
        UIView.animate(withDuration: duration, delay: 0,  options: .curveEaseIn, animations: {
            self.alpha = alphaValue
        }, completion: nil)
    }
    func anchorToView(top : NSLayoutYAxisAnchor? = nil ,leading : NSLayoutXAxisAnchor? = nil,bottom : NSLayoutYAxisAnchor? = nil,trailing : NSLayoutXAxisAnchor? = nil,padding:UIEdgeInsets = .zero,size:CGSize = .zero,centerH:Bool? = false, centerV:Bool? = false)
    {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top
        {
            self.topAnchor.constraint(equalTo: top,constant:padding.top).isActive = true
        }
        if let bottom = bottom
        {
            self.bottomAnchor.constraint(equalTo: bottom,constant:-padding.bottom).isActive = true
        }
        if let right = trailing
        {
            self.trailingAnchor.constraint(equalTo: right,constant:-padding.right).isActive = true
        }
        if let left = leading
        {
            self.leadingAnchor.constraint(equalTo: left,constant:padding.left).isActive = true
        }
        if size.width != 0
        {
            self.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0
        {
            self.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        if centerH == true
        {
            self.centerXAnchor.constraint(equalTo: (self.superview?.centerXAnchor)!).isActive = true
        }
        if centerV == true
        {
            self.centerYAnchor.constraint(equalTo: (self.superview?.centerYAnchor)!).isActive = true
        }
    }
    
    func fixBottomSafeArea(color:UIColor)
    {
        guard let window = UIApplication.shared.keyWindow else {return}
        let height = window.safeAreaInsets.bottom
        let viewToFix = UIView()
        viewToFix.backgroundColor = color
        self.addSubview(viewToFix)
        viewToFix.anchorToView(leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .zero, size: .init(width: 0, height: height))
    }
    func fillSuperView()
    {
        self.anchorToView(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    func fillSuperView(padding:UIEdgeInsets)
    {
        self.anchorToView(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor,padding: padding)
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    func centerInSuperView(size:CGSize)
    {
        anchorToView(size: size, centerH: true, centerV: true)
    }
    func centerInSuperView()
    {
        anchorToView(centerH: true, centerV: true)
    }
    
}
