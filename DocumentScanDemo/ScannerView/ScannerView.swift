//
//  ScannerView.swift
//  DocumentScanDemo
//
//  Created by 佐藤汰一 on 2025/04/26.
//

import SwiftUI

struct ScannerView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var scanModel: ScanModel?
    
    var body: some View {
        Scanner { model in
            print("title: \(model.title)")
            scanModel = model
        } onError: { error in
            print("onError: \(error)")
            dismiss()
        } onCancel: {
            print("onCancel")
            dismiss()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .fullScreenCover(item: $scanModel) { model in
            ScanImagePreviewView(previewImage: model.images.first!)
        }
    }
}
