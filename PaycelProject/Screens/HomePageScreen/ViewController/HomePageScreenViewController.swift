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
	
	// MARK: - Properties
	
	var animationView: AnimationView?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.animationViewPlay()
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
		self.animationView?.removeFromSuperview()
	}
}
