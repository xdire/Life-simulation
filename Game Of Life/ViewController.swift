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
    
    var life = Life();
    let canvas: Canvas;
    
    required init?(coder aDecoder: NSCoder) {
        canvas = Canvas(setLife: life);
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
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

