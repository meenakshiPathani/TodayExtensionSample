//
//  ViewController.swift
//  TodayExtensionSample
//
//  Created by Meenakshi  on 29/10/14.
//  Copyright (c) 2014 Mindfire Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet var textField : UITextField!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		textField?.becomeFirstResponder()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func doneButtonPressed (sender: UIButton){
		
		if (textField?.isFirstResponder() != nil){
			textField?.resignFirstResponder()
		}
		
		if  textField?.text.utf16Count > 0 {
			
			var userDefaults: NSUserDefaults = NSUserDefaults(suiteName: "group.mindfire.todayExtensionSample")
			userDefaults.setObject(textField?.text, forKey:"Score")
			
//			userDefaults.setObject("100", forKey:"Score")

			userDefaults.synchronize()
		}
	}
}

