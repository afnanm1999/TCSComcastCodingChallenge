//
//  CharacterDetailsViewModel.swift
//  TCSComcastCodingChallenge
//
//  Created by Afnan Mirza on 9/6/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import Foundation

class CharacterDetailsViewModel {
    let characterName: String?
    let characterDescription: String?
    let characterImgUrl: String?
    
    init(character: Character) {
        self.characterName = character.title
        self.characterDescription = character.description
        self.characterImgUrl = character.imgUrl
    }
}
