//
//  HomeViewRow.swift
//  Learning App
//
//  Created by Howard Thomas on 2/13/23.
//

import SwiftUI

struct HomeViewRow: View {
    
    var image: String
    var title: String
    var description: String
    var count: String
    var time: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 10)
                .aspectRatio(CGSize(width: 335, height: 175),contentMode: .fit)
            
            HStack{
                
                //Image
                Image(image)
                    .resizable()
                    .frame(width: 116,height: 116)
                    .clipShape(Circle())
                
                Spacer()
                
                // Text
                VStack(alignment:.leading, spacing: 10){
                    
                    // Headline
                    Text(title)
                        .bold()
                    
                    // Description
                    Text(description)
                        .padding(.bottom,20)
                        .font(.caption)
                    
                    // Icons
                    HStack{
                        
                        // Number of lessons
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width:15,height: 15)
                        Text(count)
                            .font(.caption)
                        
                        // Time
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width:15,height: 15)
                        Text(time)
                            .font(.caption)
                    }
                }
            }
            .padding(.horizontal,20)
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "swift", title: "Learn Swift", description: "Some Description", count: "10 Lessons", time: "2 Hours")
    }
}
