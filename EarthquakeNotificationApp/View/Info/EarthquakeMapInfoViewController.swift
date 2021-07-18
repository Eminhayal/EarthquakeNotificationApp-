//
//  EarthquakeMapInfoViewController.swift
//  EarthquakeNotificationApp
//
//  Created by Emin Hayal on 10.07.2021.
//

import UIKit
import MapKit

class EarthquakeMapInfoViewController: UIViewController {

    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    
    var earthquakeData : Earthquake?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         // var gelen:Earthquake?
        title = "Deprem Harita Bilgilendirme"
        infoView.layer.cornerRadius = 40
        infoView.clipsToBounds = false
        
        }
    
    @IBAction func hideBtnClick(_ sender: Any) {
        UIView.animate(withDuration: 1, delay: 1, options: .curveEaseIn, animations: {
            self.infoView.isHidden = !self.infoView.isHidden

        }) { _ in
        }
    }
}
