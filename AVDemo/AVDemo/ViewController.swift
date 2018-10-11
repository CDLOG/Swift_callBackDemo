//
//  ViewController.swift
//  AVDemo
//
//  Created by 陈乐杰 on 2018/10/11.
//  Copyright © 2018年 nst. All rights reserved.
//

import UIKit
import AVKit
//import AVFoundation
class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    var data = [
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]
    var playController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VedioCellTableViewCell
        let video = data[indexPath.row]
        cell.cellImage.image = UIImage(named: video.image)
        cell.cellTitleLable.text = video.title
        cell.cellSourceLable.text = video.source
        cell.callBackBlock {
            let  path = Bundle.main.path(forResource: "1", ofType: "mp4")
            //        playerView = AVPlayer(url: URL(fileURLWithPath: path!))
            self.playerView = AVPlayer(url: URL(fileURLWithPath: path!))
            self.playController.player = self.playerView
            self.present(self.playController, animated: true) {
                self.playController.player?.play()
            }
        }
        
        return cell
        
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let  path = Bundle.main.path(forResource: "1", ofType: "mp4")
////        playerView = AVPlayer(url: URL(fileURLWithPath: path!))
//        playerView = AVPlayer(url: URL(fileURLWithPath: path!))
//        playController.player = playerView
//        self.present(playController, animated: true) {
//            self.playController.player?.play()
//        }
//    }
    

}

