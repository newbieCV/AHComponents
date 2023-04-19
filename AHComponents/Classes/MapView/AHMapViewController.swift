//
//  AHMapViewController.swift
//  AHComponents
//
//  Created by ByteDance on 2023/4/18.
//

import MapKit
import CoreLocation

open class AHMapViewController: AHViewController {
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private lazy var mapView : MKMapView = {
        let map = MKMapView(frame: view.frame)
        map.delegate = self
        map.showsUserLocation = true
        view.addSubview(map)
        return map
    }()
    
    private var annotations = [MKPointAnnotation]()
    private var descArrs : [String]?
    private var isFirstLoadMap = false
}

extension AHMapViewController {
    public func setMapData(coordinates coors : [CLLocationCoordinate2D], descArrs descs: [String]?) {
        descArrs = descs
        addAnnotations(coordinates: coors)
        mapView.addAnnotations(annotations)
    }
    
    private func addAnnotations(coordinates: [CLLocationCoordinate2D]) {
        annotations.removeAll()
        for (idx, coordinate) in coordinates.enumerated() {
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = descArrs?[idx]
            annotations.append(annotation)
        }
    }
}

extension AHMapViewController: MKMapViewDelegate {
    /// 自定义大头针
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isKind(of: MKPointAnnotation.self) {
            let annotationView = AHMapAnnotaionView()
            annotationView.setup(annotation: annotation)
            return annotationView
        }
        return nil
    }
    /// 基于定位位置，在定位回调中进行POI搜索和逆地理编码
    public func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        guard let location = userLocation.location else {
            return
        }
        if location.horizontalAccuracy < 0 {
            return
        }
        if !isFirstLoadMap {
            isFirstLoadMap = true
            mapView.centerCoordinate = location.coordinate
            // 调整地图 zoom level
            let span = MKCoordinateSpanMake(0, 360 / pow(2, 10 * view.frame.width / 256))
            mapView.setRegion(MKCoordinateRegionMake(location.coordinate, span), animated: true)
        }
    }
}
