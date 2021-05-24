//
//  SixtCarsTableViewCell.swift
//  SIXT
//
//  Created by Munachimso Ugorji on 24/05/2021.
//

import UIKit

class SixtCarsTableViewCell: UITableViewCell {
    static let identifier = StringConstants.sixtCarsCell.rawValue
    
    @IBOutlet weak var sixtCarImageView: UIImageView!
    @IBOutlet weak var sixtCarMakeLabel: UILabel!
    @IBOutlet weak var sixtCarNameLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
    }
    
    func bindViewModel(with viewModel: SixtCarsCellViewModel) {
        if let url = URL(string: viewModel.carImageUrl) {
            self.sixtCarImageView.load(url: url)
        }
        self.sixtCarMakeLabel.text = viewModel.carMake
        self.sixtCarNameLabel.text = viewModel.carName
    }

}


struct SixtCarsCellViewModel {
    let carImageUrl: String
    let carName: String
    let carMake: String
    
    init(with model: SixtModel) {
        self.carImageUrl = model.carImageUrl
        self.carName = model.name
        self.carMake = model.make + " " + model.modelName
    }
}
