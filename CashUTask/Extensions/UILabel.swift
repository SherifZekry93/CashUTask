//
//  UILabel.swift
//  CashUTask
//
//  Created by Sherif  Wagih on 6/20/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit

extension UILabel
{
    convenience init(text: String,font:UIFont,numberOfLines:Int = -1) {
        self.init(frame:.zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
    }
}
