//
//  CustomTableViewCell.swift
//  RickAndMorty
//
//  Created by Egor Efimenko on 14.04.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {


    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameOfChar: UILabel!
    @IBOutlet weak var raceOfChar: UILabel!
    @IBOutlet weak var genderOfChar: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatar.image = nil
        nameOfChar.text = nil
        raceOfChar.text = nil
        genderOfChar.text = nil
    }
    
    func configure(result: Result) {
        
        let url = URL(string:result.image)
            if let data = try? Data(contentsOf: url!)
            {
                avatar.image = UIImage(data: data)
            }

        nameOfChar.text = result.name
        raceOfChar.text = result.species
        genderOfChar.text = result.gender
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
