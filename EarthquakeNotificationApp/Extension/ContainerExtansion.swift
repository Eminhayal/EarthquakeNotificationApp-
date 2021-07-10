//
//  ContainerExtansioon.swift
//  EarthquakeNotificationApp
//
//  Created by Emin Hayal on 10.07.2021.
//

import UIKit


extension ContainerViewController : HomeViewControllerDelegate{
    func didTapMenuButton() {
       toggleMenu(completion: nil)
    }
    
    func toggleMenu(completion: (() -> Void)?){
        print("tapped")
        
        switch menuState{
        
        case .closed:
           // openit
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut) {
            
                self.navVC.view.frame.origin.x = self.homeVC.view.frame.size.width - 100 // side menu full left screen navVC !
            } completion: { [weak self]  done in
                if done{
                    self?.menuState = .opened
                }
            }
        case .opened:
            //close it
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut) {
            
                self.navVC.view.frame.origin.x = 0
            } completion: { [weak self]  done in
                if done{
                    self?.menuState = .closed
                    DispatchQueue.main.async {
                        completion?()
                    }
                }
            }
        }
    }
}
extension ContainerViewController : SideMenuViewControllerDelegate{
    func didSelecet(menuItem: SideMenuViewController.menuOptions) {
        print("asd")
        toggleMenu { [weak self ]in
            switch menuItem{
            
            case .home:
                self?.resetToHome()
            case .eartquake:
                self?.addMapInfoVC()
            }
        }
    }
    func addMapInfoVC(){
            let vc = mapInfoVC
            homeVC.addChild(vc)
            homeVC.view.addSubview(vc.view)
            vc.view.frame =  view.frame
            vc.didMove(toParent: homeVC)
            homeVC.title = vc.title
        }
        func resetToHome(){
            mapInfoVC.view.removeFromSuperview()
            mapInfoVC.didMove(toParent: nil)
            homeVC.title = "Anasayfa"
        }
    

}



    



