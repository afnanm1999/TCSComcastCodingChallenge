//
//  APIHelper.swift
//  TCSComcastCodingChallenge
//
//  Created by Afnan Mirza on 9/5/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import Foundation

typealias FetchCharacterCompletionHandler = ([Character]?, APIError?) -> Void
typealias FetchDataCompletionHandler = (Data?, URLResponse?, Error?) -> Void

class APIHelper {
    // Singletons
    static let shared = APIHelper()
    
    private init() {}
    
    /**
     Fetches Characters from the API Url. Depending on the Scheme thats running this can be either a URL for Simpsons Characters Viewer Or The Wire Character Viewer
     
     - Parameter completionHandler: This Completion Handler will be called when the request has been completed.
     
     -  The Completion Handler will contain an Array of Character Objects unless there was error with the request in this case it will return an `Error`
     */
    func fetchCharacters(completionHandler: @escaping FetchCharacterCompletionHandler) {
        guard let url = URL(string: AppConfiguration.apiURL) else { return completionHandler([], .incorrectURL) }
        
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
    
    /**
     This function is used to get data from the provided `URL`.
     
     - Parameter url: The `URL` of the API.
     - Parameter completion: The completion handler to call when the load request is complete.
     */
    func fetchData(from url: URL, completion: @escaping FetchDataCompletionHandler) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    /**
     This Function is used to separate the Character's Names from the Description.
     
     - Parameter text: The text containing the Character's Name and Description.
     
     - Warning:  In order for this function to successfully complete the format for the text parameter  has to be "Character Name - Description". If this isn't the format of the provided text this function will return incorrect data.
     
     - Returns: A tuple with format (Character's Name, Character's Description). The Tuple values are Optional Values..
     */
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
