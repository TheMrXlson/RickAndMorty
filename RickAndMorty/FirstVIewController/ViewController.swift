//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Egor Efimenko on 14.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cell = "cell" //Reuse Identifier
    var result = [Result](){
        didSet {
            self.tableView.reloadData()
        }
    }
    var selectedChar: Result?
    var pageInfo: Info?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getInfo()
        configTableView()
    }
    
    // MARK: - Передача данных на AllInfoViewController с подробной информацией о выбранном персонаже
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "allInfo" else { return }
        guard let destination = segue.destination as? AllInfoViewController else { return }
        destination.result = selectedChar
    }
    
    // MARK: - Кнопки перехода между страницами с персонажами
    @IBAction func nextButton(_ sender: Any) {
        guard let pageInfo = pageInfo else { return }
        ApiManager.shared.baseUrl = pageInfo.next
        getInfo()
    }
    
    @IBAction func prevButton(_ sender: Any) {
        guard let prev = pageInfo?.prev, pageInfo?.prev != nil else { return }
        ApiManager.shared.baseUrl = prev
        getInfo()
    }
    
}
