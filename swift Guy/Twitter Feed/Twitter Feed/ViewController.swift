//
//  ViewController.swift
//  Twitter Feed
//
//  Created by Johnny_L on 2017/8/24.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

//URLSession.shared.dataTask(with: url!) { (data, response, error) in

//DispatchQueue.main.async 
//{
//    
//}

//task.resume()



import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    
    var tweets:[String] = []
    
    //5.------------------Activity Indicator
    //Show that a task is in progress
    var activityIndicator = UIActivityIndicatorView()
    
    func startA()
    {
        UIApplication.shared.beginIgnoringInteractionEvents()
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
        view.addSubview(activityIndicator)
    }
    
    
    //3.3.2.------------------Setting up table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.myTextView.text = tweets[indexPath.row]
        return cell
    }
    
    @IBAction func search(_ sender: UIButton)
    {
        if myTextField.text != ""
        {
            //5.------------------Activity Indicator
            startA()
            let user = myTextField.text?.replacingOccurrences(of: " ", with: "")
            getStuff(user: user!)
        }
    }
    
    // Creating function that gets all of the stuff
    func getStuff(user:String)
    {
        let url = URL(string: "https://twitter.com/" + user)
        
        //1.------------------Open a browsing session
        //downloading content
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            //2.------------------Error check in place
            if error != nil
            {
                DispatchQueue.main.async
                {
                    //Specific error message.Retrieve the localized description for this error
                    if let errorMessage = error?.localizedDescription
                    {
                        //For example:The Internet connection appears to be offline
                        self.myLabel.text = errorMessage
                    }
                    else
                    {
                        self.myLabel.text = "There has been an error.Try again."
                    }
                }
            }
                
                //After checked there hasn't benn an error
                //3.------------------Extract the data.The profile picture, the username and the twitter handle
            else
            {
                //Convert the data into a string
                let webContent:String = String(data: data!, encoding: String.Encoding.utf8)!
                
                
                if webContent.contains("<title>") && webContent.contains("data-resolved-url-large=\"")
                {
                    //                print(webContent)
                    //3.1------------------ Get the name
                    //the name and the twitter @
                    var array:[String] = webContent.components(separatedBy: "<title>")
                    array = array[1].components(separatedBy: " |")
                    let name = array[0]
                    array.removeAll()
                    
                    //name:1TheSwiftGuy(@1TheSwiftGuy)
                    //                print(name)
                    
                    //3.2------------------Get the profile picture
                    //Notice: "\""
                    array = webContent.components(separatedBy: "data-resolved-url-large=\"")
                    array = array[1].components(separatedBy: "\"")
                    let profilePicture = array[0]
//                    print(profilePicture)
                    
                    //3.3.1------------------ Get the tweets
                    array = webContent.components(separatedBy: "data-aria-label-part=\"0\">")
                    array.remove(at: 0)
                    
                    for i in 0...array.count - 1
                    {
                        let newTweet = array[i].components(separatedBy: "<")
                        array[i] = newTweet[0]
                    }
                    
                    self.tweets = array
                    
                    //4.------------------Updating our interface
                    DispatchQueue.main.async
                    {
                        self.myLabel.text = name
                        self.updateImage(url: profilePicture)
                        self.myTableView.reloadData()
                        //菊花停止旋转 Stops the animation of the progress indicator
                        self.activityIndicator.stopAnimating()
                        //停止交互 Tells the receiver to resume the handling of touch-related events
                        UIApplication.shared.endIgnoringInteractionEvents()
                    }
                }
                else
                {
                    DispatchQueue.main.async
                    {
                        self.myLabel.text = "Sorry, we coulnt find the user"
                        self.activityIndicator.stopAnimating()
                        UIApplication.shared.endIgnoringInteractionEvents() 
                    }
                }
            }
        }
        //Start the web browsing session ,get output
        task.resume()
    }
    
    //4-2------------------Function that gets profile image data
    func updateImage(url:String)
    {
        let url = URL(string: url)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            //drum data on a main queue
            DispatchQueue.main.async
            {
                //Set the image views to be equal to the data
                self.myImageView.image = UIImage(data: data!)
            }
        }
        //Start the whole session
        task.resume()
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

