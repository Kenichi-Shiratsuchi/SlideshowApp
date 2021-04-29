//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 白土顕一 on 2021/04/27.
//

import UIKit

class ViewController: UIViewController {

    // デバッグ用ラベル
    // @IBOutlet weak var monLabel: UILabel!
    // @IBOutlet weak var timerLabel: UILabel!
  
    
    
    // imageViewの割り付け
    @IBOutlet weak var imageView: UIImageView!
    

    // スライドショーさせる画像ファイルの読み込みと配列を宣言
    var imageIndex : [UIImage] = [
        UIImage(named: "ImageCar001")!,
        UIImage(named: "ImageCar002")!,
        UIImage(named: "ImageCar003")!,
        UIImage(named: "ImageCar004")!,]
    
   
    
    
    // 画像ファイル配列用index
    var cnt : Int = 0
    
    
    
    // trueでスライドショー開始
    var slideShowFlag = false
    
    // trueでスライドショーの一時停止
    var slidePauseFlag = false
    
    // タイマーの宣言
    var timer : Timer!
    
    // タイマー用の時間の為の変数
    var timer_sec : Float = 0
    
    // メイン画面に戻る
    @IBAction func goMain(_ segue: UIStoryboardSegue) {
        // trueでViewControllerのスライドショーを一時停止
        slidePauseFlag = false
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    // ここはresultViewControllerへ画面遷移する時に処理します
    override func prepare(for segue: UIStoryboardSegue, sender Sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as!     ResultViewController
        
        // trueでViewControllerのスライドショーを一時停止
        slidePauseFlag = true
        
        // resultViewControllerの画像を更新
        resultViewController.image = imageIndex[cnt]
        
    }
    
  
    
    
    // タイマー実行中はtimer_secが加算されていく
    @objc func updateTimer(_ timer: Timer) {
        
        
        if slidePauseFlag == false {
        
        self.timer_sec += 0.1
        // self.timerLabel.text = String(format: "%.1f", self.timer_sec)
        
        if self.timer_sec >= 2.0 {
            cnt = cnt + 1
            if cnt > 3 {cnt = 0}
            // monLabel.text = "\(cnt)"
            imageView.image = imageIndex[cnt]
            self.timer_sec = 0
            
            }
        }
    }
    
    
    // 進むボタン
    @IBAction func nextShow(_ sender: Any) {
        
        if slideShowFlag == false {
        cnt = cnt + 1
        if cnt > 3 {cnt = 0}
        // monLabel.text = "\(cnt)"
        imageView.image = imageIndex[cnt]
        }
        
    }
 
 
    // 戻るボタン
    @IBAction func backShow(_ sender: Any) {
        
        if slideShowFlag == false {
        cnt = cnt - 1
        if cnt < 0 {cnt = 3}
        // monLabel.text = "\(cnt)"
        imageView.image = imageIndex[cnt]
        }
        
    }
    
    
    
    
    // 再生/停止ボタン
    @IBAction func startShow(_ sender: Any) {
        
            // 再生条件
        if slideShowFlag == false {slideShowFlag = true
            // タイマーのセット
            self.timer = Timer.scheduledTimer(timeInterval: 0.1,
                                              target: self,
                                              selector: #selector(updateTimer(_:)),
                                              userInfo: nil,
                                              repeats: true)
            
            // 停止条件
        } else if slideShowFlag == true {slideShowFlag = false
            self.timer.invalidate()     // タイマーの停止
            self.timer = nil
            self.timer_sec = 0
            
        }
                
    }
 

    
}

