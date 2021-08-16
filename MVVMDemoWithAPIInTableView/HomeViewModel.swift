//
//  HomeViewModel.swift
//  MVVMDemoWithAPIInTableView
//
//  Created by PGK Shiva Kumar on 16/08/21.
//

import Foundation
protocol HomeViewModelDelegate : AnyObject {
    func updateData()
}
class HomeViewModel{
    var homeModel : HomeModel?
    weak var delegate : HomeViewModelDelegate?
    func getData(){
        guard let url = URL(string: "https://n6lih99291.execute-api.ap-south-1.amazonaws.com/dev/menu") else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error{
                print("Error From URL : " , error)
            }else{
                if let data = data {
                    print("Data is : " , data)
                    do{
                        let jsonData = try JSONDecoder().decode(HomeModel.self, from: data)
                        print("JSONData is : " , jsonData)
                        self.homeModel = jsonData
                        self.delegate?.updateData()
                    }catch{
                        print("Error Form JSON is : " , error)
                    }
                }
            }
        }.resume()
    }
    func deleteRow(rowData : String?){
        for index in 0..<(homeModel?.data?.data?.count ?? 0){
            if homeModel?.data?.data?[index].title == rowData{
                homeModel?.data?.data?.remove(at: index)
                break
            }
        }
    }
}
