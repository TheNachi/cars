//
//  MapMarkerView.swift
//  SIXT
//
//  Created by Munachimso Ugorji on 24/05/2021.
//

import UIKit
import Mapbox

class MapMarkerAnnotationView: MGLAnnotationView {
    @IBOutlet weak var carImageView: UIImageView!
    
    var imageUrl: String?
    
    required init(reuseIdentifier: String?, imageUrl: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.imageUrl = imageUrl
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("MapMarkerView", owner: self, options: nil)
        addSubview(self.carImageView)
        self.carImageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        if let imageUrl = self.imageUrl, let url = URL(string: imageUrl) {
            self.carImageView.load(url: url)
        }
    }
}
