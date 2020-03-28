//
//  TranslateViewController.swift
//  SkyEngTask
//
//  Created by Mihail on 28.03.2020.
//  Copyright © 2020 Mihail. All rights reserved.
//

import UIKit

protocol TranslateView: AnyObject {
    
    func displayCells(_ cellModels: [WordCellViewModel])
}

final class TranslateViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: TranslatePresenter!
    
    private var cellModels: [WordCellViewModel] = []
    private var refreshContol
    
}

// MARK: - TranslateView

extension TranslateViewController: TranslateView {
    
    func displayCells(_ cellModels: [WordCellViewModel]) {
        self.cellModels = cellModels
        
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension TranslateViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellModel = cellModels[safe: indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell: WordTableViewCell = tableView.dequeueReusableCell()
        cell.configure(with: cellModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }
}

// MARK: - Private

private extension TranslateViewController {
    
    func setupViews() {
        
    }
}
