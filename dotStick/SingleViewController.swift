//
//  SingleViewController.swift
//  dotStick
//
//  Created by togashi yoshiki on 2018/02/16.
//  Copyright © 2018年 togashi yoshiki. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController {
    //MARK: 変数
    var takeTime = "60"
    var timer = Timer()
    var startTime : Double = 0.0
    
    
    var QuestionText = ["１６をひくと、残りは？","①左と右の数を合体すると？","８をひくと、残りは？","４３をひくと、残りは？","②左と右の数を合体すると？","③左と右の数を合体すると？","④左と右の数を合体すると？","２００をひくと？","２４４をひくと？","ぜんぶでいくつ？"]
    
    var Answers = [18,34,66,29,33,82,95,20,78,407]
    
    //ランダム変数の数字を格納
    var rr = 0
    
    //MARK:部品変数
    @IBOutlet weak var labelTimer: UILabel!
    
    //問題用
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var QuLabel: UILabel!
    @IBOutlet weak var AnsTextField: UITextField!
    
    
    
    //MARK: 全メソッド
        //タイマー管理
    @objc func updatelabel(){
        let elasedTime = Date().timeIntervalSince1970 - startTime
        let flooredTimer = Int(floor(elasedTime))
        let leftTime = Int(takeTime)! - flooredTimer
        let displayString = NSString(format:"00:%02d", leftTime)as String
        labelTimer.text = displayString
        //        print(labelTimer.text)
        
        if labelTimer.text == "00:-1" {
            timer.invalidate()
            performSegue(withIdentifier: "end", sender: nil)
        }
    }
    
    
//    キーボードを戻す (いらないかも。)
    @IBAction func back(_ sender: UITextField) {
    
    }
    
//    文字を入力する
    @IBAction func inputText(_ sender: UITextField) {
        
        //String型をInt型に変換
        var Ans = Int(AnsTextField.text!)
        
        
        if QuestionText.index(of: QuestionText[rr]) == Answers.index(of: Answers[rr]){
            if Ans == Answers[rr]{
                
                QuLabel.text = "Crear"
//                クリアーの場合1秒後次の問題へ
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    // 1秒後に実行したい処理
                    let r = Int(arc4random())%self.Answers.count
                    self.myImage.image = UIImage(named:"\(r).jpg")
                    self.QuLabel.text = self.QuestionText[r]
                    self.rr = r
                }
            }else{
                QuLabel.text = "Not crear"
            }
            
        }
            
        
//        テキストフィールドも文字を空にする
        AnsTextField.text = ""
    }

//    別の場所をタップするとキーボードが閉じます。
    @IBAction func tapScreen(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //時間表示
        startTime = Date().timeIntervalSince1970 - startTime
        labelTimer.text = takeTime
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updatelabel), userInfo: nil, repeats: true)
        print (takeTime,"びょう")
        labelTimer.text = takeTime
        
        
        
        //問題表示
        var r = Int(arc4random())%Answers.count
        
        myImage.image = UIImage(named:"\(r).jpg")
        QuLabel.text = QuestionText[r]
        rr = r
        AnsTextField.keyboardType = UIKeyboardType.numberPad
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
