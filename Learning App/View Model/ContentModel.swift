//
//  ContentModel.swift
//  Learning App
//
//  Created by Uday Sidhu on 27/01/23.
//

import Foundation

class ContentModel: ObservableObject{
    
    @Published var modules = [Module]()
    @Published var currentModule: Module?
    var selectedModuleIndex = 0
    @Published var currentLesson:Lesson?
    var selectedLessonIndex = 0
    @Published var lessonDescription = NSAttributedString()
    @Published var currentContentSelected:Int?
    @Published var currentTestSelected:Int?
    @Published var currentQuestion:Question?
    var selectedQuestionIndex = 0
    
    
    var styleData: Data?
    
    
    
    init(){
        getLocalData()
        
        getRemoteData()
    }
    func getLocalData(){
        
        
        let url = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do{
            let data = try Data(contentsOf: url!)
            let decoder = JSONDecoder()
            self.modules = try  decoder.decode([Module].self, from: data)
            
            
        }
        catch{
            print("error fetching data")
        }
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        do{
            let styleData = try Data(contentsOf: styleUrl!)
            self.styleData = styleData
        }
        
        catch{
            print("error parsing style data")
        }
        
    }
    
    func getRemoteData(){
        let urlString = "https://udaysidhu99.github.io/LearningApp-data/data2.json"
        let url = URL(string: urlString)
        guard url != nil else{
            // couldn't create URL
            return
        }
        //Create URL request object
        let request = URLRequest(url: url!)
        //Get the session and kick off the task
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            //check for error
            guard error == nil else {
                return
            }
            do{
                let decoder = JSONDecoder()
                let modules = try decoder.decode([Module].self, from: data!)
                //append parsed modules to the existing array
                self.modules += modules
            }
            
            catch{
                print("couldn't parse json")
            }
            
        }
        
        dataTask.resume()
        
    }
    
    func beginModule(_ moduleId:Int){
        for i in 0..<modules.count{
            if modules[i].id == moduleId{
                selectedModuleIndex = i
                currentModule = modules[selectedModuleIndex]
                break
            }
        }
    }
    func beginLesson(_ lessonIndex:Int){
        if lessonIndex < currentModule!.content.lessons.count{
            selectedLessonIndex = lessonIndex
        }
        
        else{
            selectedLessonIndex = 0
        }
        
        currentLesson = currentModule!.content.lessons[selectedLessonIndex]
        lessonDescription = addStyling(currentLesson!.explanation)
    }
    
    func goNextLesson(){
        if selectedLessonIndex < currentModule!.content.lessons.count - 1{
            selectedLessonIndex += 1
            currentLesson = currentModule!.content.lessons[selectedLessonIndex]
            lessonDescription = addStyling(currentLesson!.explanation)
        }
        else
        {
            selectedLessonIndex = 0
            currentLesson = nil
        }
    }
    
    func goNextQuestion(){
        if selectedQuestionIndex < currentModule!.test.questions.count {
            selectedQuestionIndex += 1
            currentQuestion = currentModule!.test.questions[selectedQuestionIndex]
            lessonDescription = addStyling(currentQuestion?.content ?? "")
        }
        else{
            selectedQuestionIndex = 0
            currentQuestion = nil
        }
    }
    
    func hasNextLesson() -> Bool{
        
        if selectedLessonIndex < currentModule!.content.lessons.count - 1{
            return true
        }
        
        else{
            return false
        }
    
    }
    
    func beginTest(_ moduleId:Int){
        beginModule(moduleId)
        selectedQuestionIndex = 0
        if currentModule?.test.questions.count ?? 0 > 0{
            currentQuestion = currentModule!.test.questions[selectedQuestionIndex]
            lessonDescription = addStyling(currentQuestion?.content ?? "")
        }
    }
    
    
    
    
    private
    func addStyling(_ htmlString: String) -> NSAttributedString{
        var resultString = NSAttributedString()
        var data = Data()
        if styleData != nil{
            data.append(styleData!)
        }
        
        data.append(Data(htmlString.utf8))
        do{
            if let attributedString = try? NSAttributedString(data:data, options: [.documentType:NSAttributedString.DocumentType.html], documentAttributes: nil){
                resultString = attributedString
            }
        }
        return resultString
    }
    
}

