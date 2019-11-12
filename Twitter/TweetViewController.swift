//
//  TweetViewController.swift
//  Twitter
//
//  Created by cs_apple_11 on 11/5/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        TweetTextView.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var TweetTextView: UITextView!
    
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func Tweet(_ sender: Any) {
        if (!TweetTextView.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: TweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error posting tweet\(error)")
                self.dismiss(animated: true, completion: nil)
                
            })
        }else{
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
