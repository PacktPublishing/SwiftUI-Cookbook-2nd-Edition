//
//  ContentView.swift
//  SwiftUICoreLocation
//
//  Created by Giordano Scalzo on 25/07/2021.
//

import SwiftUI
import CoreLocation

extension Optional where Wrapped == CLLocation {
    var latitudeDescription: String {
        guard let self = self else {
            return "-"
        }
        return "\(self.coordinate.latitude)"
    }
    
    var longitudeDescription: String {
        guard let self = self else {
            return "-"
        }
        return "\(self.coordinate.longitude)"
    }
}

extension Optional where Wrapped == CLAuthorizationStatus {
    var description: String {
        guard let self = self else {
            return "unknown"
        }
        
        switch self {
        case .notDetermined:
            return "notDetermined"
        case .authorizedWhenInUse:
            return "authorizedWhenInUse"
        case .authorizedAlways:
            return "authorizedAlways"
        case .restricted:
            return "restricted"
        case .denied:
            return "denied"
        @unknown default:
            return "unknown"
        }
    }
}

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    
    @Published
    var status: CLAuthorizationStatus?
    
    @Published
    var current: CLLocation?

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.distanceFilter = 10
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        status = manager.authorizationStatus
    }

    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.current = location
    }
}

struct ContentView: View {
    @ObservedObject
    private var locationManager = LocationManager()

    var body: some View {
        VStack {
            Text("Status: \(locationManager.status.description)")
            HStack {
                Text("Latitude: \(locationManager.current.latitudeDescription)")
                Text("Longitude: \(locationManager.current.longitudeDescription)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
