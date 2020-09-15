//
//  ForecastView.swift
//  WeatheriOS
//
//  Created by Rezo Joglidze on 9/14/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import UIKit
import Viperit
import Parchment

//MARK: ForecastView Class
final class ForecastView: HomeViewController {

    var viewControllers: [UIViewController] = []

    //MARK: class Variables
    let pageViewController = PagingViewController()
    var forecastDetails: [ForecastDetails] = []
    //MARK: IBOutlets
    
    //MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePageVC()
    }
    
    //MARK: View setup
    
    func configurePageVC() {
        pageViewController.indicatorColor = Constants.Colors.main
        pageViewController.selectedTextColor = Constants.Colors.main
        pageViewController.selectedFont = UIFont.main(type: .medium, size: 15)
        pageViewController.font = UIFont.main(type: .medium, size: 15)
        pageViewController.menuHorizontalAlignment = .left
        pageViewController.dataSource = self
        pageViewController.menuItemSize = .selfSizing(estimatedWidth: 30, height: 40)
        self.addChild(pageViewController)
        self.view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pageViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
}

//MARK: - ForecastView API
extension ForecastView: ForecastViewApi {
    func updateView(forecastDetails: [ForecastDetails]) {
        self.stopLoading()
        self.forecastDetails = forecastDetails
        
        let vc = ForecastDetailController.getInstance(with: forecastDetails[0])
        let vc1 = ForecastDetailController.getInstance(with: forecastDetails[1])
        let vc2 = ForecastDetailController.getInstance(with: forecastDetails[2])
        let vc3 = ForecastDetailController.getInstance(with: forecastDetails[3])
        let vc4 = ForecastDetailController.getInstance(with: forecastDetails[4])

        viewControllers.append(vc)
        viewControllers.append(vc1)
        viewControllers.append(vc2)
        viewControllers.append(vc3)
        viewControllers.append(vc4)

        pageViewController.reloadData()
        pageViewController.select(index: 0, animated: true)
    }
}


//MARK: PagingViewControllerDataSource

extension ForecastView: PagingViewControllerDataSource {
    
    func numberOfViewControllers(in pagingViewController: PagingViewController) -> Int {
        return viewControllers.count
    }
    
    func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
        return viewControllers[index]
    }
    
    func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
        let title = forecastDetails[index].day
        return PagingIndexItem(index: index, title: title)
    }
}

// MARK: - ForecastView Viper Components API
private extension ForecastView {
    var presenter: ForecastPresenterApi {
        return _presenter as! ForecastPresenterApi
    }
    var displayData: ForecastDisplayData {
        return _displayData as! ForecastDisplayData
    }
}
