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
    
    let menuVC = SideMenuViewController.instantiate(storyboard: .sideMenu, bundle: nil, identifier: nil)
    let homeVC = HomeViewController.instantiate(storyboard: .homeFlow, bundle: nil, identifier: nil)
    let devPersonVC = DeveloperPersonViewController.instantiate(storyboard: .devPerson, bundle: nil, identifier: nil)
    var navVC = UINavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        addChildVC()
        prepareHomeVM()
        
    }
    
    fileprivate func prepareHomeVM() {
        let homeVM = EarthquakeListViewModel()
        homeVC.earthquakeListViewModel = homeVM
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

