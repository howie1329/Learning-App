//
//  ContentModel.swift
//  Learning App
//
//  Created by Howard Thomas on 2/12/23.
//

import Foundation

class ContentModel: ObservableObject {
    
    //List of modules
    @Published var modules = [Module]()
    
    // Current Module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    //Current Lesson
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    var styleData: Data?
    
    init(){
        
        getLocalData()
    }
    
    // MARK: - Data Methods
    
    func getLocalData(){
        
        //Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do{
            // read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // try to decode the json into an array of modules
            let jsonDecorder = JSONDecoder()
            let modules = try jsonDecorder.decode([Module].self, from: jsonData)
            
            // Assign parsed modules to modules property
            self.modules = modules
            
        } catch{
            // TODO Log Error
            print("error")
        }
        
        // Parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do{
            // Read the file into data object
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
        } catch {
            print("error 2")
        }

    }
    
    // MARK: - Module Control Methods
    
    func beginModule(_ moduleid: Int){
        
        // Find the index for this module id
        for index in 0..<modules.count{
            if modules[index].id == moduleid{
                // Found Matching Module
                currentModuleIndex = index
                break
            }
        }
        
        // Set the current Module
        currentModule = modules[currentModuleIndex]
    }
    
    func beginLesson(_ lessonIndex: Int){
        // Check if the lesson index is in range
        if lessonIndex < currentModule!.content.lessons.count{
            currentLessonIndex = lessonIndex
            
        } else {
            currentLessonIndex = 0
        }
        
        // Set Current Lesson
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
    }
    
    func nextLesson(){
        // Advance the lesson index
        currentLessonIndex +  1
        
        // Check that it is within range
        if currentLessonIndex < currentModule!.content.lessons.count{
            
            // Set current Lesson
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
        }
        else{
            
            // Reset the lesson state
            currentLesson = nil
            currentLessonIndex = 0
        }
    }
    
    func hasNextLesson() -> Bool {
        if currentLessonIndex + 1 < currentModule!.content.lessons.count{
            return true
        }
        else{
            return false
        }
    }
}
