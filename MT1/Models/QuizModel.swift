//
//  QuizModel.swift
//  MT1
//
//  Created by Cenk Bilgen on 2024-02-22.
//

import Foundation


// TODO: modify anything as needed to incorporate app features

class QuizModel: ObservableObject {
    @Published var questions: [Question] = []
    @Published var currentQuestionIndex = 0

    var currentQuestion: Question? {
        // TODO: Modify
        return nil
    }

    var isFinished: Bool {
        // TODO: modify
        return false
    }

    init(count: Int) {
        Task { @MainActor in
            do {
                self.questions = try await TriviaService.questions(count: count)
                print("Got \(self.questions.count) questions")
            } catch {
                print(error.localizedDescription)
                // TODO: let user know
            }
        }
    }
}
