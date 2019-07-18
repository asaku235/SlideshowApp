//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Taka on 7/17/19.
//  Copyright © 2019 Taka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainImage: UIImageView!
    var pp1: UIImage = UIImage(named: "pp1")!
    var pp2: UIImage = UIImage(named: "pp2")!
    var pp3: UIImage = UIImage(named: "pp3")!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    //フラグを定義
    var flg = 3
    
    // タイマー
    var timer: Timer!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mainImage.image = pp1
    }
    
    // selector: #selector(updatetimer(_:)) で指定された関数
    // timeInterval: 0.1, repeats: true で指定された通り、0.1秒毎に呼び出され続ける
    @objc func updateTimer(_ timer: Timer) {
        self.flg += 1
        self.timerLabel.text = String(flg)
        if flg % 3 == 1 {
            mainImage.image = pp2
        } else if flg % 3 == 2 {
            mainImage.image = pp3
        } else{
            mainImage.image = pp1
        }
    }
    
    @IBAction func tapzoom(_ sender: Any) {
        performSegue(withIdentifier: "tapgo", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のImageViewControllerを取得する
        let zoomViewController:zoomViewController = segue.destination as! zoomViewController
        // 遷移先のImageViewControllerで宣言しているimageに値を代入して渡す
        zoomViewController.picture = self.mainImage.image
    }
    
    @IBAction func foward(_ sender: Any) {
        flg += 1
        self.timerLabel.text = String(flg)
        if flg % 3 == 1 {
            mainImage.image = pp2
        } else if flg % 3 == 2 {
            mainImage.image = pp3
        } else{
            mainImage.image = pp1
        }
        
    }
    
    @IBAction func back(_ sender: Any) {
        flg -= 1
        self.timerLabel.text = String(flg)
        if flg < 0{
            flg = 5
        }
        
        if flg % 3 == 1 {
            mainImage.image = pp2
        } else if flg % 3 == 2 {
            mainImage.image = pp3
        } else{
            mainImage.image = pp1
        }
    }
    
    @IBAction func play(_ sender: Any) {
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        } else{
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil
        }
    }
}
