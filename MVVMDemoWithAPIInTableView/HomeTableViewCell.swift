//
//  HomeTableViewCell.swift
//  MVVMDemoWithAPIInTableView
//
//  Created by PGK Shiva Kumar on 16/08/21.
//

import UIKit
import SDWebImage
protocol HomeTableViewCellDelegate : AnyObject {
    func deleteCell(rowData : String?)
}

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImageViewOutlet : UIImageView!
    @IBOutlet weak var movieTitleLabelOutlet : UILabel!
    
    var cellData : String?
    weak var delegate : HomeTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI(){
        movieImageViewOutlet.layer.cornerRadius = movieImageViewOutlet.frame.size.height / 2
    }
    func configureUI(image : String , title : String){
        cellData = title
        let url = URL(string: image)
        movieImageViewOutlet.sd_setImage(with: url, completed: nil)
        movieTitleLabelOutlet.text = title
    }
    @IBAction func trashButtonTapped(_sender : UIButton){
        delegate?.deleteCell(rowData: cellData)
    }
}
