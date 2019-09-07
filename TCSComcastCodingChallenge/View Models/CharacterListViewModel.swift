//
//  CharacterListViewModel.swift
//  TCSComcastCodingChallenge
//
//  Created by Afnan Mirza on 9/5/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import Foundation

class CharacterListViewModel {
    
    // Cell ID
    let characterCellID = "CharacterCell"
    
    // Object Arrays
    var characters: [Character] = [Character]()
    private var filteredCharacterList: [Character] = [Character]()
    
    var searchText: String = "" {
        didSet {
            self.getFilteredCharacters()
        }
    }
    
    func fetchCharacters(completion: @escaping (APIError?) -> Void) {
        APIHelper.shared.fetchCharacters() { [weak self] (character, error) in
            if let error = error {
                completion(error)
            } else if let character = character {
                DispatchQueue.main.async {
                    self?.characters = character
                    self?.filteredCharacterList = character
                    completion(nil)
                }
            }
        }
    }
    
    /**
     This function gets the Count from Characters Object Array.
     
     - Returns: An integer containing the Character Object Coount
     */
    func getCharacterListCount() -> Int {
        self.getFilteredCharacters()
        return self.filteredCharacterList.count
    }
    
    /**
     This function uses the provided index and returns the `Character` Object.
     
     - Parameter index: The index location to search in the Character's Object Array.
     
     - Returns: An object of `Character`
     */
    func getCharacter(at index: Int) -> Character {
        return self.filteredCharacterList[index]
    }
    
    
    func getTitleAt(index: Int) -> String? {
        return self.filteredCharacterList[index].title
    }
    
    /**
     This function is used to filter data
     */
    func getFilteredCharacters() {
        if self.searchText.isEmpty {
            self.filteredCharacterList = self.characters
        } else {
            self.filteredCharacterList = self.characters.filter({
                $0.title?.uppercased().contains(self.searchText.uppercased()) ?? false || $0.description?.uppercased().contains(self.searchText.uppercased()) ?? false
            })
        }
    }
    
}
