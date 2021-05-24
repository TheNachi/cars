//
//  ViewController.swift
//  SIXT
//
//  Created by Munachimso Ugorji on 24/05/2021.
//

import UIKit

class SixtViewController: UIViewController {
    @IBOutlet weak var sixtMapView: UIView!
    @IBOutlet weak var sixtTableView: UIView!
    @IBOutlet weak var sixtSegementControl: UISegmentedControl!
    
    private var sixtMapVC: SixtMapViewController?
    private var sixtListVC: SixtListViewController?
    private var viewModel: SixtViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sixtMapView.alpha = 1
        sixtTableView.alpha = 0
        let sixtNetworkService = SixtNetworkService()
        viewModel = SixtViewModel(with: sixtNetworkService)
        self.bindViewModel()
    }

    func bindViewModel() {
        self.title = SixtViewModel.title
        self.viewModel?.delegate = self
        viewModel?.getCars()
    }
    
    @IBAction func segementChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            sixtMapView.alpha = 1
            sixtTableView.alpha = 0
        } else if sender.selectedSegmentIndex == 1 {
            sixtMapView.alpha = 0
            sixtTableView.alpha = 1
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == StringConstants.goToSixtList.rawValue,
           let sixtListVC = segue.destination as? SixtListViewController {
            self.sixtListVC = sixtListVC
        }
        
        if segue.identifier == StringConstants.goToSixtMaps.rawValue,
           let sixtMapVC = segue.destination as? SixtMapViewController {
            self.sixtMapVC = sixtMapVC
            self.sixtMapVC?.delegate = self
        }
    }
}

extension SixtViewController: SixtViewModelDelegate {
    func carsGotten() {
        guard let vModel = self.viewModel else { return }
        DispatchQueue.main.async {
            self.sixtMapVC?.bindViewModel(with: vModel)
            self.sixtMapVC?.sixtListVC = self.sixtListVC
            self.sixtListVC?.bindViewModel(with: vModel)
        }
    }
}

extension SixtViewController: SixtMapVCDelegate {
    func onCarZoomed() {
        self.sixtSegementControl.selectedSegmentIndex = 0
        sixtMapView.alpha = 1
        sixtTableView.alpha = 0
    }
}
