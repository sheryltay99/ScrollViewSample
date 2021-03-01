//
//  CollapseView.swift
//  ScrollViewSample
//
//  Created by Sheryl Tay on 22/2/21.
//

import UIKit

class CollapseView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
   
    var imageMinHeight: CGFloat = 200
    var imageMaxHeight: CGFloat = 400
    var delegate: UIViewController? {
        didSet {
            tableView.delegate = delegate as? UITableViewDelegate
            tableView.dataSource = delegate as? UITableViewDataSource
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
//    init(delegate: UIViewController) {
//        super.init(frame: delegate.view.frame)
//        commonInit(delegate: delegate)
//    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func setImageHeight(imageMinHeight: CGFloat, imageMaxHeight: CGFloat) {
        self.imageMinHeight = imageMinHeight
        self.imageMaxHeight = imageMaxHeight
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("CollapseView", owner: self, options: nil)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentView)
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    func didScroll(_ scrollView: UIScrollView) {
        let y: CGFloat = scrollView.contentOffset.y
        let newImageHeight: CGFloat = imageHeightConstraint.constant - y

        if newImageHeight > imageMaxHeight {
            imageHeightConstraint.constant = imageMaxHeight
        } else if newImageHeight < imageMinHeight {
            imageHeightConstraint.constant = imageMinHeight
        } else {
            imageHeightConstraint.constant = newImageHeight
            scrollView.contentOffset.y = 0 // block scroll view
        }
    }
    
}
