//
//  ContentView.swift
//  DocumentScanDemo
//
//  Created by 佐藤汰一 on 2025/04/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var isShowScanner: Bool = false
    
    var body: some View {
        VStack {
            Button {
                isShowScanner.toggle()
            } label: {
                HStack {
                    Image(systemName: "camera")
                    Text("Scan")
                }
            }
        }
        .padding()
        .sheet(isPresented: $isShowScanner) {
            ScannerView()
        }
    }
}

#Preview {
    ContentView()
}
