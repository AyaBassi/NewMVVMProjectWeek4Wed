//
//  TableViewCell.swift
//  NewProjectWithAPIWeek4Wednesday19th
//
//  Created by Payam Karbassi on 19/04/2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var brand: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var imageview: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
