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
    
    //MARK: View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    //MARK: view Setup
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "ForecastDetailItemCell", bundle: nil), forCellReuseIdentifier: "ForecastDetailItemCell")
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
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 60
//    }
}
