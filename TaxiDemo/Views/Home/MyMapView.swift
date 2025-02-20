//
//  MyMapView.swift
//  TaxiDriver
//
//  Created by Iurii Evteev on 10/31/24.
//

import Foundation
import SwiftUI
import MapKit

struct MyMapView: UIViewRepresentable {
   
    @Binding var requestLocation: CLLocationCoordinate2D
    @Binding var destinationLocation: CLLocationCoordinate2D
    var  bottomPadding:Double = 300.0
    
    private let mapView = WrappableMapView()
    
    func makeUIView(context: UIViewRepresentableContext<MyMapView>) -> WrappableMapView {
        mapView.delegate = mapView
        return mapView
    }
    
    func updateUIView(_ uiView: WrappableMapView, context: UIViewRepresentableContext<MyMapView>) {
        
        // Draw Pickup Pin
        let requestAnnotation = MKPointAnnotation()
        requestAnnotation.coordinate = requestLocation
        requestAnnotation.title = "pickup"
        uiView.addAnnotation(requestAnnotation)
        
        // Draw DropOFF Pin
        let destinationAnnotation = MKPointAnnotation()
        destinationAnnotation.coordinate = destinationLocation
        destinationAnnotation.title = "dropoff"
        uiView.addAnnotation(destinationAnnotation)
        
        // Draw path
        let requestPlacemark = MKPlacemark(coordinate: requestLocation)
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = MKMapItem(placemark: requestPlacemark)
        directionRequest.destination = MKMapItem(placemark: destinationPlacemark)
        directionRequest.transportType = .automobile
        
        let direction = MKDirections(request: directionRequest)
        direction.calculate { response, error in
            guard let response = response else { return }
            let route = response.routes[0]
            uiView.addOverlay(route.polyline, level: .aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            uiView.setRegion(MKCoordinateRegion(rect), animated: true)
            
            uiView.setVisibleMapRect(rect, edgePadding: .init(top: 10.0, left: 50.0, bottom: bottomPadding, right: 50.0), animated: true)
        }
    }
    
    func setMapRegion(_ region: CLLocationCoordinate2D) {
        mapView.region = MKCoordinateRegion(center: region, latitudinalMeters: 60000, longitudinalMeters: 60000)
    }
}

class WrappableMapView: MKMapView, MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = Color.primaryText.uiColor()
        renderer.lineWidth = 4.0
        return renderer
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
        } else {
            annotationView?.annotation = annotation
        }
        
        switch annotation.title {
        case "pickup":
            annotationView?.image = UIImage(named: "pickup_pin")?.resized(to: CGSize(width: 35, height: 35))
        case "dropoff":
            annotationView?.image = UIImage(named: "drop_pin")?.resized(to: CGSize(width: 35, height: 35))
        default:
            break
        }
        return annotationView
    }
}

// UIImage Extension
extension UIImage {
    func resized(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        draw(in: CGRect(origin: .zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}

