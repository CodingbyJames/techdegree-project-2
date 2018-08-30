//  QuizManager
import GameplayKit
class QuestionGenerator {
    func createQuestionPool() {
        var gameQuestions: [Question] = []
        var thisQuestionPool: [Question] = questionPool
        for _ in 0...4 {
            let index = GKRandomSource.sharedRandom().nextInt(upperBound: thisQuestionPool.count)
            gameQuestions.append(thisQuestionPool[index])
            thisQuestionPool.remove(at: index)
        }
    }
    init() {
        
    }
}

let questionGenerator = QuestionGenerator()




