//
//  ViewController.swift
//  URLSection
//
//  Created by Huy on 7/21/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit
// thu vien click sang search wed
import SafariServices
class ViewController: UIViewController {
    var tableView : UITableView = {
       var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableCell.self, forCellReuseIdentifier: "APICell")
        return tableView
    }()
    var apiData : [Item] = []
    override func viewDidLoad() {
        title = "URLSection"
        super.viewDidLoad()
        setupLayout()
        reciveData()
//        let queue = DispatchQueue(label: "APIQueue")
//        queue.async {
//            self.reciveData()
//        }
        // Do any additional setup after loading the view.
    }
    func reciveData(){
        // khoi tao url
      let url = URL(string: "https://api.stackexchange.com/2.2/questions?order=desc&sort=votes&site=stackoverflow")!
        // khoi tao request
        var urlRequest = URLRequest(url: url)
        // chon method la get
        urlRequest.httpMethod = "GET"
        // tao task lay du lieu
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
          guard let data = data, let response = response as? HTTPURLResponse else {
            return
          }
        // hiển thị status code về
          print(response.statusCode)
            // nếu khác 200 có thể xảy ra 1 số lỗi vd như 404...
          if response.statusCode == 200 {
            do {
              let reciveData = try JSONDecoder().decode(Items.self, from: data)
              DispatchQueue.main.async {
                self.apiData = reciveData.items
                self.tableView.reloadData()
              }
            } catch {
              print("error: \(error)")
            }
          }
        }
        
        dataTask.resume()
    }
    func setupLayout(){
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        tableView.delegate = self
        tableView.dataSource = self
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "APICell", for: indexPath) as! TableCell
        cell.titleContentLabel.text = apiData[indexPath.row].title
        cell.tagsContentLabel.text = "\(apiData[indexPath.row].tags)"
        cell.answerCountContentLabel.text = "\(apiData[indexPath.row].answer_count)"
        cell.scoreContentLabel.text = "\(apiData[indexPath.row].score)"
        cell.linkContentLabel.text = apiData[indexPath.row].link
        
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    
}
