//
//  SearchModel.swift
//  PaycelProject
//
//  Created by Emre BÜYÜKER on 6.11.2020.
//

import Foundation

struct SearchModel: Codable {
	let Title: String
	let Year: String
	let imdbID: String
	let _Type: String
	let Poster: String

	private enum CodingKeys: String, CodingKey {
		case Title, Year, imdbID, _Type = "Type", Poster
	}
}
