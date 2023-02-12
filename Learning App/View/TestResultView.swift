//
//  TestResultView.swift
//  Learning App
//
//  Created by Uday Sidhu on 09/02/23.
//

import SwiftUI

struct TestResultView: View {
    @EnvironmentObject var model:ContentModel
    var score: Int
    var numberOfQuestions: Int
    var body: some View {
        VStack {
            Text("Test Score")
                .font(.title)
            Text("You Scored \(score) out of \(numberOfQuestions)").bold()
            Spacer()
            Button {
                model.currentTestSelected = nil
            } label: {
                ZStack{
                    RectangleButton(color: .green)
                    Text("Complete").fontWeight(.bold).accentColor(.white)
                    
                }.padding()
                
            }
            
        }
    }
}

