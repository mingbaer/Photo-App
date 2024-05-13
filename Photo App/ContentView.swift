//
//  ContentView.swift
//  Photo App
//
//  Created by Alexandra Baer Chan on 5/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isImagePickerShowing = false
    @State var selectedImage: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary

    var body: some View {
        
        VStack {
            
            Image(uiImage: selectedImage ?? UIImage(named: "camera")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                Button("Select a Photo") {
                    self.sourceType = .photoLibrary
                    isImagePickerShowing = true
                }
                .padding()
                Button("Take a Photo") {
                    self.sourceType = .camera
                    isImagePickerShowing = true
                }
                .padding()
            }
          
        }
        .sheet(isPresented: $isImagePickerShowing) {
            ImagePicker(selectedImage: $selectedImage, isImagePickerShowing: $isImagePickerShowing, sourceType: self.sourceType)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
