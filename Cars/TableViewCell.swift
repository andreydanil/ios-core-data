//
//  TableViewCell.swift
//  Cars
//
//  Created by Andrey Danilkovich on 6/13/16.
//  Copyright © 2016 Andrey Danilkovich. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var CellMake: UILabel!
    @IBOutlet weak var CellModel: UILabel!
    @IBOutlet weak var CellYear: UILabel!
    
    enum status {
        case Excellent, Good, Average, Bad
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func getStatus( _: status) {
        // Refactoring staus 
        var selected = selectStatus(status.Excellent, 1)
        selected = selectStatus(status.Good, 2)
        selected = selectStatus(status.Average, 3)
        selected = selectStatus(status.Bad, 4)
        
    }

    func selectStatus(var _: status, var _: currentStatus) {
        if(status)
        {
            return currentStatus
        }
        
    }
}
