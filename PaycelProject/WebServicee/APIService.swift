//
//  APIService.swift
//  PaycelProject
//
//  Created by Emre BÜYÜKER on 6.11.2020.
//

import Foundation

class APIService :  NSObject {
	
	private let baseUrlString = "https://www.omdbapi.com/"
	private let baseUrl = URL(string: "https://www.omdbapi.com/")!
	private let apikey = "a1d9971b"
	private let searchModel: [SearchModel] = []
	
	func apiToGetEmployeeData(search: String ,completion : @escaping ([SearchModel], _ error: String) -> ()) {
		let apiUrl = "\(baseUrlString)?apikey=\(apikey)&s=\(search)&type=movie"
		
		URLSession.shared.dataTask(with: (URL(string: apiUrl)) ?? baseUrl,
								   completionHandler: { data, response, error in
									
									guard let data = data, error == nil else {
										return
									}
									
									// Convert
									var result: ResponseModel?
									do {
										result = try JSONDecoder().decode(ResponseModel.self, from: data)
									}
									catch {
										completion(self.searchModel, error.localizedDescription)
									}
									
									guard let finalResult = result else {
										return
									}
									
									// Update our movies array
									let newMovies = finalResult.Search
									completion(newMovies, error?.localizedDescription ?? "")
								   }).resume()
	}
}
