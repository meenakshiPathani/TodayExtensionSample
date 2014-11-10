//
//  TodayViewController.swift
//  TodayExtension
//
//  Created by Meenakshi  on 29/10/14.
//  Copyright (c) 2014 Mindfire Solutions. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
	
	@IBOutlet var scoreLabel: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
		
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@IBAction func openButtonPressed(){
	
		var url =  NSURL(string:"todayExtensionSample://")
		
//		[self.extensionContext openURL:url completionHandler:^(BOOL success) {
//			NSLog(@"fun=%s after completion. success=%d", __func__, success);
//		}];
		
//		func openURL(URL: NSURL, completionHandler: ((Bool) -> Void)?)
		
		self.extensionContext?.openURL(url, completionHandler:{(success: Bool) -> Void in
			println("task done!")
		})
	}
	
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
		
		var userDefaults: NSUserDefaults = NSUserDefaults(suiteName: "group.mindfire.todayExtensionSample")
		var score = userDefaults.objectForKey("Score")! as? String ?? "0"
		println("\(score)")
		
		scoreLabel?.text = "Score- \(score)"
		
        completionHandler(NCUpdateResult.NewData)
    }
	
}
