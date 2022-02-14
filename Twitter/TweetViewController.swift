//
//  TweetViewController.swift
//  Twitter
//
//  Created by Lexie Hvostal on 2/7/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    @IBOutlet weak var tweetTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // displays keyboard and cursor
        tweetTextView.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: Any) {
        // dismiss controller when user clicks cancel
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweet(_ sender: Any) {
        // check if tweet is empty
        if (!tweetTextView.text.isEmpty) {
            // call api and post tweet
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                // dismiss view controller if successful
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                // print error message then dismiss view controller if unsuccessful
                print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            // dismiss view controller if tweet is empty
            self.dismiss(animated: true, completion: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
