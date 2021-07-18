//
//  DepthViewModel.swift
//  EarthquakeNotificationApp
//
//  Created by Emin Hayal on 13.07.2021.
//

import UIKit

class MyCustomCell: UITableViewCell {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var depthLabel: UILabel!
    @IBOutlet weak var dataNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(){
        
    }
}

extension MyCustomCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nibName: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

