//
//  IdeasViewModel.swift
//  App184
//
//  Created by Вячеслав on 9/4/23.
//

import SwiftUI
import Alamofire

final class IdeasViewModel: ObservableObject {
    
    @Published var ideas: [IdeasModel] = [
    
        IdeasModel(image: "timetobuy_1", title: "Time To Buy", subtitle: "+14% for 6 months"),
        IdeasModel(image: "timetobuy_2", title: "Time To Buy", subtitle: "+8% for 6 months"),
        IdeasModel(image: "timetorisk", title: "Time To Risk", subtitle: "+20% for 2 months"),
        IdeasModel(image: "timetosell", title: "Time To Sell", subtitle: "+1% for 6 months"),
    ]
    
    @Published var isLoading: Bool = false
    @Published var lessons: [VideoItem] = []
    @Published var selectedLesson: VideoItem = VideoItem(id: 1, categoryId: 1, title: "", image: "", video: "", duration: 1)
    @Published var isDetail: Bool = false
    
    @Published var isSimulator: Bool = false
    
    func getCategories() {
        
        isLoading = true
        
        self.fetchCategories(category_id: "") { result in
            
            switch result {
                
            case .success(let success):
                
                self.lessons = success.rows
                
            case .failure(let failure):
                
                debugPrint("Parse error - \(failure)")
                
                self.isLoading = false
            }
        }
    }
    
    func fetchCategories(category_id: String, completion: @escaping (Result<VideoModel, Error>) -> Void ) {
        
        isLoading = true
        
        let params: Parameters = [
            
            "token": "54dcf1db-787a-4cb8-8e1b-1e43ad69acff",
            "category_id": category_id,
        ]
        
        let request = AF.request("https://bashbcd.site/api/v2/video", method: .get, parameters: params)
        
        request.responseDecodable(of: VideoModel.self) { response in
            
            guard let value = response.value else {
                
                self.isLoading = false
                return
            }
                           
            switch response.result{
                
            case .success(_):
                
                completion(.success(value))
                self.isLoading = false
                
            case .failure(_):
                
                completion(.failure(response.error.debugDescription as! Error))
                self.isLoading = false
            }
        }
    }
}
