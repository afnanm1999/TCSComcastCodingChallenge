//
//  CharacterTVCell.swift
//  TCSComcastCodingChallenge
//
//  Created by Afnan Mirza on 9/5/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit

class CharacterTVCell: UITableViewCell {

    @IBOutlet var characterNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(viewModel: CharacterListViewModel, rowNumber: Int) {
        self.characterNameLbl.text = viewModel.getTitleAt(index: rowNumber)
    }
    
}
