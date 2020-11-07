//
//  PaycellTextField.swift
//  PaycelProject
//
//  Created by Emre BÜYÜKER on 7.11.2020.
//

import Foundation
import UIKit

class PaycellTextField: UITextField {
	@IBInspectable var localizableKey: String? = nil {
		didSet {
			if localizableKey != nil {
				self.placeholder = NSLocalizedString(localizableKey!, comment: "")
			}
		}
	}
}
