//
//  ViewController.swift
//  TableViewPractice
//
//  Created by Muralidhar reddy Kakanuru on 11/23/24.
//

import UIKit

class ViewController: UIViewController {
    let fruits = [
        ["Apple","Banana","pineApple"],
        ["Orange","Grapes"],
        ["Mango"]
    ]

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell1.self, forCellReuseIdentifier: "cell")
        if #available(iOS 15.0, *) {
                    tableView.sectionHeaderTopPadding = 0
                }
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        header.backgroundColor = .black
        footer.backgroundColor = .red
        tableView.tableHeaderView = header
        tableView.tableFooterView = footer
        
        let searchbutton = UIButton(frame: CGRect(x: view.frame.size.width - 40, y: 30, width: 40, height: 40))
        searchbutton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchbutton.tintColor = .white
        searchbutton.addTarget(self, action: #selector(searchButton), for: .touchUpInside)
        header.addSubview(searchbutton)
        
        let profilebutton = UIButton(frame: CGRect(x: 0, y: 30, width: 40, height: 40))
        profilebutton.setImage(UIImage(systemName: "person"), for: .normal)
        profilebutton.tintColor = .white
        profilebutton.addTarget(self, action: #selector(profileButton), for: .touchUpInside)
        header.addSubview(profilebutton)
        
    }
    
    @objc func searchButton(){
        print("you tapped the searchbutton")
    }
    
    @objc func profileButton(){
        print(" Hey ther you tapped profile Button")
    }


}

extension ViewController: UITableViewDelegate{
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell1 else{ fatalError("can not dequecell as TableViewCell1")}

        switch indexPath.section{
        case 0:
            cell.backgroundColor = .yellow
        case 1:
          cell.backgroundColor = .orange
        case 2:
        cell.backgroundColor = .purple
        default:
            cell.backgroundColor = .white
        }
        cell.textLabel?.text = fruits[indexPath.section][indexPath.row]
        return cell
    }
}

