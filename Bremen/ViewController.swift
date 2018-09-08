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
        
        
        guard let chickSoundFilePath = Bundle.main.path(forResource: "sounds/chick-cry1", ofType: "mp3") else {
            print("chick-cry1の音源ファイルがありません。")
            return
        }
        do {
            chickAudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: chickSoundFilePath), fileTypeHint: nil)
        } catch {
            print("失敗")
        }
        guard let lionSoundFilePath = Bundle.main.path(forResource: "sounds/lion1", ofType: "mp3") else {
            print("音源ファイルがありません。")
            return
        }
        do {
            lionAudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: lionSoundFilePath), fileTypeHint: nil)
        } catch {
            print("失敗")
        }
        guard let chickenSoundFilePath = Bundle.main.path(forResource: "sounds/chicken-cry1", ofType: "mp3") else {
            print("音源ファイルがありません。")
            return
        }
        do {
            chickenAudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: chickenSoundFilePath), fileTypeHint: nil)
        } catch {
            print("失敗")
        }
        guard let catAudioFilePath = Bundle.main.path(forResource: "sounds/cat-cry1", ofType: "mp3") else {
            print("音源ファイルがありません。")
            return
        }
        do {
            catAudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: catAudioFilePath), fileTypeHint: nil)
        } catch {
            print("失敗")
        }
        guard let sheepAudioFilePath = Bundle.main.path(forResource: "sounds/sheep-cry1", ofType: "mp3") else {
            print("音源ファイルがありません。")
            return
        }
        do {
            sheepAudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sheepAudioFilePath), fileTypeHint: nil)
        } catch {
            print("失敗")
        }
        guard let elephantAudioFilePath = Bundle.main.path(forResource: "sounds/elephant1", ofType: "mp3") else {
            print("音源ファイルがありません。")
            return
        }
        do {
            elephantAudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: elephantAudioFilePath), fileTypeHint: nil)
        } catch {
            print("失敗")
        }
        chickAudioPlayer.prepareToPlay()
        lionAudioPlayer.prepareToPlay()
        chickenAudioPlayer.prepareToPlay()
        catAudioPlayer.prepareToPlay()
        sheepAudioPlayer.prepareToPlay()
        elephantAudioPlayer.prepareToPlay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func imageViewTapped(_ sender: UITapGestureRecognizer){
        chickAudioPlayer.currentTime = 0
        chickAudioPlayer.play()
        UIView.animate(withDuration: 2.0, delay: 0.0, animations: {
            self.childChickImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.childChickImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 2))
        }, completion: nil)
    }
    @objc func lionImageViewTapped(_ sender: UITapGestureRecognizer){
        lionAudioPlayer.currentTime = 0
        lionAudioPlayer.play()
        UIView.animate(withDuration: 2.0, delay: 0.0, animations: {
            self.lionImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.lionImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 2))
        }, completion: nil)
    }
    @objc func chickenImageViewTapped(_ sender: UITapGestureRecognizer){
        chickenAudioPlayer.currentTime = 0
        chickenAudioPlayer.play()
        UIView.animate(withDuration: 2.0, delay: 0.0, animations: {
            self.chickenImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.chickenImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 2))
        }, completion: nil)
    }
    @objc func catImageViewTapped(_ sender: UITapGestureRecognizer){
        catAudioPlayer.currentTime = 0
        catAudioPlayer.play()
        UIView.animate(withDuration: 2.0, delay: 0.0, animations: {
            self.catImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.catImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 2))
        }, completion: nil)
    }
    @objc func sheepImageViewTapped(_ sender: UITapGestureRecognizer){
        sheepAudioPlayer.currentTime = 0
        sheepAudioPlayer.play()
        UIView.animate(withDuration: 2.0, delay: 0.0, animations: {
            self.sheepImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.sheepImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 2))
        }, completion: nil)
    }
    @objc func elephantImageViewTapped(_ sender: UITapGestureRecognizer){
        elephantAudioPlayer.currentTime = 0
        elephantAudioPlayer.play()
        UIView.animate(withDuration: 2.0, delay: 0.0, animations: {
            self.elephantImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.elephantImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 2))
        }, completion: nil)
    }
    
}

