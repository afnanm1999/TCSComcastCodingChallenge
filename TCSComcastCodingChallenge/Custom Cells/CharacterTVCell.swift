//
//  CharacterTVCell.swift
//  TCSComcastCodingChallenge
//
//  Created by Afnan Mirza on 9/5/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit

class CharacterTVCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet var characterNameLbl: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Helper Functions
    func configureCell(viewModel: CharacterListViewModel, rowNumber: Int) {
        self.characterNameLbl.text = viewModel.getCharacterName(at: rowNumber)
    }
}
