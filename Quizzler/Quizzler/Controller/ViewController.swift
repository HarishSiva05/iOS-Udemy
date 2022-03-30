

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionView: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreKeeper: UILabel!
    
    var quizBrain = QuizBrain()
    
    
    
    //var status = true
    
    
    //questionView.label.Text = "Four + Two equals Six"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotitRight = quizBrain.checkAnswer(userAnswer: userAnswer)
       // quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotitRight
        {
            sender.backgroundColor = UIColor.green
        }
        else
        {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        //        else {
        //            questionNumber = quiz.count-1
        //            updateUI()
        //        }
        
    }
    @objc func updateUI(){
        questionView.text = quizBrain.getQuestionText()
        scoreKeeper.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
       
        
    }
    
    
}

