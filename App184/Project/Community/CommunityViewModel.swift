//
//  CommunityViewModel.swift
//  App184
//
//  Created by Вячеслав on 9/4/23.
//

import SwiftUI

final class CommunityViewModel: ObservableObject {
    
    @Published var isDetail: Bool = false
    @Published var current_post: CommunityModel?
    
    @Published var posts: [CommunityModel] = [
    
        CommunityModel(author_name: "Ethan Carter", author_image: "avatar_1", post_image: "image_1", post_title: "Unleashing the Power of Digital", post_text: "Networking plays a crucial role in achieving business success. By connecting with professionals in your industry, you can gain valuable insights, opportunities, and collaborations. Building relationships through networking events, conferences, and online platforms can lead to partnerships, referrals, and access to new markets. Remember, in the world of business, who you know can be just as important as what you know The advent of e-commerce has revolutionized the way we do business. With the increasing popularity of online shopping, businesses must adapt to the changing landscape to remain competitive. Establishing a strong online presence, optimizing websites for mobile devices, and leveraging digital marketing strategies are essential for capturing the attention of tech-savvy consumers. Embracing e-commerce not only expands the customer reach but also provides opportunities for streamlined operations, personalized experiences, and global market expansion. To thrive in the digital age, businesses must embrace the potential of e-commerce and stay ahead of evolving consumer preferences."),
        CommunityModel(author_name: "Tim Jennis", author_image: "avatar_2", post_image: "image_2", post_title: "Effective Strategies for Building", post_text: "Innovation allows a business to stand out from the crowd of similar offerings on the market. They may be related to the development of new products or services, the introduction of new technologies, the improvement of the business model, or a change in the way we interact with customers. Companies that invest heavily in research and development typically reap significant benefits in their industry. It is important to note that innovation should not be limited to large companies. Even small businesses and startups can use innovative approaches to create unique offerings and attract customers. It is necessary to encourage a culture of innovation within the organization by creating a favorable environment for ideas and experimentation."),
        CommunityModel(author_name: "Mia Edwards", author_image: "avatar_3", post_image: "image_3", post_title: "Key Insights for Small Businesses", post_text: "Efficient resource management is one of the key success factors in business. Resources such as finance, time, human capital, and tangible assets are valuable and limited resources, and their optimal use can increase a company's efficiency and profitability. Financial resource management plays an important role in the financial health and sustainability of a business. Proper budget planning, control of expenses and investments, effective debt management and accounting for profit and loss allow the company to keep financial flows under control and make informed financial decisions. Time management is an equally important aspect of an effective business. The ability to plan, prioritize, delegate tasks and manage time effectively helps increase productivity and reduce stress in an organization. Efficient use of time also allows a business to be more flexible and adaptive to changing market demands"),
        CommunityModel(author_name: "Alex Mitchell", author_image: "avatar_4", post_image: "image_4", post_title: "Challenges and Opportunities for Businesses", post_text: "Efficient resource management is one of the key success factors in business. Resources such as finance, time, human capital, and tangible assets are valuable and limited resources, and their optimal use can increase a company's efficiency and profitability. Financial resource management plays an important role in the financial health and sustainability of a business. Proper budget planning, control of expenses and investments, effective debt management and accounting for profit and loss allow the company to keep financial flows under control and make informed financial decisions. Time management is an equally important aspect of an effective business. The ability to plan, prioritize, delegate tasks and manage time effectively helps increase productivity and reduce stress in an organization. Efficient use of time also allows a business to be more flexible and adaptive to changing market demands"),
    
    ]
}