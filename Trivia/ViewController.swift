//
//  ViewController.swift
//  Trivia
//
//  Created by Hiroki on 2019/04/27.
//  Copyright © 2019 Hiroki. All rights reserved.
//

import UIKit

struct Question {
    let questionText: String
    let answerOptions: [String]
    let correctAnswer: Int
}

    var score: Int = 0
    var highscore: Int = 0
    var questionCount: Int = 0

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet var answerButtonCollection: [UIButton]!
    @IBOutlet weak var nextQuestionButton: UIButton!
    @IBOutlet weak var scoreCountLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var showResultsButton: UIButton!
    
    
    var currentQuestion: Int = 0
    var questionsArray = [Question]()
    var answerNumber = Int()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestion = 0
        score = 0
        questionCount = 0
        
        questionsArray =
        [Question(questionText: "Name a number that is three more than one-fifth of one-tenth of one-half of 5000", answerOptions: ["503", "103", "53", "108"], correctAnswer: 2),
        Question(questionText: "What is the fifth most spoken language in the world?", answerOptions: ["Russian", "Hindu", "French", "Arabic"], correctAnswer: 3),
        Question(questionText: "Which one of the four is least like the other three?", answerOptions: ["Billiards", "Soccer", "Badminton", "Golf"], correctAnswer: 1),
        Question(questionText: "A snail is at the bottom of a 30 feet well. Every hour the snail climbs up 3 feet, then slides back dwn 2 feet. How many hours does it take for the snail to get out of the well?", answerOptions: ["27", "28", "30", "31"], correctAnswer: 1),
        Question(questionText: "1234 = 0, 5678 = 3, 2468 = 3, 3579 = 1, 1000 = 3, 8888 = 8, 6090 = ?", answerOptions: ["2", "4", "5", "7"], correctAnswer: 1),
        Question(questionText: "The color code for black is #000000, what is the color code for white?", answerOptions: ["#999999", "#000001", "#ffffff", "#cccccc"], correctAnswer: 2),
        Question(questionText: "Which microstate in Europe has its own airport?", answerOptions: ["Monaco", "Andorra", "Vatican City", "Malta"], correctAnswer: 3),
        Question(questionText: "Which one of the following is the name of a current NBA team?", answerOptions: ["Eagles", "Giants", "Buffalos", "Hawks"], correctAnswer: 3),
        Question(questionText: "Bank of America was originally called", answerOptions: ["Bank of America", "Bank of Italy", "Bank of Germany", "American Bank"], correctAnswer: 1),
        Question(questionText: "Which brand designed the NY Yankees logo?", answerOptions: ["Levi's", "Tiffany & Co", "Tommy Hilfiger", "Ralph Lauren"], correctAnswer: 1),
        Question(questionText: "Which animal has the most amount of teeth?", answerOptions: ["Alligator", "White Shark", "Human", "Snail"], correctAnswer: 3),
        Question(questionText: "When was Boston College founded?", answerOptions: ["1842", "1858", "1863", "1881"], correctAnswer: 2),
        Question(questionText: "Which animal has the strongest jaw?", answerOptions: ["Nile Crocodile", "Hippopotamus", "Polar bear", "Bull shark"], correctAnswer: 0),
        Question(questionText: "The most expensive milk in the world is made from which animal?", answerOptions: ["Goat", "Donkey", "Horse", "Cow"], correctAnswer: 1),
        Question(questionText: "Which one of the following is the first to become an UNESCO World Heritage Site?", answerOptions: ["Grand Canyon", "Galapagos Island", "Taj Mahal", "Machu Pichu"], correctAnswer: 1)]
        questionsArray.shuffle()
        
        showResultsButton.isEnabled = false
        pickQuestion()
    }
    
    func pickQuestion() {
        print(currentQuestion)
        textLabel.text = questionsArray[currentQuestion].questionText
        nextQuestionButton.isHidden = true
        answerNumber = questionsArray[currentQuestion].correctAnswer
        for index in 0..<answerButtonCollection.count{
            answerButtonCollection[index].setTitle(questionsArray[currentQuestion].answerOptions[index], for: .normal)
            }
        
    }
    
    func disableButton() {
        for index in 0..<answerButtonCollection.count {
            answerButtonCollection[index].isEnabled = false
        }
    }
    
    func answeredCorrect() {
        nextQuestionButton.isHidden = false
        resultLabel.text = "Correct!"
        score += 1
        questionCount += 1
        scoreCountLabel.text = "Score \(score)/\(questionCount)"
        answerButtonCollection[answerNumber].backgroundColor = UIColor(red: 109/255, green: 195/255, blue: 58/255, alpha: 1.0)
        disableButton()
    }
    
    func answeredWrong() {
        nextQuestionButton.isHidden = false
        resultLabel.text = "Incorrect!"
        questionCount += 1
        scoreCountLabel.text = "Score \(score)/\(questionCount)"
        answerButtonCollection[answerNumber].backgroundColor = UIColor(red: 109/255, green: 195/255, blue: 58/255, alpha: 1.0)
        disableButton()
    }
    
    
    func reset() {
        resultLabel.text = ""
        for index in 0..<answerButtonCollection.count {
            answerButtonCollection[index].isEnabled = true
            answerButtonCollection[index].backgroundColor = UIColor(red: 248/255, green: 208/255, blue: 48/255, alpha: 1.0)  
        }
    }

    
    @IBAction func button0(_ sender: UIButton) {
        if answerNumber == 0 {
        answeredCorrect()
        
        }else{
            answeredWrong()
            answerButtonCollection[0].backgroundColor = UIColor.red
            
        }
    }
    @IBAction func button1(_ sender: UIButton) {
        if answerNumber == 1 {
            answeredCorrect()
        }else{
            answeredWrong()
            answerButtonCollection[1].backgroundColor = UIColor.red
        
        }
    }
    @IBAction func button2(_ sender: UIButton) {
        if answerNumber == 2 {
            answeredCorrect()
        }else{
            answeredWrong()
            answerButtonCollection[2].backgroundColor = UIColor.red
        }
    }
    @IBAction func button3(_ sender: UIButton) {
        if answerNumber == 3 {
            answeredCorrect()
        }else{
            answeredWrong()
            answerButtonCollection[3].backgroundColor = UIColor.red
        }
    }
    

    
    @IBAction func nextQuestionPressed(_ sender: UIButton) {
        currentQuestion += 1
        if currentQuestion == 9 {
            nextQuestionButton.setTitle("Show Result", for: .normal)
        }
        if currentQuestion >= 10 {
            performSegue(withIdentifier: "ShowResult", sender: nil)
        } else {

            pickQuestion()
            reset()
        }
        }
    }
    
    
    


