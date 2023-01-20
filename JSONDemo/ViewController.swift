//
//  ViewController.swift
//  JSONDemo
//
//  Created by Rachana Pandit on 17/11/22.
//

import UIKit

class ViewController: UIViewController{
    
@IBOutlet weak var tableViewPosts:UITableView!
//Creating an Array empty instance from "Post" Structure.
var post = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    let nibName = UINib(nibName: "CellPost", bundle: nil)
    tableViewPosts.register(nibName, forCellReuseIdentifier: "CellPost")
        
        tableViewPosts.delegate =  self
        tableViewPosts.dataSource = self
        fetchingDataFromAPI()
}
    
    func fetchingDataFromAPI()
    {
      let urlString = "https://jsonplaceholder.typicode.com/posts"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
     let session = URLSession(configuration: .default)
     var dataTask = session.dataTask(with: request) { data, response, error in
         var jsonObject = try! JSONSerialization.jsonObject(with: data!) as! [[String:Any]]
         
         for dictionary in jsonObject{
             let eachDictionary = dictionary as [String:Any]
             let postId = eachDictionary["id"] as! Int
             let postTitle = eachDictionary["title"] as! String
             let postBody  = eachDictionary["body"] as! String
             self.post.append(Post(id: postId, title: postTitle, body: postBody))
         }
         DispatchQueue.main.async {
             self.tableViewPosts.reloadData()
         }
     }
    dataTask.resume()
   }
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableViewPosts.dequeueReusableCell(withIdentifier: "CellPost", for: indexPath) as! CellPost
        cell.lblId.text = String(post[indexPath.row].id)
        cell.lblTitle.text = post[indexPath.row].title
        cell.lblBody.text = post[indexPath.row].body
        return cell
    }
}
extension ViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
       return 150
    }
}
