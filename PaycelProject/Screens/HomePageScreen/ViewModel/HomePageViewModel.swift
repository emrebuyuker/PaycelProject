//
//  HomePageViewModel.swift
//  PaycelProject
//
//  Created by Emre BÜYÜKER on 6.11.2020.
//

import Foundation

class HomePageViewModel: NSObject {
	
	// MARK: - Delegate
	
	var delegate: HomePageViewModelDelegate?
	
	private var apiService: APIService!
	
	override init() {
		super.init()
		self.apiService = APIService()
	}
	
	func serviceCallMethod(search: String) {
		apiService.apiToGetEmployeeData(search: search) { (searchModel, error)  in
			self.delegate?.updateView(searchModel, errorText: error)
		}
	}
}
