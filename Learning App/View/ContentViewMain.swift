//
//  ContentViewMain.swift
//  Learning App
//
//  Created by Uday Sidhu on 29/01/23.
//

import SwiftUI

struct ContentViewMain: View {
    @EnvironmentObject var model:ContentModel
    var body: some View {
        ScrollView {
            LazyVStack{
                if model.currentModule != nil{
                    ForEach(0..<model.currentModule!.content.lessons.count){i in
                        
                        NavigationLink {
                            ContentDetailView().onAppear{
                                model.beginLesson(i)
                            }
                        } label: {  
                            ContentViewCard(index: i).accentColor(.black )
                        }

                        
                        
                    }
                }
            }.padding().navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}

