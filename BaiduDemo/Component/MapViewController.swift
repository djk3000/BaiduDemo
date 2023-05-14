import Foundation

class MapViewController: UIViewController, BMKMapViewDelegate, BMKLocationManagerDelegate {
    var mapView: BMKMapView?
    var locationManager: BMKLocationManager?
    var userLocation: BMKUserLocation?
    
    override func viewDidLoad() {
        userLocation = BMKUserLocation()
        mapView = BMKMapView(frame: self.view.bounds)
        mapView?.delegate = self
        mapView?.zoomLevel = 17
        
        //显示定位
        mapView?.showsUserLocation = true
        mapView?.userTrackingMode = BMKUserTrackingModeFollow
        
        showLocation()
        
        setAnnotation()
        
        self.view.addSubview(mapView!);
    }
    
    func showLocation() {
        locationManager = BMKLocationManager()
        //设置delegate
        locationManager?.delegate = self
        //设置距离过滤参数
        locationManager?.distanceFilter = kCLDistanceFilterNone
        //设置返回位置的坐标系类型
        locationManager?.coordinateType = BMKLocationCoordinateType.BMK09LL
        //设置预期精度参数
        locationManager?.desiredAccuracy = kCLLocationAccuracyHundredMeters
        //设置应用位置类型
        locationManager?.activityType = CLActivityType.automotiveNavigation
        //设置是否自动停止位置更新
        locationManager?.pausesLocationUpdatesAutomatically = false
        //设置是否允许后台定位
        locationManager?.allowsBackgroundLocationUpdates = false
        //设置位置获取超时时间
        locationManager?.locationTimeout = 10
        //设置获取地址信息超时时间
        locationManager?.reGeocodeTimeout = 10
        
        locationManager?.startUpdatingLocation()
    }
    
    func setAnnotation() {
        let annotation = BMKPointAnnotation.init()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 31.170503, longitude: 121.402091)
        //设置标注的标题
        annotation.title = "宝石园"
        //副标题
        annotation.subtitle = "20号楼宝石大楼"
        mapView?.addAnnotation(annotation)
    }
    
    func bmkLocationManager(_ manager: BMKLocationManager, didUpdate location: BMKLocation?, orError error: Error?) {
        if let error = error {
            print("返回定位错误----\(error.localizedDescription)")
        }
        if let location = location {
            
            userLocation?.location = location.location
            mapView?.updateLocationData(userLocation)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mapView?.viewWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mapView?.viewWillDisappear()
    }
}
