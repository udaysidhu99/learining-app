//
//  ContentModel.swift
//  Learning App
//
//  Created by Uday Sidhu on 27/01/23.
//

import Foundation

class ContentModel: ObservableObject{
    
    @Published var modules = [Module]()
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
    
}
