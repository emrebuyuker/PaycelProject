//
//  HomePageScreenViewController.swift
//  PaycelProject
//
//  Created by Emre BÜYÜKER on 6.11.2020.
//

import UIKit
import Lottie

class HomePageScreenViewController: UIViewController {

	// MARK: - Constans
	
	private let lottiName = "lottie"
	
	// MARK: - Outlets
	
	@IBOutlet weak var searchTextField: PaycellTextField!
	
	// MARK: - Properties
	
	var animationView: AnimationView?
	
	// MARK: - Properties
	
	private var viewModel: HomePageViewModel!
	
	// MARK: - Life Cycles
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.viewModel = HomePageViewModel()
		self.viewModel.delegate = self
    }
	
	@IBAction func searchButtonClick(_ sender: Any) {
		self.view.endEditing(true)
		if self.searchTextField.text == "" {
			self.createAlert(message: self.localizableGetString(forkey: "homePageScreen.warningText"), title: self.localizableGetString(forkey: "messageTitle"))
			return
		}
		self.animationViewPlay()
		let searchText = self.searchTextField.text?.replacingOccurrences(of: " ", with: "") ?? ""
		self.viewModel.serviceCallMethod(search: searchText)
	}
}

extension HomePageScreenViewController {
	func animationViewPlay() {
		self.animationView?.backgroundColor = .clear
		self.animationView = .init(name: lottiName)
		self.animationView?.frame = view.bounds
		self.animationView?.loopMode = .loop
		view.addSubview(animationView!)
		animationView?.play()
	}
	
	func animationViewPause() {
		self.animationView?.pause()
		DispatchQueue.main.async {
			self.animationView?.removeFromSuperview()
		}
	}
}

extension HomePageScreenViewController: HomePageViewModelDelegate {
	func updateView(_ searchModel: [SearchModel], errorText: String) {
		if errorText != "" {
			DispatchQueue.main.async {
				self.animationViewPause()
				self.createAlert(message: errorText, title: self.localizableGetString(forkey: "messageErrorTitle"))
				return
			}
		}
		print(searchModel)
		self.animationViewPause()
	}
}
