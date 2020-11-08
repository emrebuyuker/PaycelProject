//
//  PaycellLabel.swift
//  PaycelProject
//
//  Created by Emre BÜYÜKER on 8.11.2020.
//

import Foundation
import UIKit

class PaycellLabel: UILabel {
	@IBInspectable var localizableKey: String? = nil {
		didSet {
			if localizableKey != nil {
				self.text = NSLocalizedString(localizableKey!, comment: "")
			}
		}
	}
}
