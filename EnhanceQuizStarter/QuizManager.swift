//  QuizManager
import GameplayKit
class QuestionGenerator {
    var gameQuestions: [Question] = []
    func createQuestionPool() {
        var thisQuestionPool: [Question] = questionPool
        for _ in 0...4 {
            let index = GKRandomSource.sharedRandom().nextInt(upperBound: thisQuestionPool.count)
            gameQuestions.append(thisQuestionPool[index])
            thisQuestionPool.remove(at: index)
        }
    }
    func displayQuestion() -> String {
        let indexOfQuestion = 0
        let questionText = gameQuestions[indexOfQuestion].question
        
        return questionText
    }
    init() {
        
    }
}


let questionGenerator = QuestionGenerator()




