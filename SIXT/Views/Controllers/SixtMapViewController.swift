//
//  SixtMapViewController.swift
//  SIXT
//
//  Created by Munachimso Ugorji on 24/05/2021.
//

import UIKit
import Mapbox

class SixtMapViewController: UIViewController {
    public var viewModel: SixtViewModel?
    @IBOutlet weak var sixtMapView: MGLMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sixtMapView.delegate = self
        sixtMapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func bindViewModel(with viewModel: SixtViewModel) {
        self.viewModel = viewModel
        DispatchQueue.main.async {
            self.sixtMapView.addAnnotations(viewModel.getAnnotations())
            self.sixtMapView.setVisibleCoordinates(viewModel.getCoordinates(),
                                                   count: UInt(viewModel.getCoordinates().count),
                                                   edgePadding: SixtViewModel.inset,
                                                   animated: true)
            self.sixtMapView.automaticallyAdjustsContentInset = true
        }
    }
}

extension SixtMapViewController: MGLMapViewDelegate {
    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
        guard let annotation = annotation as? MGLPointAnnotation,
              let imageUrl = annotation.accessibilityHint else { return nil}
        let coordinate = annotation.coordinate
        let reuseIdentifier = "\(coordinate.latitude.hashValue)\(coordinate.longitude.hashValue)"
        guard let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier) else {
            let view = MapMarkerAnnotationView(reuseIdentifier: reuseIdentifier, imageUrl: imageUrl)
            view.bounds = CGRect(x: 0, y: 0, width: 50, height: 50)
            return view
        }
        return annotationView
    }
    
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }
}
