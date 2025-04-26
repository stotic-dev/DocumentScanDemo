//
//  ScanImagePreviewView.swift
//  DocumentScanDemo
//
//  Created by 佐藤汰一 on 2025/04/26.
//

import SwiftUI

struct ScanImagePreviewView: View {
    
    @Environment(\.dismiss) var dismiss
    let previewImage: UIImage
    
    var body: some View {
        VStack(spacing: .zero) {
            Text("Preview")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, 4)
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(8)
                }
                Spacer()
            }
            .backgroundStyle(.gray)
            .padding(.horizontal, 16)
            Image(uiImage: previewImage)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(contentMode: .fit)
        }
    }
}
