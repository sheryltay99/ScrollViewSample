//
//  ViewController.swift
//  ScrollViewSample
//
//  Created by Sheryl Tay on 9/2/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collapseView: CollapseView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //collapseView.delegate = self
//        collapseView = CollapseView(delegate: self)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let label = cell.textLabel
        label?.text = "hihihi"
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected \(indexPath.row)")
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.collapseView.didScroll(scrollView)
    }
}

