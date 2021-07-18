//
//  HomeViewController.swift
//  EarthquakeNotificationApp
//
//  Created by Emin Hayal on 10.07.2021.
//

import UIKit

protocol HomeViewControllerDelegate : AnyObject {
    func didTapMenuButton()
}

class HomeViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    weak var delegate : HomeViewControllerDelegate?
    var earthquakeListViewModel : EarthquakeListViewModel!
    var sendToDetail : Earthquake?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupUI()
        searchBar.delegate = self
        earthquakeListViewModel.getData()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    fileprivate func setupTableView() {
        tableView.register(ExampleCellTableViewCell.nibName, forCellReuseIdentifier: ExampleCellTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
    }
    
    fileprivate func setupUI() {
        title = "Son Depremler"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"),  style: .done, target: self, action: #selector(didTapMenuButton))
        earthquakeListViewModel.reloadTableView = { [weak self ] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }//clousere
        }
        earthquakeListViewModel.alertError = { [ weak self ] err in
            guard let self = self else {return}
            let alert = UIAlertController()
            alert.message = err
            alert.show(self, sender: nil)
        }
    }
    
    @objc func didTapMenuButton(){
        delegate?.didTapMenuButton()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExampleCellTableViewCell.identifier, for: indexPath) as! ExampleCellTableViewCell
        let earthquakeViewModel = earthquakeListViewModel.earthqueakeAtIndex(indexPath.row)
        cell.conf(data: earthquakeViewModel)
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.earthquakeListViewModel.tempCurrentList == nil ? 0 : self.earthquakeListViewModel.tempCurrentList?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //present(mapInfoVC, animated: true, completion: nil)
        let mapInfoVC = EarthquakeMapInfoViewController.instantiate(storyboard: .mapInfo, bundle: nil, identifier: nil)
        
        let data = earthquakeListViewModel.earthqueakeAtIndex(indexPath.row)
        mapInfoVC.earthquakeData = data
        self.navigationController?.pushViewController(mapInfoVC, animated: true)
        //let earthquakeViewModel = earthquakeListViewModel.earthqueakeAtIndex(indexPath.row)
        }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        /*
        if searchText == "" {
            earthquakeListViewModel.tempCurrentList?.data = earthquakeListViewModel.earthquakeCurrencyList?.data ?? []
        } else {
            var depremler: [Earthquake] = []
            earthquakeListViewModel.earthquakeCurrencyList?.data.forEach { place in
                if place.place.lowercased().contains(searchText.lowercased()) {
                    depremler.append(place)
                }
            }
            earthquakeListViewModel.tempCurrentList?.data = depremler
        }
        
        tableView.reloadData()
 */
        
        var searchBarData: [Earthquake] = []
        
        if searchText == "" {
            earthquakeListViewModel.tempCurrentList?.data = earthquakeListViewModel.earthquakeCurrencyList?.data ?? []
        }else{
            for place in earthquakeListViewModel.earthquakeCurrencyList?.data ?? [] {
                if place.place.lowercased().contains(searchText.lowercased()) {
                    searchBarData.append(place)
                }
            }
            earthquakeListViewModel.tempCurrentList?.data = searchBarData
            self.tableView.reloadData()
        }
        
    }
    
   
}

