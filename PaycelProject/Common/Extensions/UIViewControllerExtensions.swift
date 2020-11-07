//
//  UIViewControllerExtensions.swift
//  PaycelProject
//
//  Created by Emre BÜYÜKER on 6.11.2020.
//

import Foundation
import UIKit

public extension UIViewController {
	
	func createAlert(message: String, title: String) {
		let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
		alertController.addAction(OKAction)
		self.present(alertController, animated: true, completion: nil)
	}
	
	func localizableGetString(forkey: String) -> String {
		let string = NSLocalizedString(forkey, comment: "")
		return string
	}
}
