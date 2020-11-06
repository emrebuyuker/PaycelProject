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
	
	var apiService: APIService!
	
	override init() {
		super.init()
		self.apiService = APIService()
		
		apiService.apiToGetEmployeeData(search: "emre") { (searchModel) in
			print(searchModel)
		}
	}
}
