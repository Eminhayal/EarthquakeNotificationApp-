//
//  EarthquakeMapInfoViewController.swift
//  EarthquakeNotificationApp
//
//  Created by Emin Hayal on 10.07.2021.
//

import UIKit
import MapKit
import CoreLocation

class EarthquakeMapInfoViewController: UIViewController  {

    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var placeNameView: UIView!
    @IBOutlet weak var coordinat: UIView!
    @IBOutlet weak var mdView: UIView!
    @IBOutlet weak var miView: UIView!
    @IBOutlet weak var firsViewLabelOne: UILabel!
    @IBOutlet weak var firstViewLabelTwo: UILabel!
    @IBOutlet weak var secondViewLabel: UILabel!
    @IBOutlet weak var thirdViewLabel: UILabel!
    
    
    @IBOutlet weak var infoContainer: UIView!
    @IBOutlet weak var distanceView: UIView!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var mdRadiusView: UIView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var mdLabel: UILabel!
    let annotation = MKPointAnnotation()
    
    var earthquakeData : Earthquake?
    var earthquakeListViewModel : EarthquakeListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Deprem Harita Bilgilendirme"
        
        firsViewLabelOne.text = "Y:\(String(describing: earthquakeData?.longitude ?? 0.0))"
        firstViewLabelTwo.text = "X:\(String(describing: earthquakeData?.latitude ?? 0.0 ))"
        secondViewLabel.text = earthquakeData?.mw
        thirdViewLabel.text = earthquakeData?.ml
        mdLabel.text =  earthquakeData?.mw == "-.-" ? earthquakeData?.ml : earthquakeData?.mw
        placeName.text = earthquakeData?.place
        dateLabel.text = earthquakeData?.date
        distanceLabel.text = "\(String(describing: earthquakeData?.depth ?? 0.0)) KM"
    
        let locationLatitude = earthquakeData?.latitude
        let locationLongitude = earthquakeData?.longitude
        annotation.coordinate = CLLocationCoordinate2D(latitude: locationLatitude ?? 0.0, longitude: locationLongitude ?? 0.0)
        annotation.title = earthquakeData?.place
        mapView.addAnnotation(annotation)
        mapView.isZoomEnabled = true
        mapView.showAnnotations(self.mapView.annotations, animated: true)
        mapView.camera.altitude *= 40;
        
        setLayout()
        
        }
    
    @IBAction func hideBtnClick(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, animations:  {
            if  self.infoView.isHidden == true{
                self.infoView.isHidden = false
            }else {
                self.infoView.isHidden = true
            }

        }) { _ in
        }
    }
     func setLayout() {
        let md = mdLabel.text
        infoView.layer.cornerRadius = 40
        infoView.clipsToBounds = false
        
        coordinat.layer.cornerRadius = 20
        mdView.layer.cornerRadius = 20
        miView.layer.cornerRadius = 20
        infoContainer.layer.cornerRadius = 20
        distanceView.layer.cornerRadius = 20
        
        mdRadiusView.layer.cornerRadius = mdRadiusView.frame.size.height/2
        mdRadiusView.layer.borderWidth = 0
        mdRadiusView.layer.masksToBounds = false
        mdRadiusView.layer.shadowOpacity = 1
        mdRadiusView.layer.shadowOffset = .zero
        mdRadiusView.layer.shadowRadius = 10
        if ( md == "-.-" ){
            mdRadiusView.backgroundColor = .green
            mdRadiusView.layer.shadowColor = UIColor.green.cgColor
        }
        else if ( "0.0" < md! ) && (md! < "1.5")  {
            mdRadiusView.backgroundColor = .gray
            mdRadiusView.layer.shadowColor = UIColor.gray.cgColor
        }else if ("1.5" <= md!) && (md! < "3.0") {
            mdRadiusView.backgroundColor = .brown
            mdRadiusView.layer.shadowColor = UIColor.brown.cgColor
        }else if ("3.0" <= md!) && (md! < "4.5") {
            mdRadiusView.backgroundColor = .yellow
            mdRadiusView.layer.shadowColor = UIColor.yellow.cgColor
        }else if ("4.5" <= md!) && (md! < "6.5") {
            mdRadiusView.backgroundColor = .systemPink
            mdRadiusView.layer.shadowColor = UIColor.systemPink.cgColor
        }else {
            mdRadiusView.backgroundColor = .red
            mdRadiusView.layer.shadowColor = UIColor.red.cgColor
        }
    }
}
