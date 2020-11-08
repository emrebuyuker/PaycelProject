//
//  PaycellNavigationItem.swift
//  PaycelProject
//
//  Created by Emre BÜYÜKER on 8.11.2020.
//

import Foundation
import UIKit

class PaycellNavigationItem: UINavigationItem {
	@IBInspectable var localizableKey: String? = nil {
		didSet {
			if localizableKey != nil {
				self.title = NSLocalizedString(localizableKey!, comment: "")
			}
		}
	}
}
