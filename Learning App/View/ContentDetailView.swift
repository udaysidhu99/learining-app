//
//  ContentDetailView.swift
//  Learning App
//
//  Created by Uday Sidhu on 31/01/23.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        let lesson = model.currentLesson
        
        let url = URL(string: Constants.videoBaseUrl + (lesson?.video ?? ""))
        VStack{
            if url != nil{
                VideoPlayer(player: AVPlayer(url: url!))
                
                CodeTextView()
                
                
                if model.hasNextLesson(){
                    Button {
                        model.goNextLesson()
                    } label: {
                        
                        ZStack {
                            RectangleButton(color: .green)
                            Text("Next Lesson: \(model.currentModule!.content.lessons[model.selectedLessonIndex + 1].title)").fontWeight(.heavy).foregroundColor(.white)
                        }
                    }

                }
                else{
                    Button {
                        model.currentContentSelected = nil
                    } label: {
                        
                        ZStack {
                            RectangleButton(color: .green)
                            Text("Completed").fontWeight(.heavy).foregroundColor(.white)
                        }
                    }
                    
                }
                
                
        }
            
            
        }.padding()
            .navigationBarTitle(lesson?.title ?? "")
        
    }
}


