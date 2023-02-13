//
//  ContentView.swift
//  Learning App
//
//  Created by Howard Thomas on 2/13/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView{
            
            LazyVStack{
                // Confirm that currentModule is set
                if model.currentModule != nil {
                    
                    ForEach(0..<model.currentModule!.content.lessons.count){ index in
                        
                        NavigationLink(destination:
                                        ContentDetailView()
                            .onAppear(perform: {model.beginLesson(index)}), label: {
                                ContentViewRow(index: index)
                            })
                        
                        
                    }
                }
                
            }
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? " ")")
            
        }
    }
}


