//
//  MenuViewController.swift
//  EarthquakeNotificationApp
//
//  Created by Emin Hayal on 10.07.2021.
//

import UIKit

protocol MenuViewControllerDelegate : AnyObject {
    func didTapMenu()
}

class MenuViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    weak var delegate : MenuViewControllerDelegate?
    enum menuOptions : String , CaseIterable{
        case home = "Anasayfa"
        case eartquake = "Deprem"
        
        var imageName : String {
            switch self {
            
            case .home:
                return "house"
            case .eartquake:
                return "star"
            }
        }
    }
    
    private let tableView : UITableView = {
        let table = UITableView()
        table.backgroundColor = nil
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    let greyColor = UIColor(red: 33/225.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = greyColor
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.text = menuOptions.allCases[indexPath.row].rawValue
        return cell
    }
    
   
    
}
