//
//  HomeViewCard.swift
//  Learning App
//
//  Created by Uday Sidhu on 28/01/23.
//

import SwiftUI

struct HomeViewCard: View {
    var image: String
    var title: String
    var descirption: String
    var count: String
    var time: String
    var body: some View {
            ZStack{            Rectangle().foregroundColor(.white).cornerRadius(10).shadow(radius: 10).aspectRatio(CGSize(width: 335, height: 175),contentMode: .fit).padding(.horizontal)
                
                HStack {
                    Image(image).resizable().frame(width:116, height: 116).clipShape(Circle()).padding(.leading,25)
                    VStack(alignment: .leading){
                        Text(title)
                            .font(.title2)
                            .fontWeight(.semibold).padding(.bottom, 2.0)
                        Text(descirption).multilineTextAlignment(.leading).padding(.trailing,20).font(.system(size: 15))
                        HStack{
                            Image(systemName: "text.book.closed").resizable().frame(width: 15, height: 15)
                            Text(count)
                                .font(.system(size: 11))
                            Image(systemName: "clock")
                            Text(time)
                                .font(.system(size: 11))
                            
                        }.padding(.trailing,25)
                    
                    }.foregroundColor(.black)
                }
                
            }
        
        
    }
}


struct HomeViewCard_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewCard(image: "swift", title:"Learn Swift", descirption: "some description this is a significantly longer description to test out how the view looks", count: "10 Questions", time: "10 Minutes")
    }
}
