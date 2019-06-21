//
//  UIButton.swift
//  CashUTask
//
//  Created by Sherif  Wagih on 6/20/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit

extension UIButton {
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
    }
}
