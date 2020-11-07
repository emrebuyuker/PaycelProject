//
//  PaycellButton.swift
//  PaycelProject
//
//  Created by Emre BÜYÜKER on 7.11.2020.
//

import Foundation
import UIKit

class PaycellButton: UIButton {
	@IBInspectable var localizableKey: String? = nil {
		didSet {
			if localizableKey != nil {
				self.setTitle(NSLocalizedString(localizableKey!, comment: ""), for: .normal)
			}
		}
	}
}
