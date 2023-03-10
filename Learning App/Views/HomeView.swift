//
//  ContentView.swift
//  Learning App
//
//  Created by Howard Thomas on 2/12/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment:.leading){
                
                
                Text("What do you want to do today")
                    .padding(.leading,20)
                ScrollView{
                    
                    LazyVStack{
                        
                        ForEach(model.modules){module in
                            
                            VStack(spacing:20){
                                // Learning Card
                                
                                NavigationLink(destination: ContentView().onAppear(perform:{model.beginModule(module.id)}), label: { HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description,count:"\(module.content.lessons.count) Lessons" , time: module.content.time)})
                                
                                // Test Card
                                HomeViewRow(image: module.test.image, title: "Learn \(module.category) Test", description: module.test.description, count:"\(module.test.questions.count) Questions" , time: module.test.time)
                            }
                        }
                    }
                    .padding()
                    .accentColor(.black)
                }
            }
            .navigationTitle("Get Started")
        }.navigationViewStyle(.stack)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
