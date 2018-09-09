//
//  ViewController.swift
//  Bremen
//
//  Created by mio kato on 2018/08/31.
//  Copyright © 2018年 mio kato. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    // Animal Images
    @IBOutlet weak var lionImage: UIImageView!
    @IBOutlet weak var chickenImage: UIImageView!
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var sheepImage: UIImageView!
    @IBOutlet weak var elephantImage: UIImageView!
    @IBOutlet weak var childChickImage: UIImageView!

    // Animal voices
    var chickAudioPlayer: AVAudioPlayer!
    var lionAudioPlayer: AVAudioPlayer!
    var chickenAudioPlayer: AVAudioPlayer!
    var catAudioPlayer: AVAudioPlayer!
    var sheepAudioPlayer: AVAudioPlayer!
    var elephantAudioPlayer: AVAudioPlayer!
    var backGroundAudioPlayer: AVAudioPlayer!
    
    // BGM
    @IBOutlet weak var bgmSW: UISwitch!
    
    @IBAction func toggleBGM(_ sender: UISwitch) {
        if sender.isOn {
            backGroundAudioPlayer.currentTime = 0
            backGroundAudioPlayer.numberOfLoops = -1
            backGroundAudioPlayer.play()
        } else {
            backGroundAudioPlayer.stop()
        }
    }
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        childChickImage.isUserInteractionEnabled = true
        lionImage.isUserInteractionEnabled = true
        chickenImage.isUserInteractionEnabled = true
        catImage.isUserInteractionEnabled = true
        sheepImage.isUserInteractionEnabled = true
        elephantImage.isUserInteractionEnabled = true
        
        childChickImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.imageViewTapped(_:))))
        lionImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.lionImageViewTapped(_:))))
        chickenImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.chickenImageViewTapped(_:))))
        catImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.catImageViewTapped(_:))))
        sheepImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.sheepImageViewTapped(_:))))
        elephantImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.elephantImageViewTapped(_:))))
        
        // バックグラウンドミュージック
        guard let backGroundSoundPath = Bundle.main.path(forResource: "sounds/ToyCarnival", ofType: "mp3") else {
            print("backgroundの音源ファイルがありません。"); return;
        }
        do {
            backGroundAudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: backGroundSoundPath))
        } catch { print("失敗") }
        
        guard let chickSoundFilePath = Bundle.main.path(forResource: "sounds/chick-cry1", ofType: "mp3") else {
            print("chick-cry1の音源ファイルがありません。"); return;
        }
        do {
            chickAudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: chickSoundFilePath), fileTypeHint: nil)
        } catch { print("失敗") }
        
        guard let lionSoundFilePath = Bundle.main.path(forResource: "sounds/lion1", ofType: "mp3") else {
            print("音源ファイルがありません。"); return;
        }
        do {
            lionAudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: lionSoundFilePath), fileTypeHint: nil)
        } catch { print("失敗") }
        
        guard let chickenSoundFilePath = Bundle.main.path(forResource: "sounds/chicken-cry1", ofType: "mp3") else {
            print("音源ファイルがありません。"); return;
        }
        do {
            chickenAudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: chickenSoundFilePath), fileTypeHint: nil)
        } catch { print("失敗") }
        
        guard let catAudioFilePath = Bundle.main.path(forResource: "sounds/cat-cry1", ofType: "mp3") else {
            print("音源ファイルがありません。"); return; }
        do {
            catAudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: catAudioFilePath), fileTypeHint: nil)
        } catch { print("失敗") }
        
        guard let sheepAudioFilePath = Bundle.main.path(forResource: "sounds/sheep-cry1", ofType: "mp3") else {
            print("音源ファイルがありません。"); return;
        }
        do {
            sheepAudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sheepAudioFilePath), fileTypeHint: nil)
        } catch { print("失敗") }
        
        guard let elephantAudioFilePath = Bundle.main.path(forResource: "sounds/elephant1", ofType: "mp3") else {
            print("音源ファイルがありません。"); return;
        }
        do {
            elephantAudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: elephantAudioFilePath), fileTypeHint: nil)
        } catch { print("失敗") }
        
        chickAudioPlayer.prepareToPlay()
        lionAudioPlayer.prepareToPlay()
        chickenAudioPlayer.prepareToPlay()
        catAudioPlayer.prepareToPlay()
        sheepAudioPlayer.prepareToPlay()
        elephantAudioPlayer.prepareToPlay()
        
        // BGM
        backGroundAudioPlayer.prepareToPlay()
        bgmSW.isOn = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Event
    @objc func imageViewTapped(_ sender: UITapGestureRecognizer){
        playSound(player: chickenAudioPlayer)
        animateImage(imgView: childChickImage)
    }
    @objc func lionImageViewTapped(_ sender: UITapGestureRecognizer){
        playSound(player: lionAudioPlayer)
        animateImage(imgView: lionImage)
    }
    @objc func chickenImageViewTapped(_ sender: UITapGestureRecognizer){
        playSound(player: chickenAudioPlayer)
        animateImage(imgView: chickenImage)
    }
    @objc func catImageViewTapped(_ sender: UITapGestureRecognizer){
        playSound(player: catAudioPlayer)
        animateImage(imgView: catImage)
    }
    @objc func sheepImageViewTapped(_ sender: UITapGestureRecognizer){
        playSound(player: sheepAudioPlayer)
        animateImage(imgView: sheepImage)
    }
    @objc func elephantImageViewTapped(_ sender: UITapGestureRecognizer){
        playSound(player: elephantAudioPlayer)
        animateImage(imgView: elephantImage)
    }
    
    func playSound(player: AVAudioPlayer) {
        player.currentTime = 0
        player.play()
    }
    
    func animateImage(imgView: UIImageView) {
        UIView.animate(withDuration: 2.0, delay: 0.0, animations: {
            imgView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            imgView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 2))
        }, completion: nil)
    }
}

