import Foundation
import SwiftUI


struct MapView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> MapViewController {
        let controller  = MapViewController()
        return controller
    }
    
    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = MapViewController
}
