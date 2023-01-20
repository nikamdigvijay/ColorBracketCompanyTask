//
//  CartTableViewCell.swift
//  ColorBracketTechTask
//
//  Created by Digvijay Nikam on 17/01/23.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var uishareimage: UIImageView!
    @IBOutlet weak var uiSaveimage: UIImageView!
    
    @IBOutlet weak var colorNamelabel: UILabel!
    
    @IBOutlet weak var firstcolorView: UIView!
    
    @IBOutlet weak var secondColorView: UIView!
    
    @IBOutlet weak var thirdColorView: UIView!
    
    @IBOutlet weak var AddButtonView: UIButton!
    
    @IBOutlet weak var descriptionButton: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
