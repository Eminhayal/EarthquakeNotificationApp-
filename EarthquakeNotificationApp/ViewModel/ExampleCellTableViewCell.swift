//
//  ExampleCellTableViewCell.swift
//  EarthquakeNotificationApp
//
//  Created by Emin Hayal on 16.07.2021.
//

import UIKit

class ExampleCellTableViewCell: UITableViewCell {
    

 
    @IBOutlet weak var firstCons: UIView!
    @IBOutlet weak var depthLabel: UILabel!
    @IBOutlet weak var mwLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        
        
    }
        override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func conf(data: Earthquake) {
        nameLabel.text = data.place
        mwLabel.text = data.mw == "-.-" ? data.ml : data.mw
        dateLabel.text = String(data.date)
        depthLabel.text = "\(String(data.depth)) Km"
    }
    
    
     func setColorAndRadius() {
        let md = mwLabel.text!
        firstCons.layer.cornerRadius = firstCons.frame.size.height/2
        firstCons.layer.borderWidth = 0
        firstCons.layer.masksToBounds = false
        firstCons.layer.shadowOpacity = 1
        firstCons.layer.shadowOffset = .zero
        firstCons.layer.shadowRadius = 10
        if ( md == "-.-" ){
            firstCons.backgroundColor = .green
            firstCons.layer.shadowColor = UIColor.green.cgColor
        }
        else if ( "0.0" < md ) && (md < "1.5")  {
            firstCons.backgroundColor = .gray
            firstCons.layer.shadowColor = UIColor.gray.cgColor
        }else if ("1.5" <= md) && (md < "3.0") {
            firstCons.backgroundColor = .brown
            firstCons.layer.shadowColor = UIColor.brown.cgColor
        }else if ("3.0" <= md) && (md < "4.5") {
            firstCons.backgroundColor = .yellow
            firstCons.layer.shadowColor = UIColor.yellow.cgColor
        }else if ("4.5" <= md) && (md < "6.5") {
            firstCons.backgroundColor = .systemPink
            firstCons.layer.shadowColor = UIColor.systemPink.cgColor
        }else {
            firstCons.backgroundColor = .red
            firstCons.layer.shadowColor = UIColor.red.cgColor
        }
    }
}

extension ExampleCellTableViewCell {
    static var identifier: String {
        return String(describing: Self.self)
    }
    
    static var nibName: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
