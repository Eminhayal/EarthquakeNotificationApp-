//
//  ContainerExtansioon.swift
//  EarthquakeNotificationApp
//
//  Created by Emin Hayal on 10.07.2021.
//

import UIKit


extension ContainerViewController : HomeViewControllerDelegate{
    func didTapMenuButton() {
        print("tapped")
        
        switch menuState{
        
        case .closed:
           // openit
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut) {
            
                self.navVC?.view.frame.origin.x = self.homeVC.view.frame.size.width - 100 // side menu full left screen navVC !
            } completion: { done in
                if done{
                    self.menuState = .opened
                }
            }

        
        case .opened:
            //close it
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut) {
            
                self.navVC?.view.frame.origin.x = 0
            } completion: { done in
                if done{
                    self.menuState = .closed
                }
            }

        
        
        }
    }
}
extension ContainerViewController : MenuViewControllerDelegate{
    func didTapMenu() {
       
    }
}



    



