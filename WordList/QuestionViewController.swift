//
//  QuestionViewController.swift
//  WordList
//
//  Created by Yoshito Usui on 2024/05/07.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet var answearLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    
    var isAnswered: Bool = false
    var wordArray: [Dictionary<String, String>] = []
    var nowNumber: Int = 0
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        answearLabel.text = ""
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        wordArray.shuffle()
        questionLabel.text = wordArray[nowNumber]["english"]
    }

    @IBAction func nextButtonTapped(){
        if isAnswered{
            nowNumber += 1
            answearLabel.text = ""
            
            if nowNumber < wordArray.count{
                questionLabel.text = wordArray[nowNumber]["english"]
                isAnswered = false
                nextButton.setTitle("答えを表示", for: .normal)
            }else{
                nowNumber = 0
                performSegue(withIdentifier: "toFinishView", sender: nil)
            }
        }else{
            answearLabel.text = wordArray[nowNumber]["japanese"]
            isAnswered = true
            nextButton.setTitle("次に", for: .normal)
        }
    }
}
