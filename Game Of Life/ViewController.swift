//
//  ViewController.swift
//  Life
//
//  Created by Anton Repin on 8/6/16.
//  Copyright © 2016 Anton Repin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var canvasView: UIView!
    
    @IBAction func rebuildLife(sender: UIButton) {
        timer.invalidate();
        life.resetLife();
        canvas.setNeedsDisplay();
    }
    
    var life = Life();
    let canvas: Canvas;
    var timer: NSTimer;
    
    required init?(coder aDecoder: NSCoder) {
        canvas = Canvas(setLife: life);
        timer = NSTimer();
        super.init(coder: aDecoder);
    }
    
    // ------------------------------------------------------
    // Start Life world with the view
    // ------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        canvas.frame = canvasView.frame;
        
        canvas.center = CGPointMake(canvas.frame.size.width/2, canvas.frame.size.height/2);
        
        print("Initialized with following properties");
        print("Main Width: " + String(canvasView.frame.size.width));
        print("Main Height: " + String(canvasView.frame.size.height));
        print("Canvas Width: " + String(canvas.frame.size.width));
        print("Canvas Height: " + String(canvas.frame.size.height));
        
        canvasView.addSubview(canvas);
        
        let tapTouch = UITapGestureRecognizer(target: self, action: #selector(ViewController.start(_:)));
        canvasView.addGestureRecognizer(tapTouch);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func start(grec: UITapGestureRecognizer) -> Void {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.10, target: self, selector: #selector(ViewController.tick), userInfo: nil, repeats: true);
    }
    
    func tick() -> Void {
        life.nextTick();
        canvas.setNeedsDisplay();
    }

}

