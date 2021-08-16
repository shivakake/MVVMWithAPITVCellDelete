//
//  HomeViewController.swift
//  MVVMDemoWithAPIInTableView
//
//  Created by PGK Shiva Kumar on 16/08/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeViewOutlet : HomeView!
    var homeViewModel : HomeViewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setupUI(){
        homeViewModel.delegate = self
        homeViewOutlet.delegate = self
        homeViewOutlet.configureUI()
        homeViewModel.getData()
    }
    func updateUI(){
        homeViewOutlet.updateUI()
    }
}
extension HomeViewController : HomeViewModelDelegate{
    func updateData() {
        let data = homeViewModel.homeModel
        homeViewOutlet.homeList = data
        updateUI()
    }
}
extension HomeViewController : HomeViewDelegate {
    func deleteCell(rowData: String?) {
        homeViewModel.deleteRow(rowData: rowData)
        updateData()
    }
}
