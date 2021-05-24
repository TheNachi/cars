//
//  SixtViewModel.swift
//  SIXT
//
//  Created by Munachimso Ugorji on 24/05/2021.
//

import Foundation
import Mapbox

class SixtViewModel {
    static let title = StringConstants.sixtTitle.rawValue
    static let inset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
    weak var delegate: SixtViewModelDelegate?
    private var carsList: [SixtModel] = []
    private var sixtNetworkService: SixtNetworkService?
    private var annotationList: [MGLPointAnnotation] = []
    
    init(with sixtService: SixtNetworkService?) {
        self.sixtNetworkService = sixtService
        self.sixtNetworkService?.delegate = self
    }
    
    public func getCars() {
        guard let sixtNetworkService = self.sixtNetworkService else { return }
        sixtNetworkService.getCars()
    }
    
    public func updateCars(with response: [SixtModel]) {
        self.carsList = response
    }
    
    public func getCarsCount() -> Int {
        return self.carsList.count
    }
    
    public func getCar(index: Int) -> SixtModel {
        return self.carsList[index]
    }
    
    private func createAnnotation(from model: SixtModel) -> MGLPointAnnotation {
        let annotation = MGLPointAnnotation()
        annotation.coordinate = model.coordinates
        annotation.accessibilityHint = model.carImageUrl
        return annotation
    }
    
    public func setAnnotation(from cars: [SixtModel]) {
        cars.forEach { (car) in
            let annotation = self.createAnnotation(from: car)
            self.annotationList.append(annotation)
        }
    }
    
    public func getAnnotations() -> [MGLPointAnnotation] {
        return self.annotationList
    }
    
    public func getCoordinates() -> [CLLocationCoordinate2D] {
        let coordinates = self.annotationList.map { (annotation) -> CLLocationCoordinate2D in
            return annotation.coordinate
        }
        return coordinates
    }
    
    public func getSixtCarsCellViewModel(index: Int) -> SixtCarsCellViewModel {
        SixtCarsCellViewModel(with: self.getCar(index: index))
    }
}

extension SixtViewModel: SixtNetworkServiceDelegate {
    func onGetCars(cars: [SixtModel]) {
        self.updateCars(with: cars)
        self.setAnnotation(from: cars)
        self.delegate?.carsGotten()
    }
}

protocol SixtViewModelDelegate: class {
    func carsGotten()
}
