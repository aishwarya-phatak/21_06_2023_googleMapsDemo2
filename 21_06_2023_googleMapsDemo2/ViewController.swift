//
//  ViewController.swift
//  21_06_2023_googleMapsDemo2
//
//  Created by Vishal Jagtap on 11/08/23.
//

import UIKit
import GoogleMaps
class ViewController: UIViewController {
    @IBOutlet weak var googleMapView: GMSMapView!
    var bitcodePosition : CLLocationCoordinate2D?
    var shaniwarWadaPosition : CLLocationCoordinate2D?
    var marker : GMSMarker = GMSMarker()
    var infoWindow : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializationOMapView()
        
      let cameraPosition =  GMSCameraPosition(
        latitude: 18.5092,
        longitude: 73.8325,
        zoom: 20.0)
        googleMapView.camera = cameraPosition
        bitcodePosition = CLLocationCoordinate2D(
            latitude: 18.5092,
            longitude: 73.8325)
        
//        18.5195° N, 73.8553° E
        shaniwarWadaPosition = CLLocationCoordinate2D(latitude: 18.5195,
                                   longitude: 73.8553)
        GMSCameraUpdate.setTarget(bitcodePosition!, zoom: 50.0)
        showMyMarker(position : bitcodePosition!)
    }
    
    func showMyMarker(position : CLLocationCoordinate2D){
        marker.title = "Bitcode Marker"
        marker.isDraggable = true
        marker.rotation = 40.0
        marker.snippet = "IT Training"
        marker.position = position
        marker.zIndex = 10
//        marker.icon = UIImage(named: "bitcode_logo")
        marker.map = googleMapView
    }
    
    func initializationOMapView(){
        googleMapView.settings.myLocationButton = true
        googleMapView.settings.rotateGestures = true
        googleMapView.settings.scrollGestures = true
        googleMapView.settings.tiltGestures = true
        googleMapView.settings.zoomGestures = true
        googleMapView.settings.compassButton = true
        googleMapView.mapType = GMSMapViewType.normal
        googleMapView.indoorDisplay
        googleMapView.isTrafficEnabled = true
        googleMapView.isBuildingsEnabled = true
        googleMapView.isMyLocationEnabled = true
    }
}


extension ViewController:GMSMapViewDelegate{
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("\(marker.position.latitude) -- \(marker.position.longitude)")
    }
    
    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
        print("Start point of dragging \(marker.position.latitude) -- \(marker.position.longitude)")
    }
    
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        print("End point of dragging \(marker.position.latitude) -- \(marker.position.longitude)")
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
       infoWindow = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        let labelOne = UILabel(frame: CGRect(x: 20, y: 20, width: infoWindow!.frame.width - 20, height: 40))
        labelOne.backgroundColor = UIColor(cgColor: CGColor(red: 50.0, green: 0.0, blue: 50.0, alpha: 6.0))
        labelOne.text = "Bitcode tech"
        labelOne.textColor = .black
        infoWindow!.addSubview(labelOne)
        
        let labelTwo = UILabel(frame: CGRect(x: Int(labelOne.frame.minX), y: Int(labelOne.frame.height) + 20, width: Int(labelOne.frame.width), height: Int(labelOne.frame.height)))
        labelTwo.textColor = .black
        labelTwo.text = "IT Training"
        labelTwo.backgroundColor = .cyan
        infoWindow!.addSubview(labelTwo)
        
        return infoWindow
    }
}
