//
//  DetailsViewController.swift
//  TCSComcastCodingChallenge
//
//  Created by Afnan Mirza on 9/6/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var characterImgView: UIImageView!
    @IBOutlet var characterNameLbl: UILabel!
    @IBOutlet var characterDescriptionLbl: UILabel!
    
    // MARK: - Variables & Constants
    var detailViewModel: CharacterDetailsViewModel?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let viewModel = self.detailViewModel {
            self.characterImgView.image = UIImage(named: "no-image")
            
            if let imgUrl = viewModel.characterImgUrl, let url = URL(string: imgUrl) {
                APIHelper.shared.fetchData(from: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    
                    DispatchQueue.main.async() {
                        self.characterImgView.image = UIImage(data: data)
                    }
                }
            }
            
            self.characterNameLbl.text = viewModel.characterName ?? "Unknown Character Name"
            self.characterDescriptionLbl.text = viewModel.characterDescription ?? "Unknown Character Description"
        }
    }
    
}
