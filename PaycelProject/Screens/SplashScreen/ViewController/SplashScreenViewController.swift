//
//  SplashScreenViewController.swift
//  PaycelProject
//
//  Created by Emre BÜYÜKER on 6.11.2020.
//

import UIKit

class SplashScreenViewController: UIViewController {

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
}

extension SplashScreenViewController: SplashScreenViewModelDelegate {
	func updateView(_ value: String) {
		DispatchQueue.main.async {
			self.moviesLabel.text = value
		}
	}
}

