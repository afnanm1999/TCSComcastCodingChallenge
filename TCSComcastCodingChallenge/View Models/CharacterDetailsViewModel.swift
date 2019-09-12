//
//  CharacterDetailsViewModel.swift
//  TCSComcastCodingChallenge
//
//  Created by Afnan Mirza on 9/6/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import Foundation
import UIKit

typealias GetCharacterImageClosure = (UIImage?) -> Void

class CharacterDetailsViewModel {
    let characterName: String
    let characterDescription: String
    let characterImgUrl: String
    
    init(character: RelatedTopic) {
        self.characterName = character.characterFullDescription.getCharacterName()
        self.characterDescription = character.characterFullDescription.getCharacterDescription()
        self.characterImgUrl = character.icon.characterImgUrl
    }
    
    func getCharacterImg(_ closure: @escaping GetCharacterImageClosure) {
        // Download Image from provided URL
        if !self.characterImgUrl.isEmpty, let url = URL(string: self.characterImgUrl) {
            DispatchQueue.global(qos: .background).async {
                APIHelper.shared.fetchData(from: url) { data, response, error in
                    guard let data = data, error == nil else { return closure(nil) }
                    
                    DispatchQueue.main.async() {
                        closure(UIImage(data: data))
                    }
                }
            }
        } else {
            closure(nil)
        }
    }
    
}
