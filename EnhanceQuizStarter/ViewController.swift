//
//  ViewController.swift
//  EnhanceQuizStarter
//
//  Created by Pasan Premaratne on 3/12/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let questionsPerRound = 5
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion = 0
    
    var gameSound: SystemSoundID = 0
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        loadGameStartSound()
        playGameStartSound()
        questionGenerator.createQuestionPool()
        displayQuestion()
        
    }
    
    // MARK: - Helpers
    
    func loadGameStartSound() {
        let path = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    func displayQuestion() {
        questionField.text = questionGenerator.gameQuestions[indexOfSelectedQuestion].question
        button1.setTitle(questionGenerator.gameQuestions[indexOfSelectedQuestion].possibleAnswers[0], for: UIControlState.normal)
        button2.setTitle(questionGenerator.gameQuestions[indexOfSelectedQuestion].possibleAnswers[1], for: UIControlState.normal)
        button3.setTitle(questionGenerator.gameQuestions[indexOfSelectedQuestion].possibleAnswers[2], for: UIControlState.normal)
        button4.setTitle(questionGenerator.gameQuestions[indexOfSelectedQuestion].possibleAnswers[3], for: UIControlState.normal)
        playAgainButton.isHidden = true
    }
    
    func displayScore() {
        // Hide the answer buttons
        button1.isHidden = true
        button2.isHidden = true
        button3.isHidden = true
        button4.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            indexOfSelectedQuestion += 1
            displayQuestion()
        }
    }
    func newGame() {
        questionsAsked = 0
        correctQuestions = 0
        questionGenerator.gameQuestions = []
        questionGenerator.createQuestionPool()
        indexOfSelectedQuestion = 0
        displayQuestion()
    }
    
    func loadNextRound(delay seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    // MARK: - Actions
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        let selectedQuestion = questionGenerator.gameQuestions[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestion.correctAnswer
        
        if (sender.currentTitle == correctAnswer) {
            correctQuestions += 1
            questionField.text = "Correct!"
        } else {
            questionField.text = "Sorry, wrong answer!"
        }
        
        loadNextRound(delay: 1)
    }
    
    
    @IBAction func playAgain(_ sender: UIButton) {
        // Show the answer buttons
        button1.isHidden = false
        button2.isHidden = false
        button3.isHidden = false
        button4.isHidden = false
        
        newGame()
    }
    

}

