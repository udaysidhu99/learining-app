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
    
    
    var styleData: Data?
    
    
    
    init(){
        getLocalData()
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
    }
    
    func goNextLesson(){
        if selectedLessonIndex < currentModule!.content.lessons.count - 1{
            selectedLessonIndex += 1
            currentLesson = currentModule!.content.lessons[selectedLessonIndex]
        }
        else
        {
            selectedLessonIndex = 0
            currentLesson = nil
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
    
}

