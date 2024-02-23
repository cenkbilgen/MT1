//
//  TriviaService.swift
//  MT1
//
//  Created by Cenk Bilgen on 2024-02-22.
//

import Foundation

struct TriviaService {

    static let baseURLString = "https://the-trivia-api.com"

    static func questions(count: Int) async throws -> [Question] {
        var components = URLComponents(string: baseURLString)
        components?.path = "/v2/questions"
        components?.queryItems = [
            URLQueryItem(name: "limit", value: count.description)
        ]
        guard let url = components?.url else {
            throw URLError(.badURL)
        }
        var request = URLRequest(url: url)
        // request.addValue("YOUR_KEY", forHTTPHeaderField: "X-api-key")

        let (data, response) = try await URLSession.shared.data(for: request)
        print(String(data: data, encoding: .utf8) ?? "no data")

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode([Question].self, from: data)
    }
}

// MARK: Question

struct Question: Decodable {
    let category: Category

    enum Category: String, Decodable {
        case music
        case leisure = "sport_and_leisure"
        case media = "film_and_tv"
        case arts = "arts_and_literature"
        case history
        case society = "society_and_culture"
        case science
        case geography
        case food = "food_and_drink"
        case general = "general_knowledge"
    }

    // TODO: complete the rest

    // for Previews, update as you add properties
    // You don't need to use this
    static let mock = Question(category: .arts)
}

