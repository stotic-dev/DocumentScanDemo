//
//  ScanModel.swift
//  DocumentScanDemo
//
//  Created by 佐藤汰一 on 2025/04/26.
//

import UIKit

struct ScanModel: Identifiable {
    var id: String { title }
    let title: String
    let images: [UIImage]
}
