//
//  IndicatorViewController.swift
//  EarthquakeNotificationApp
//
//  Created by Emin Hayal on 22.07.2021.
//

import UIKit

class IndicatorViewController: UIViewController {


    @IBOutlet weak var indicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        indicator.hidesWhenStopped = true
    }
    
    func spining(){
        indicator.startAnimating()
    }
    func stopSpining(){
        indicator.stopAnimating()
        indicator.hidesWhenStopped = true
    }

}
