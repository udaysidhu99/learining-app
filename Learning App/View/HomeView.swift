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
                        ForEach(model.modules){ module in
                            VStack(spacing: 20){
                                NavigationLink(
                                    destination:
                                        ContentViewMain()
                                        .onAppear(perform: {
                                            model.beginModule(module.id)
                                            print("func 1 active")
                                        }),
                                    tag: module.id,
                                    selection: $model.currentContentSelected){
                                        // Learning Card
                                        HomeViewCard(image: module.content.image, title: "Learn \(module.category)", descirption: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                        
                                    }
                                NavigationLink(destination:TestView().onAppear(perform: {
                                    model.beginTest(module.id)
                                    print("func 2 active")
                                }),
                                               tag: module.id,
                                               selection: $model.currentTestSelected){
                                    HomeViewCard(image: module.test.image, title:"\(module.category) Test" , descirption:module.test.description, count: "\(module.test.questions.count) Questions", time: module.test.time)
                                }
                                
                            }
                            
                        }
                    }
                }
                .padding()
            }.navigationTitle("Get Started")
        }.navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let model = ContentModel()
        HomeView().environmentObject(model)
    }
}
