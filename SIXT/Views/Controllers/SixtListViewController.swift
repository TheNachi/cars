//
//  SixtTableViewController.swift
//  SIXT
//
//  Created by Munachimso Ugorji on 24/05/2021.
//

import UIKit

class SixtListViewController: UIViewController {
    @IBOutlet weak var sixtTableView: UITableView!
    public var viewModel: SixtViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sixtTableView.delegate = self
        self.sixtTableView.dataSource = self
        self.sixtTableView.tableFooterView = UIView()
    }
    
    func bindViewModel(with viewModel: SixtViewModel) {
        self.viewModel = viewModel
        DispatchQueue.main.async {
            self.sixtTableView.reloadData()
        }
    }
}

extension SixtListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let vModel = self.viewModel else { return 0}
        return vModel.getCarsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let vModel = viewModel else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: SixtCarsTableViewCell.identifier, for: indexPath)
        
        if let sixtCarCell = cell as? SixtCarsTableViewCell {
            sixtCarCell.bindViewModel(with: vModel.getSixtCarsCellViewModel(index: indexPath.row))
            return sixtCarCell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
}
