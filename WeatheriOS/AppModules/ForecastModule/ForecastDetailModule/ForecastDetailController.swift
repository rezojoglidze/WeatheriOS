//
//  ForecastDetailController.swift
//  WeatheriOS
//
//  Created by Rezo Joglidze on 9/15/20.
//  Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import UIKit

class ForecastDetailController: UIViewController {
    
    static func getInstance(with forecastDetail: ForecastDetails) -> ForecastDetailController {
        let vc = UIStoryboard(name: "ForecastDetail", bundle: nil).instantiateInitialViewController() as! ForecastDetailController
        vc.ForecastDetail = forecastDetail
        return vc
    }
    
    //MARK: class Variables
    var ForecastDetail: ForecastDetails!
    
    //MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerHeightConstraint: NSLayoutConstraint!
    
    //MARK: View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        configureContainerView()
    }
    
    override func viewWillLayoutSubviews() {
        view.layoutIfNeeded()
        containerHeightConstraint.constant = tableView.contentSize.height
    }
    
    
    //MARK: view Setup
    func configureContainerView() {
        containerView.layer.shadowOffset = CGSize(width: 0, height: 12)
        containerView.layer.shadowRadius = 35
        containerView.layer.shadowOpacity = 0.1
    }
    
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ForecastDetailItemCell", bundle: nil), forCellReuseIdentifier: "ForecastDetailItemCell")
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 1))
        tableView.estimatedRowHeight = 58
    }
}

extension ForecastDetailController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ForecastDetail.forecastDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastDetailItemCell", for: indexPath) as! ForecastDetailItemCell
        cell.configure(forecastDetail: ForecastDetail.forecastDetail[indexPath.row])
        return cell
    }
}
