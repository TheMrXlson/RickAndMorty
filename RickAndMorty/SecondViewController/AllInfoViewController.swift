//
//  AllInfoViewController.swift
//  RickAndMorty
//
//  Created by Egor Efimenko on 15.04.2022.
//

import UIKit

class AllInfoViewController: UIViewController {
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var race: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var numberOfEpisode: UILabel!
    
    var result: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clear()
        configure()
    }
    
    private func clear() {
        avatar.image = nil
        name.text = nil
        gender.text = nil
        race.text = nil
        status.text = nil
        location.text = nil
        numberOfEpisode.text = nil
    }
    private func configure() {
        guard let result = result else { return }
        
        let url = URL(string:result.image)
        if let data = try? Data(contentsOf: url!)
        {
            avatar.image = UIImage(data: data)
        }
        name.text = result.name
        gender.text = result.gender
        race.text = result.species
        status.text = result.status.rawValue
        location.text = result.location.name
        numberOfEpisode.text = String(result.episode.count)
    }
    
}
