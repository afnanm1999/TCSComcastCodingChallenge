//
//  APIHelper.swift
//  TCSComcastCodingChallenge
//
//  Created by Afnan Mirza on 9/5/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import Foundation

typealias fetchCharacterCompletionHandler = ([Character]?, APIError?) -> Void

class APIHelper {
    // Singletons
    static let shared = APIHelper()
    
    private init() {}
    
    func fetchCharacters(completionHandler: @escaping fetchCharacterCompletionHandler) {
        self.createAPICall(apiUrl: AppConfiguration.apiURL, completionHandler: completionHandler)
    }
    
    func fetchData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    private func createAPICall(apiUrl: String, completionHandler: @escaping fetchCharacterCompletionHandler) {
        guard let url = URL(string: apiUrl) else { return completionHandler([], .incorrectURL) }
        
        var characterList: [Character] = [Character]()
        
        self.fetchData(from: url) { (data, response, error) in
            guard let dataResponse = data, error == nil else { return completionHandler([], .responseError) }
            
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                guard let json = jsonResponse as? [String: Any], let relatedTopicsArray = json["RelatedTopics"] as? [[String: Any]] else { return completionHandler([], .parsingJSONError) }
                
                for relatedTopics in relatedTopicsArray {
                    if let text = relatedTopics["Text"] as? String {
                        let textTuple = self.getCharacterNameAndDescription(text: text)
                        let icon = relatedTopics["Icon"] as? [String: String]
                        
                        characterList.append(Character(title: textTuple.0, description: textTuple.1, imgUrl: icon?["URL"]))
                    }
                }
                
                completionHandler(characterList, nil)
            } catch {
                return completionHandler([], .parsingJSONError)
            }
        }
        
    }
    
    // Saparate Description Text and Get the Character Name
    private func getCharacterNameAndDescription(text: String) -> (String?, String?) {
        var charcterName: String?
        var desc: String?
        
        if let index = text.firstIndex(of: "-") {
            var i = text.index(index, offsetBy: -1)
            charcterName = String(text[..<i])
            
            i = text.index(index, offsetBy: 2)
            desc = String(text[i...])
        }
        
        return (charcterName, desc)
    }
    
}
