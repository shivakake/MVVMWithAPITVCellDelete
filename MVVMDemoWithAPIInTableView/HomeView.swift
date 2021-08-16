//
//  HomeView.swift
//  MVVMDemoWithAPIInTableView
//
//  Created by PGK Shiva Kumar on 16/08/21.
//

import Foundation
import UIKit
protocol HomeViewDelegate : AnyObject {
    func deleteCell(rowData : String?)
}
class HomeView: UIView {
    @IBOutlet weak var homeListTVOutlet : UITableView!
    var homeList : HomeModel?
    var delegate : HomeViewDelegate?
    
    func configureUI(){
        homeListTVOutlet.dataSource = self
        homeListTVOutlet.delegate = self
        
        homeListTVOutlet.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
    func updateUI(){
        DispatchQueue.main.async {
            self.homeListTVOutlet.reloadData()
        }
    }
}
extension HomeView : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeList?.data?.data?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = homeListTVOutlet.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell{
            cell.configureUI(image: homeList?.data?.data?[indexPath.row].imagery?.mobileMenuPosterImage ?? "", title: homeList?.data?.data?[indexPath.row].title ?? "")
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
}
extension HomeView : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
extension HomeView : HomeTableViewCellDelegate {
    func deleteCell(rowData: String?) {
        delegate?.deleteCell(rowData: rowData)
    }
}

