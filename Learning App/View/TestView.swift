//
//  TestView.swift
//  Learning App
//
//  Created by Uday Sidhu on 04/02/23.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var model: ContentModel
    @State var selectedAnswerIndex = -1
    @State var numCorrect = 0
    @State var isSubmitted = false
    @State var questionNumber = 1
    var body: some View {
        VStack{
            if model.currentQuestion != nil{
                VStack(alignment:.leading){
                    Text("Question \(questionNumber) of \(model.currentModule?.test.questions.count ?? 0) ")
                    CodeTextView()
                    
                    ScrollView{
                        ForEach (0..<model.currentQuestion!.answers.count, id: \.self){ i in
                            ZStack{
                                
                                Button {
                                    selectedAnswerIndex = i
                                } label: {
                                    
                                    ZStack {
                                        if isSubmitted == false{
                                            RectangleButton(color: i == selectedAnswerIndex ? .gray : .white).padding(.horizontal, 3)
                                        }
                                        
                                        else if isSubmitted == true && selectedAnswerIndex == model.currentQuestion?.correctIndex{
                                            RectangleButton(color: i == selectedAnswerIndex ? .green : .white).padding(.horizontal, 3)
                                            
                                        }
                                        else if isSubmitted == true && selectedAnswerIndex != model.currentQuestion?.correctIndex{
                                            RectangleButton(color: i == selectedAnswerIndex ? .red : .white).padding(.horizontal, 3)
                                            if i == model.currentQuestion!.correctIndex{
                                                RectangleButton(color: .green)
                                            }
                                            
                                            
                                            
                                        
                                            
                                            
                                            
                                        }
                                        
                                        
                                        
                                        Text(model.currentQuestion!.answers[i])
                                    }.padding(.vertical, 5.0)
                                }
                            }.disabled(isSubmitted)

                            
                            
                        }
                    }
            
                 
                    
                    if isSubmitted == true &&  model.currentModule!.test.questions.count == model.selectedQuestionIndex + 1{
                        
                        Button {
                            model.currentQuestion =  nil
                        } label: {
                            ZStack{
                                RectangleButton(color: .orange)
                                Text("Finish").foregroundColor(.white).bold()
                            }.padding(.horizontal, 3)
                        }
                        
                        
                    }
                    else if isSubmitted == true{
                        Button {
                            model.goNextQuestion()
                            isSubmitted = false
                            selectedAnswerIndex = -1
                            questionNumber += 1
                        } label: {
                            ZStack{
                                RectangleButton(color: .orange)
                                Text("Next").foregroundColor(.white).bold()
                            }.padding(.horizontal, 3)
                        }

                    }
                    
                    else{
                        Button {
                            if model.currentQuestion!.correctIndex == selectedAnswerIndex{
                                numCorrect += 1
                            }
                            isSubmitted = true
                        } label: {
                            ZStack{
                                RectangleButton(color: .green)
                                Text("Submit").foregroundColor(.white).bold()
                            }.padding(.horizontal, 3)
                        }.disabled(selectedAnswerIndex == -1)
                    }
                }.navigationTitle("\(model.currentModule?.category ?? "") Test").padding(.horizontal)
                    .accentColor(.black)

                
            }
            
            else{
                TestResultView(score: numCorrect, numberOfQuestions: model.currentModule?.test.questions.count ?? 0)
            }
        }
    }
}

