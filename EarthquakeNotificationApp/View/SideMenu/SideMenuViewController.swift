//
//  MenuViewController.swift
//  EarthquakeNotificationApp
//
//  Created by Emin Hayal on 10.07.2021.
//

import UIKit

protocol SideMenuViewControllerDelegate: AnyObject {
    func didSelecet(menuItem: SideMenuViewController.menuOptions)
}

class SideMenuViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    
    weak var delegate : SideMenuViewControllerDelegate?
    
    enum menuOptions : String , CaseIterable{
        case home = "Son Depremler"
        case profile = "Uygulama Geliştirici"
        
        var imageName : String {
            switch self {
            
            case .home:
                return "home"
            case .profile:
                return "profile"
            }
        }
    }
    
    
    let greyColor = UIColor(red: 97/225.0, green: 56/255.0, blue: 86/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        bottomView.backgroundColor = greyColor
        tableView.backgroundColor = greyColor
        backgroundView.backgroundColor = greyColor  
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: 200, width: view.bounds.size.width, height: view.bounds.size.height)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.text = menuOptions.allCases[indexPath.row].rawValue
        cell.textLabel?.textColor = .white
        cell.imageView?.image = UIImage(named: menuOptions.allCases[indexPath.row].imageName)
        cell.imageView?.tintColor = .white
        cell.backgroundColor = greyColor
        cell.contentView.backgroundColor = greyColor
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = menuOptions.allCases[indexPath.row]
        delegate?.didSelecet(menuItem: item)
    }
    
   
    
}
