//
//  ViewController.swift
//  maps1
//
//  Created by STC on 12/11/22.

import UIKit
import GoogleMaps
import SDWebImage
class ViewController: UIViewController{
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var imageView1: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        addCameraSettingOnMap()
        addMarkerOnMap(position: CLLocationCoordinate2D(latitude: 19.551146, longitude: 74.928162))
        mapView.mapType = .normal
       drawCircle()
        drawPolygon()
        drawRectangle()
        let image = NSURL(string:"https://robohash.org/nequeodiosapiente.png")
        imageView1.sd_setImage(with: image as URL?)
        
    }
    func addCameraSettingOnMap(){
        let camera = GMSCameraPosition(latitude: 19.551146, longitude:74.928162, zoom: 4.0)
        mapView.camera = camera
        mapView.settings.zoomGestures = true
        mapView.settings.tiltGestures = true
        mapView.settings.rotateGestures = true
        mapView.settings.scrollGestures = true
        mapView.settings.myLocationButton = true
    }

    func addMarkerOnMap(position : CLLocationCoordinate2D){
    let marker = GMSMarker()
        marker.position = position
        marker.title = "newasa"
        marker.snippet = "this is newasa"
        marker.map = mapView
        marker.isDraggable = true
       
        
    }
}
extension ViewController :GMSMapViewDelegate{
    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
        print("didBegin Called\(marker.position)")
    }
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
       
        let view = UIView(frame : CGRect(x: 0, y: 0, width: 200, height: 100))
        view.backgroundColor = UIColor.magenta
        view.alpha = 0.3
        view.layer.cornerRadius = 4
        let  label = UILabel(frame: CGRect(x: 10, y: 10, width: view.frame.width - 15, height: 30))
        label.text = "sihgad fort"
        label.alpha = 1.0
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .yellow
        view.addSubview(label)
        let label2 = UILabel(frame: CGRect(x: 10, y: 60, width: view.frame.width  - 15, height: 30))
        label2.text = "pune"
        label2.textColor = .black
        label2.backgroundColor = .white
        label2.textAlignment = .center
        label2.alpha = 0.9
        view.addSubview(label2)
        return view
       
    }
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("did drag called\(marker.position)")
    }
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        print("did called \(marker.position)")
    }
   func drawCircle()
    {
        let circleCenter = CLLocationCoordinate2D(latitude: 19.551146, longitude: 74.928162)
        let cir = GMSCircle(position: circleCenter, radius: 2000)
        cir.map = mapView
        cir.fillColor  = .green
        cir.strokeColor = .red
        cir.strokeWidth = 5
    }
    func drawPolygon(){
        let poly = GMSMutablePath()
        poly.add(CLLocationCoordinate2D(latitude: 19.07, longitude: 72.87))
        poly.add(CLLocationCoordinate2D(latitude: 18.17, longitude: 74.60))
        poly.add(CLLocationCoordinate2D(latitude: 19.87, longitude: 75.34))
        poly.add(CLLocationCoordinate2D(latitude: 19.99, longitude: 73.78))
        let polygon = GMSPolygon(path: poly)
        polygon.fillColor = UIColor(red: 0.25, green: 0, blue: 0.0, alpha: 0.8)
        polygon.strokeWidth = 5
        polygon.strokeColor = UIColor.red
    polygon.map = mapView
        
    }
    func drawRectangle(){
        let rect = GMSMutablePath()
        rect.add(CLLocationCoordinate2D(latitude: 20.65, longitude: 75.34))
        rect.add(CLLocationCoordinate2D(latitude: 21.00, longitude: 75.56))
        rect.add(CLLocationCoordinate2D(latitude: 20.52, longitude: 76.18))
        rect.add(CLLocationCoordinate2D(latitude: 20.30, longitude: 75.65))
        rect.add(CLLocationCoordinate2D(latitude: 20.65, longitude: 75.34))
        let rectangle = GMSPolyline(path: rect)
        rectangle.strokeColor = .blue
        rectangle.strokeWidth = 10
        rectangle.title = "polyline drawing"
        rectangle.map = mapView
    }
}
