//
//  TranslateViewController.swift
//  SkyEngTask
//
//  Created by Mikhail on 28.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

import UIKit

protocol TranslateView: AnyObject {
    
    func displayCells(_ cellModels: [WordCellViewModel])
    func displayError()
    func endLoading()
}

final class TranslateViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var presenter: TranslatePresenter!
    
    private var cellModels: [WordCellViewModel] = []
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
}

// MARK: - TranslateView

extension TranslateViewController: TranslateView {
    
    func displayCells(_ cellModels: [WordCellViewModel]) {
        self.cellModels = cellModels
        
        tableView.reloadData()
    }
    
    func displayError() {
        let alert = UIAlertController(title: "Ошибка", message: "Не удалось загрузить перевод", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func endLoading() {
        refreshControl.endRefreshing()
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

// MARK: - UITableViewDelegate

extension TranslateViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.selectWord(at: indexPath.row)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let isLastCell = indexPath.row == cellModels.count - 1
        if isLastCell {
            presenter.loadMore(text: searchBar.text ?? "")
        }
    }
}

// MARK: - SearchBarDelegate

extension TranslateViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.perform(#selector(refresh), with: nil, afterDelay: 0.5)
    }
}

// MARK: - Private

private extension TranslateViewController {
    
    func setupViews() {
        tableView.register(cellType: WordTableViewCell.self)
        
        tableView.backgroundView = refreshControl
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    @objc
    func refresh() {
        let text = searchBar.text ?? ""
        presenter.refresh(text: text)
    }
}
