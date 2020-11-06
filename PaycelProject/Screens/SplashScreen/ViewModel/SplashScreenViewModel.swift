//
//  SplashScreenViewModel.swift
//  PaycelProject
//
//  Created by Emre BÜYÜKER on 6.11.2020.
//

import Foundation
import FirebaseRemoteConfig

class SplashScreenViewModel: NSObject {
	
	// MARK: - Constans
	
	private let remoteConfigKey = "movies_text"
	private let remoteConfigMinimumFetchInterval: TimeInterval = 0
	private let remoteConfigwithExpirationDuration: TimeInterval = 0
	
	
	// MARK: - Properties
	
	private let remoteConfig = RemoteConfig.remoteConfig()
	
	// MARK: - Delegate
	
	var delegate: SplashScreenViewModelDelegate?
	
	// MARK: - View Model Methods
	
	override init() {
		super.init()
		remoteConfigMethod()
	}
	
	func remoteConfigMethod() {
		let defaults: [String: NSObject] = [self.remoteConfigKey: "" as NSObject]
		remoteConfig.setDefaults(defaults)
		let settings = RemoteConfigSettings()
		settings.minimumFetchInterval = remoteConfigMinimumFetchInterval
		remoteConfig.configSettings = settings
		
		self.remoteConfig.fetch(withExpirationDuration: remoteConfigwithExpirationDuration) { [weak self] (status, error) in
			if status == .success, error == nil {
				self?.remoteConfig.activate { (isSucces, error) in
					guard error == nil else {
						return
					}
					let value = self?.remoteConfig.configValue(forKey: self?.remoteConfigKey).stringValue
					self?.delegate?.updateView(value ?? "")
				}
			} else {
				print("error")
			}
		}
	}
}
