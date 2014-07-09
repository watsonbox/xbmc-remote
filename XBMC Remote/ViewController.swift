//
//  ViewController.swift
//  First App
//
//  Created by Howard Wilson on 09/07/2014.
//  Copyright (c) 2014 Howard Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var leftButton: UIButton
    @IBOutlet var rightButton: UIButton
    @IBOutlet var upButton: UIButton
    @IBOutlet var downButton: UIButton
    @IBOutlet var selectButton: UIButton
    @IBOutlet var backButton: UIButton
    @IBOutlet var ipLabel: UILabel
    @IBOutlet var ipText: UITextField
    
    @IBAction func moveLeft(sender : AnyObject) { apiRequest("Input.Left") }
    @IBAction func moveRight(sender : AnyObject) { apiRequest("Input.Right") }
    @IBAction func moveUp(sender : AnyObject) { apiRequest("Input.Up") }
    @IBAction func moveDown(sender : AnyObject) { apiRequest("Input.Down") }
    @IBAction func moveSelect(sender : AnyObject) { apiRequest("Input.Select") }
    @IBAction func moveBack(sender : AnyObject) { apiRequest("Input.Back") }
    
    func apiRequest(methodName : String) {
        var request = NSMutableURLRequest(URL: NSURL(string: "http://\(ipText.text)/jsonrpc"))
        request.HTTPMethod = "POST"
        
        let dataString = "{\"jsonrpc\": \"2.0\", \"method\": \"\(methodName)\", \"params\": {  }, \"id\": 1 }"
        request.HTTPBody = (dataString as NSString).dataUsingEncoding(NSUTF8StringEncoding)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        NSURLConnection(request: request, delegate: self, startImmediately: false).start()
    }
    
    @IBAction func viewTapped(sender : AnyObject) {
        // Clears the keyboard
        ipText.resignFirstResponder()
    }
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        ipText.hidden = !UIInterfaceOrientationIsPortrait(toInterfaceOrientation)
        ipLabel.hidden = !UIInterfaceOrientationIsPortrait(toInterfaceOrientation)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}