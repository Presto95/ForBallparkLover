//
//  TodayViewController.swift
//  ForBallparkLoverWidget
//
//  Created by Presto on 2018. 2. 12..
//  Copyright © 2018년 Presto. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var dust: UILabel!
    @IBOutlet weak var startImage: UIImageView!
    @IBOutlet weak var endImage: UIImageView!
    @IBOutlet weak var dustImage: UIImageView!
    @IBOutlet weak var separator: UILabel!
    @IBOutlet weak var vs: UILabel!
    @IBOutlet weak var labelNoData: UILabel!
    @IBOutlet weak var awayTeam: UILabel!
    @IBOutlet weak var homeTeam: UILabel!
    @IBOutlet weak var area: UILabel!
    @IBOutlet weak var awayTeamFavorite: UIImageView!
    @IBOutlet weak var homeTeamFavorite: UIImageView!
    let defaults = UserDefaults(suiteName: "group.presto.ForBallparkLover")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults?.synchronize()
        let favoriteTeam = defaults?.string(forKey: "favoriteTeam") ?? "없음"
        if(favoriteTeam == "없음"){
            hideData()
            labelNoData.text = "앱에서 마이팀을 설정해 주세요."
            
        }
        else if(!(defaults?.bool(forKey: "isMatchExist") ?? false)){
            hideData()
            labelNoData.text = "오늘은 경기가 없습니다."
        }
        else{
            showData()
            awayTeam.text = defaults?.string(forKey: "awayTeam")
            homeTeam.text = defaults?.string(forKey: "homeTeam")
            awayTeam.layer.borderWidth = 2
            homeTeam.layer.borderWidth = 2
            awayTeam.layer.cornerRadius = 5
            homeTeam.layer.cornerRadius = 5
            awayTeam.layer.borderColor = getTeamColor(awayTeam.text!)
            homeTeam.layer.borderColor = getTeamColor(homeTeam.text!)
            area.text = defaults?.string(forKey: "area")
            if(favoriteTeam == awayTeam.text){
                awayTeamFavorite.image = UIImage(named: "FavoriteButton")
            }
            else{
                homeTeamFavorite.image = UIImage(named: "FavoriteButton")
            }
        }
        // Do any additional setup after loading the view from its nib.
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    func widgetMarginInsets(forProposedMarginInsets defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func hideData() {
        labelNoData.isHidden = false
        awayTeam.isHidden = true
        homeTeam.isHidden = true
        vs.isHidden = true
        homeTeamFavorite.isHidden = true
        awayTeamFavorite.isHidden = true
        separator.isHidden = true
        area.isHidden = true
        dustImage.isHidden = true
        endImage.isHidden = true
        startImage.isHidden = true
        dust.isHidden = true
        endTime.isHidden = true
        startTime.isHidden = true
    }
    func showData() {
        labelNoData.isHidden = true
        awayTeam.isHidden = false
        homeTeam.isHidden = false
        vs.isHidden = false
        homeTeamFavorite.isHidden = false
        awayTeamFavorite.isHidden = false
        separator.isHidden = false
        area.isHidden = false
        dustImage.isHidden = false
        endImage.isHidden = false
        startImage.isHidden = false
        dust.isHidden = false
        endTime.isHidden = false
        startTime.isHidden = false
    }
    func getTeamColor(_ name: String) -> CGColor {
        switch(name){
        case "KIA 타이거즈":
            return UIColor(red: 178/255, green: 20/255, blue: 40/255, alpha: 1).cgColor
        case "두산 베어스":
            return UIColor(red: 19/255, green: 19/255, blue: 47/255, alpha: 1).cgColor
        case "롯데 자이언츠":
            return UIColor(red: 241/255, green: 111/255, blue: 48/255, alpha: 1).cgColor
        case "NC 다이노스":
            return UIColor(red: 28/255, green: 72/255, blue: 121/255, alpha: 1).cgColor
        case "SK 와이번스":
            return UIColor(red: 229/255, green: 25/255, blue: 56/255, alpha: 1).cgColor
        case "LG 트윈스":
            return UIColor(red: 188/255, green: 15/255, blue: 58/255, alpha: 1).cgColor
        case "넥센 히어로즈":
            return UIColor(red: 108/255, green: 18/255, blue: 32/255, alpha: 1).cgColor
        case "한화 이글스":
            return UIColor(red: 241/255, green: 115/255, blue: 48/255, alpha: 1).cgColor
        case "삼성 라이온즈":
            return UIColor(red: 14/255, green: 102/255, blue: 176/255, alpha: 1).cgColor
        case "KT 위즈":
            return UIColor(red: 35/255, green: 31/255, blue: 32/255, alpha: 1).cgColor
        default:
            return UIColor.white.cgColor
        }
    }
}
