//
//  UINavigationController+Ext.swift
//  Tikim
//
//  Created by Rashad on 27.04.26.
//

import Foundation
import UIKit

extension UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        interactivePopGestureRecognizer?.delegate = nil
    }
}
