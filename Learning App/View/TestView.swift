//
//  TestView.swift
//  Learning App
//
//  Created by Uday Sidhu on 04/02/23.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        VStack{
            if model.currentQuestion != nil{
                VStack{
                    Text("Question \(model.selectedLessonIndex + 1) of \(model.currentModule?.test.questions.count ?? 0) ")
                    CodeTextView()
                    
                }.navigationTitle("\(model.currentModule?.category ?? "") Test")
                
            }
            
            else{
                ProgressView()
            }
        }
    }
}

