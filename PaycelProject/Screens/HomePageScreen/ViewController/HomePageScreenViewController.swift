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
	private let warningTextLocalizableKey = "homePageScreen.warningText"
	private let messageTitleLocalizableKey = "messageTitle"
	private let messageErrorTitleLocalizableKey = "messageErrorTitle"
	private let tableViewCellId = "HomePageScreenTableViewCell"
	
	// MARK: - Outlets
	
	@IBOutlet weak var searchTextField: PaycellTextField!
	@IBOutlet weak var tableView: UITableView!
	
	// MARK: - Properties
	
	var animationView: AnimationView?
	private var viewModel: HomePageViewModel!
	private var searchModel: [SearchModel] = []
	
	// MARK: - Life Cycles
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.viewModel = HomePageViewModel()
		self.viewModel.delegate = self
		
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.register(UINib.init(nibName: self.tableViewCellId, bundle: nil), forCellReuseIdentifier: self.tableViewCellId)
    }
	
	@IBAction func searchButtonClick(_ sender: Any) {
		self.view.endEditing(true)
		if self.searchTextField.text == "" {
			self.createAlert(message: self.localizableGetString(forkey: warningTextLocalizableKey), title: self.localizableGetString(forkey: messageTitleLocalizableKey))
			return
		}
		self.animationViewPlay()
		self.viewModel.serviceCallMethod(search: self.searchTextField.text!)
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
		self.searchModel.removeAll()
		if errorText != "" {
			DispatchQueue.main.async {
				self.animationViewPause()
				self.createAlert(message: errorText, title: self.localizableGetString(forkey: self.messageErrorTitleLocalizableKey))
				return
			}
		}
		self.searchModel = searchModel
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
		self.animationViewPause()
	}
}

extension HomePageScreenViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		self.searchModel.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: self.tableViewCellId, for: indexPath) as! HomePageScreenTableViewCell
		cell.homePageScreenTableViewCellMethod(imageViewUrl: self.searchModel[indexPath.row].Poster,
											   titleText: self.searchModel[indexPath.row].Title,
											   imdbText: self.searchModel[indexPath.row].imdbID,
											   yearText: self.searchModel[indexPath.row].Year,
											   typeText: self.searchModel[indexPath.row]._Type)
		return cell
	}
}
