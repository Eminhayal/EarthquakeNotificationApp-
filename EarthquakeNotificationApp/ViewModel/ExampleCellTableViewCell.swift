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
        setColorAndRadius()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func conf(data: Earthquake) {
        nameLabel.text = data.place
        mwLabel.text = String(data.mw)
        dateLabel.text = String(data.date)
        depthLabel.text = String(data.depth)
    }
    fileprivate func setColorAndRadius() {
        firstCons.layer.cornerRadius = firstCons.frame.size.height/2
        firstCons.layer.borderWidth = 0
        firstCons.layer.masksToBounds = false
        firstCons.layer.shadowColor = UIColor.red.cgColor
        firstCons.layer.shadowOpacity = 1
        firstCons.layer.shadowOffset = .zero
        firstCons.layer.shadowRadius = 10
        firstCons.backgroundColor = .red
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
	
