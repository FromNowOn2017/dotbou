//
//  FirstViewController.swift
//  dotStick
//
//  Created by togashi yoshiki on 2018/02/16.
//  Copyright © 2018年 togashi yoshiki. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    //MARK:変数名
    var Lists = ["60","120","180","240"]
    var List = "5"
    
    @IBOutlet weak var mypickerView: UIPickerView!
    
    //MARK:全メソッド
    //    ピッカービューの列数を決定する。メソッド追加
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //    ピッカービューの行数を決定する。メソッド追加
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //        配列の要素の個数と同じ数を指定
        return Lists.count
    }
    //    ピッカービューに表示する文字の設定。　メソッド追加
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      
        //rowの中に配列が入ります。
        return Lists[row]
        
    }
    //    ピッカービューが選択された時に発動
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //        ユーザが選んだ時にデバックエリアに選んだものを表示します。
        print(Lists[row])
        List = Lists[row]
    }
    
    
    
    @IBAction func btn(_ sender: UIButton) {
        
        performSegue(withIdentifier: "show", sender: nil)
    }
    
    //    セグエを使って次の画面へ移動する時
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        次の画面をインスタンス化(ダウンキャスト型変換)
        var dvc = segue.destination as! SingleViewController
        //        次の画面のプロパティに選択された行番号を指定
        dvc.takeTime = List
        
    }
    
    
//    はじめの処理
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mypickerView.delegate = self
        mypickerView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
//    エラー
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

