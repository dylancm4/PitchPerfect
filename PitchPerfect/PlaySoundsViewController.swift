//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Dylan Miller on 4/26/16.
//  Copyright © 2016 Dylan Miller. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController
{
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var playbackTimerLabel: UILabel!
    
    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    var playbackSecondsRemaining = 0.0
    var playbackTimer: NSTimer!
    let playbackTimerIntervalSeconds = 0.01
    
    enum ButtonType: Int
    {
        case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupAudio()
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        configureUI(.NotPlaying)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSoundForButton(sender: UIButton)
    {
        switch (ButtonType(rawValue: sender.tag)!)
        {
            case .Slow:
                playSound(rate: 0.5)
            case .Fast:
                playSound(rate: 1.5)
            case .Chipmunk:
                playSound(pitch: 1000)
            case .Vader:
                playSound(pitch: -1000)
            case .Echo:
                playSound(echo: true)
            case .Reverb:
                playSound(reverb: true)
        }
        
        configureUI(.Playing)
    }
    
    @IBAction func stopButtonPressed(sender: UIButton)
    {
        stopAudio()
    }
}
