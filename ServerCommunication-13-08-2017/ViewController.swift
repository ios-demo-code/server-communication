//
//  ViewController.swift
//  ServerCommunication-13-08-2017
//
//  Created by Soeng Saravit on 8/13/17.
//  Copyright © 2017 Soeng Saravit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ARTICLE_GET_URL = "http://174.138.20.101:15000/v1/api/articles?page=1&limit=15"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: ARTICLE_GET_URL)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Basic QU1TQVBJQURNSU46QU1TQVBJUEBTU1dPUkQ=", forHTTPHeaderField: "Authorization")
        let session = URLSession.shared
        
        session.dataTask(with: request) { (
            data, response, error) in
            if error == nil {
                do {
                    if let object = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String:Any]{
                        print(object["DATA"] as! [Any])
                    }
                }catch let error {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}

