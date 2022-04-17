//
//  ViewController+DataSource.swift
//  RickAndMorty
//
//  Created by Egor Efimenko on 15.04.2022.
//

import UIKit

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        cell.configure(result: result[indexPath.row])
        return cell
    }
    
    func configTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil),
                           forCellReuseIdentifier: cell)
    }
    
    func getInfo() {
        ApiManager.shared.getInfo { [weak self] model in
            self?.result = model.results
            self?.pageInfo = model.info
        }
    }
}
