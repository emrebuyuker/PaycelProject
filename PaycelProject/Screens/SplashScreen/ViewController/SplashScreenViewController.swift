//
//  SplashScreenViewController.swift
//  PaycelProject
//
//  Created by Emre BÜYÜKER on 6.11.2020.
//

import UIKit

class SplashScreenViewController: UIViewController {

	// MARK: - Constans
	
	private let titleLoclizableKey = "homePageScreen.title"
	
	// MARK: - Outlets
	
	@IBOutlet weak var moviesLabel: UILabel!
	
	// MARK: - Properties
	
	private var viewModel: SplashScreenViewModel!
	
	// MARK: - Life Cycles
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.viewModel = SplashScreenViewModel()
		self.viewModel.delegate = self
	}
	
	private func pushViewControllerMethod() {
		let viewController = HomePageScreenViewController()
		viewController.navigationItem.setHidesBackButton(true, animated: true)
		viewController.title = self.localizableGetString(forkey: self.titleLoclizableKey)
		self.navigationController?.pushViewController(viewController, animated: true)
	}
}

extension SplashScreenViewController: SplashScreenViewModelDelegate {
	func updateView(_ value: String) {
		DispatchQueue.main.async {
			self.moviesLabel.text = value
			DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
				self.pushViewControllerMethod()
			}
		}
	}
}

