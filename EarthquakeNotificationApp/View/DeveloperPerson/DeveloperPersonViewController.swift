//
//  DeveloperPerson.swift
//  EarthquakeNotificationApp
//
//  Created by Emin Hayal on 18.07.2021.
//

import UIKit

class DeveloperPersonViewController: UIViewController {

    @IBOutlet weak var mePicture: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mePicture.layer.cornerRadius = 91
        mePicture.layer.borderWidth = 0
        //mePicture.frame.size.height/1.6
        mePicture.layer.shadowOpacity = 1
        mePicture.layer.shadowOffset = .zero
        mePicture.layer.shadowRadius = 10
        mePicture.clipsToBounds = true
    }
    
    @IBAction func github(_ sender: Any) {
        if let url = URL(string: "https://github.com/Eminhayal") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func linkein(_ sender: Any) {
        if let url = URL(string: "https://www.linkedin.com/in/emin-hayal-779573151/") {
            UIApplication.shared.open(url)
        }
    }
    

}
