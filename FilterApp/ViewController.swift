//
//  ViewController.swift
//  FilterApp
//
//  Created by xuanyuan on 2021/11/14.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("full")

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    @IBAction func goAction(_ sender: Any) {
        
        debugPrint("begin...")
        
        let path = "/Users/xuanyuan/Downloads/AI_4"
        let def = FileManager.default
        
        for pa in def.subpaths(atPath: path) ?? [] {
            let full = path + "/" + pa
            if full.contains(".png") {
                let mmm = NAM7_LTC_1h_1year()
                let url = URL(fileURLWithPath: full)
                let result =  try? mmm.prediction(input: NAM7_LTC_1h_1yearInput(imageAt: url))
                let res = result?.classLabel ?? ""
                if !full.contains(res) {
                    debugPrint("full=\(full),res=\(res)")
                    let url = URL(fileURLWithPath: full)
                    try? def.removeItem(at: url)
                }
            }
        }
        
    }
    

}

