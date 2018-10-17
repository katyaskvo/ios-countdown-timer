//
//  RoundButton.swift
//  timer
//
//  Created by Ekaterina Zdorov on 4/12/18.
//  Copyright © 2018 Ekaterina Zdorov. All rights reserved.
//

import UIKit

@IBDesignable
public class RoundButton: UIButton {

    fileprivate func makeButtonRound() {
        self.layer.cornerRadius = bounds.width / 2
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        makeButtonRound()
    }

    #if TARGET_INTERFACE_BUILDER
    override public func prepareForInterfaceBuilder() {
        makeButtonRound()
    }
    #endif
}
