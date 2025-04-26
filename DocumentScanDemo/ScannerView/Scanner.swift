//
//  Scanner.swift
//  DocumentScanDemo
//
//  Created by 佐藤汰一 on 2025/04/26.
//

import SwiftUI
import VisionKit

struct Scanner: UIViewControllerRepresentable {
    
    private let onFinish: (ScanModel) -> Void
    private let onCancel: () -> Void
    private let onError: (Error) -> Void
    
    init(onFinish: @escaping (ScanModel) -> Void,
         onError: @escaping (Error) -> Void,
         onCancel: @escaping () -> Void = {}) {
        
        self.onFinish = onFinish
        self.onCancel = onCancel
        self.onError = onError
    }
    
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let viewController = VNDocumentCameraViewController()
        viewController.delegate = context.coordinator
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {}
    
    func makeCoordinator() -> ScannerCoordinator {
        
        return ScannerCoordinator(onFinish: onFinish, onCancel: onCancel, onError: onError)
    }
}

final class ScannerCoordinator: NSObject, VNDocumentCameraViewControllerDelegate {
    
    private let onFinish: (ScanModel) -> Void
    private let onCancel: () -> Void
    private let onError: (Error) -> Void
    
    init(onFinish: @escaping (ScanModel) -> Void,
         onCancel: @escaping () -> Void,
         onError: @escaping (Error) -> Void) {
        
        self.onFinish = onFinish
        self.onCancel = onCancel
        self.onError = onError
    }
    
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        onCancel()
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        var images: [UIImage] = []
        for page in 0..<scan.pageCount {
            images.append(scan.imageOfPage(at: page))
        }
        
        let scanModel = ScanModel(title: scan.title, images: images)
        onFinish(scanModel)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: any Error) {
        onError(error)
    }
}
