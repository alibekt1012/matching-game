//
//  ViewController.swift
//  Matching game
//
//  Created by Almat Alibekov on 26.07.2023.
//

import UIKit

class ViewController: UIViewController {

    var attempt = 1
    
    var state = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var matchArray = [[0,4], [3,7], [6,15], [11,5], [1,8], [14,12], [10,9], [2, 13]]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func game(_ sender: UIButton) {
        
        print(sender.tag)
        
        if state[sender.tag - 1] != 0 {
            return
        }
        if attempt == 1 {
            for match in matchArray {
                for _ in match {
                    if sender.tag - 1 == match[0] || sender.tag - 1 == match[1] {
                        sender.setBackgroundImage(UIImage(named: "flower_\(matchArray.firstIndex(of: match)! + 1)"), for: .normal)
                        state[sender.tag - 1] = matchArray.firstIndex(of: match)!
                    }
                }
            }
            attempt = 2
        } else {
            for match in matchArray {
                for _ in match {
                    if sender.tag - 1 == match[0] || sender.tag - 1 == match[1] {
                        sender.setBackgroundImage(UIImage(named: "flower_\(matchArray.firstIndex(of: match)! + 1)"), for: .normal)
                        state[sender.tag - 1] = matchArray.firstIndex(of: match)!
                        
                        if state[match[0]] == matchArray.firstIndex(of: match)! && state[match[1]] == matchArray.firstIndex(of: match)! {
                            print("we have a match")
                            attempt = 1
                            return
                        }
                        print("we don't have a match")
                    }
                }
            }
            
        }
    }
    
    func clear() {
        
        for i in 0...8 {
            let button = view.viewWithTag(i + 1) as! UIButton
            button.setBackgroundImage(nil, for: .normal)
        }
        
    }
    
}

