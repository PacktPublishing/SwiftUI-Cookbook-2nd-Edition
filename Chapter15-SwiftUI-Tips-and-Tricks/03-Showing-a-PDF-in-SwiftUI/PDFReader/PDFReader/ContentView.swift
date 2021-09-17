//
//  ContentView.swift
//  PDFReader
//
//  Created by Giordano Scalzo on 15/09/2021.
//

import SwiftUI
import PDFKit

struct PDFKitView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: UIViewRepresentableContext<PDFKitView>)
        -> PDFView {
            let pdfView = PDFView()
            pdfView.document = PDFDocument(url: self.url)
            return pdfView
    }
    
    func updateUIView(_ uiView: PDFView,
                      context: UIViewRepresentableContext<PDFKitView>) {
    }
}

struct ContentView: View {
    let documentURL = Bundle.main.url(forResource: "PDFBook",
                                      withExtension: "pdf")!
    var body: some View {
        VStack(alignment: .leading) {
            Text("The Waking Lights")
                .font(.largeTitle)
            Text("By Urna Semper")
                .font(.title)
            PDFKitView(url: documentURL)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
