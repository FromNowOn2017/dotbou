//
//  SecondViewController.swift
//  dotStick
//
//  Created by togashi yoshiki on 2018/02/16.
//  Copyright © 2018年 togashi yoshiki. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBAction func topBack(_ sender: UIButton) {
        performSegue(withIdentifier: "top", sender: nil)
    }
    
    
    
//    初期処理
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
//    エラー画面
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

