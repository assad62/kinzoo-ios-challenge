//
//  File.swift
//  Kinzoo-iOS-Challenge
//
//  Created by Development on 31/10/2023.
//

import Network
import Combine

//NOTE: Not implemented
final class NetworkMonitor {

    static let shared = NetworkMonitor()
    let queue = DispatchQueue(label: "NetworkMonitor")
    let monitor = NWPathMonitor()
    @Published public private(set) var isConnected: Bool = false
    private var hasStatus: Bool = false
    
    init() {
        monitor.pathUpdateHandler = { path in
            #if targetEnvironment(simulator)
                if (!self.hasStatus) {
                    self.isConnected = path.status == .satisfied
                    self.hasStatus = true
                } else {
                    self.isConnected = !self.isConnected
                }
            #else
                self.isConnected = path.status == .satisfied
            #endif
            print("isConnected: " + String(self.isConnected))
        }
        monitor.start(queue: queue)
    }

}











//import Foundation
//import Network
//import Combine
//
//protocol NetworkPathMonitorProtocol {
//    func start(queue: DispatchQueue)
//    var currentPath: NWPath { get }
//    var pathUpdateHandler: ((_ newPath: NWPath) -> Void)? { get }
//}
//
//extension NWPathMonitor: NetworkPathMonitorProtocol {}
//
//
//public struct NetworkPath {
//    public var status: NWPath.Status
//    
//    public init(status: NWPath.Status) {
//        self.status = status
//    }
//}
//
//extension NetworkPath {
//    public init(rawValue: NWPath) {
//        self.status = rawValue.status
//    }
//}
//
//extension NetworkPath: Equatable {}
//
//
//protocol PathCreationProtocol {
//    var networkPathPublisher: AnyPublisher<NetworkPath, Never>? { get }
//    func start()
//}
//
//final class PathCreation: PathCreationProtocol {
//    public var networkPathPublisher: AnyPublisher<NetworkPath, Never>?
//    private let subject = PassthroughSubject<NWPath, Never>()
//    private let monitor = NWPathMonitor()
//    
//    func start() {
//        monitor.pathUpdateHandler = subject.send
//        networkPathPublisher = subject
//            .handleEvents(
//                receiveSubscription: { _ in self.monitor.start(queue: .main) },
//                receiveCancel: monitor.cancel
//            )
//            .map(NetworkPath.init(rawValue:))
//            .eraseToAnyPublisher()
//    }
//}
//
//
//final class NetworkPathMonitor {
//    var isConnectedSubject = PassthroughSubject<Bool, Never>()
//    
//    private var pathUpdateCancellable: AnyCancellable?
//    let paths: PathCreationProtocol
//    init(
//        paths: PathCreationProtocol = PathCreation()
//    ) {
//        self.paths = paths
//        paths.start()
//        self.pathUpdateCancellable = paths.networkPathPublisher?
//            .sink(receiveValue: { [weak self] isConnected in
//                
//                switch isConnected.status {
//                  case .satisfied:
//                    self?.isConnectedSubject.send(true)
//                  default:
//                    self?.isConnectedSubject.send(false)
//                }
//                
//               
//            })
//    }
//}
