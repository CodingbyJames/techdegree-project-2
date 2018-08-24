//Questions

class Question {
    let question: String
    let possibleAnswers: [String]
    let correctAnswer: String
    
    init(question: String, possibleAnswers: [String], correctAnswer: String) {
        self.question = question
        self.possibleAnswers = possibleAnswers
        self.correctAnswer = correctAnswer
    }
}
let question1 = Question.init(question: "Who was the only US President to serve more than two consecutive terms?", possibleAnswers: ["George Washington", "Franklin D. Roosevelt", "Woodrow Wilson", "Andrew Jackson" ], correctAnswer: "George Washington")
let question2 = Question.init(question: "Which of the following countries has the most residents?", possibleAnswers: ["Nigeria", "Russia", "Iran", "Vietnam"], correctAnswer: "Nigeria")
let question3 = Question.init(question: "In what year was the United Nations founded?", possibleAnswers: ["1918", "1919", "1945", "1954"], correctAnswer: "1945")
let question4 = Question.init(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?", possibleAnswers: ["Paris", "Washington D.C.", "New York City", "Boston"], correctAnswer: "New York City")
let question5 = Question.init(question: "Which nation produces the most oil?", possibleAnswers: ["USA", "Iraq", "Kuwait", "Canada"], correctAnswer: "USA")
let question6 = Question.init(question: "Which country has most recently won consecutive World Cups in Soccer?", possibleAnswers: ["Italy", "Brazil", "Argentina", "Spain"], correctAnswer: "Brazil")
let question7 = Question.init(question: "Which of the following rivers is longest?", possibleAnswers: ["Yangtze", "Mississippi", "Congo", "Niger"], correctAnswer: "Yangtze")
let question8 = Question.init(question: "Which city is the oldest?", possibleAnswers: ["Jerusalem", "Athens", "Thebes", "Damascus"], correctAnswer: "Damascus")
let question9 = Question.init(question: "Which team was the first to win two Super Bowls back-to-back?", possibleAnswers: ["Pittsburgh Steelers", "New England Patriots", "Miami Dolphins", "Green Bay Packers"], correctAnswer: "Green Bay Packers")
let question10 = Question.init(question: "Which of these countries won the most medals in the 2012 Summer Games?", possibleAnswers: ["France", "Japan", "Germany", "Canada"], correctAnswer: "Germany")


let questionPool: [Question] = [question1, question2, question3, question4, question5, question6, question7, question8, question9, question10]


