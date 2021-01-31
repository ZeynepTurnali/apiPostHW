//
//  Detail.swift
//  apiPostHW

import UIKit

class Detail: UIViewController {
    
    var postsDetail: Posts = Posts()
    var numberOfRow = 0

    @IBOutlet weak var titleDetail: UILabel!
    
    @IBOutlet weak var bodyDetail: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleDetail.text = "Title: \(postsDetail[numberOfRow].title)"
        bodyDetail.text = "Body: \(postsDetail[numberOfRow].body)"
       
    }
    
    
    

   

}
