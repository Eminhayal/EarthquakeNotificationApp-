//
//  ContainerViewController.swift
//  EarthquakeNotificationApp
//
//  Created by Emin Hayal on 10.07.2021.
//

import UIKit

class ContainerViewController: UIViewController {
     enum MenuState {
        case opened
        case closed
    }
    var menuState: MenuState = .closed
    
    let menuVC = SideMenuViewController()
    let homeVC = HomeViewController()
    var mapInfoVC = EarthquakeMapInfoViewController()
    var navVC = UINavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        addChildVC()
        
    }
    
    func addChildVC(){
        //menu
        menuVC.delegate = self
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
        
        //home
        homeVC.delegate = self
        let NavigationVC = UINavigationController(rootViewController: homeVC)
        addChild(NavigationVC)
        view.addSubview(NavigationVC.view)
        NavigationVC.didMove(toParent: self)
        self.navVC = NavigationVC
        
    }

}

