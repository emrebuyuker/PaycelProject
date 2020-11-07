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
	
	// MARK: - Properties
	
	private var apiService: APIService!
	private var sortedSearchModel: [SearchModel] = []
	
	override init() {
		super.init()
		self.apiService = APIService()
	}
	
	func serviceCallMethod(search: String) {
		let searchText = search.replacingOccurrences(of: " ", with: "")
		apiService.apiToGetEmployeeData(search: searchText) { (searchModel, error)  in
			self.sortedSearchModel = (searchModel.sorted(by: { $0.Year > $1.Year }))
			self.delegate?.updateView(self.sortedSearchModel, errorText: error)
		}
	}
}
