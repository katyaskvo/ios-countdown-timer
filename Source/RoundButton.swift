//
//  RoundButton.swift
//  timer
//
//  Created by Ekaterina Zdorov on 4/12/18.
//  Copyright © 2018 Ekaterina Zdorov. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
