//
//  LTSimpleTestThreeVC.swift
//  LTScrollView
//
//  Created by 高刘通 on 2017/11/27.
//  Copyright © 2017年 LT. All rights reserved.
//
//  如有疑问，欢迎联系本人QQ: 1282990794
//
//  ScrollView嵌套ScrolloView解决方案（初级、进阶)， 支持OC/Swift
//
//  github地址: https://github.com/gltwy/LTScrollView
//
//  clone地址:  https://github.com/gltwy/LTScrollView.git
//

import UIKit
import MJRefresh

class LTSimpleTestThreeVC: UIViewController, LTTableViewProtocal {
    
    private lazy var tableView: UITableView = {
        print(UIScreen.main.bounds.height)
        let H: CGFloat = glt_iphoneX ? (view.bounds.height - 44 - 64 - 24 - 34) : view.bounds.height - 44 - 64
        let tableView = tableViewConfig(CGRect(x: 0, y: 44, width: view.bounds.width, height: H), self, self, nil)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(tableView)
        self.automaticallyAdjustsScrollViewInsets = false
        glt_scrollView = tableView
        reftreshData()
    }
}

extension LTSimpleTestThreeVC {
    fileprivate func reftreshData()  {
        tableView.mj_footer = MJRefreshBackNormalFooter {[weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                print("上拉加载更多数据")
                self?.tableView.mj_footer.endRefreshing()
            })
        }
    }
}


extension LTSimpleTestThreeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cellWithTableView(tableView)
        cell.textLabel?.text = "第 \(indexPath.row + 1) 行"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了第\(indexPath.row + 1)行")
    }
}


