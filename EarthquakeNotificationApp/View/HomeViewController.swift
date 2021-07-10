//
//  HomeViewController.swift
//  EarthquakeNotificationApp
//
//  Created by Emin Hayal on 10.07.2021.
//

import UIKit

protocol HomeViewControllerDelegate : AnyObject {
    func didTapMenuButton()
}

class HomeViewController: UIViewController {

    weak var delegate : HomeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"),  style: .done, target: self, action: #selector(didTapMenuButton))
    }
    
    @objc func didTapMenuButton(){
        delegate?.didTapMenuButton()
    }
    


}
