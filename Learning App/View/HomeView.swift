//
//  ContentView.swift
//  Learning App
//
//  Created by Uday Sidhu on 27/01/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Text("What are we learning today?").padding(.leading, 20)
                ScrollView{
                    LazyVStack{
                        ForEach(model.modules){ i in
                            VStack(spacing: 20){
                                
                                HomeViewCard(image: i.content.image, title:"Learn \(i.category)" , descirption:i.content.description, count: "\(i.content.lessons.count) Lessons", time: i.content.time)
                                
                                HomeViewCard(image: i.test.image, title:"\(i.category) Test" , descirption:i.test.description, count: "\(i.test.questions.count) Questions", time: i.test.time)
                            }
                            
                        }
                    }
                }
                .padding()
            }.navigationTitle("Get Started")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let model = ContentModel()
        HomeView().environmentObject(model)
    }
}
