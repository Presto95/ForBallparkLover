//
//  ViewController.swift
//  ForBallparkLover
//
//  Created by Presto on 2018. 2. 6..
//  Copyright © 2018년 Presto. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0
import DZNEmptyDataSet
import RealmSwift
import Kanna
import Alamofire
import SwiftyJSON

class MatchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var matchTime: UILabel!
    var dateString: String = ""
    var teams = [String]()
    var areas = [String]()
    var scheduleType: Int = -1
    var favoriteTeams = [String]()
    var favoriteAreas = [String]()
    var notFavoriteTeams = [String]()
    var notFavoriteAreas = [String]()
    var month: String = ""
    var day: String = ""
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        try! realm.write{
            realm.delete(realm.objects(Schedule.self))
        }
        _ = Database()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.view.backgroundColor = getTeamColor(Team(rawValue: UserDefaults.standard.string(forKey: "favoriteTeam") ?? "없음")!)
        resetNavigationView()
        tableView.register(UINib(nibName: "MatchCell", bundle: nil), forCellReuseIdentifier: "matchCell")
        tableView.rowHeight = 106
        reloadSchedule()
        reloadDataAtFavoriteTeamChanged()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickRankingButton(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Ranking", bundle: nil)
        let next = storyboard.instantiateViewController(withIdentifier: "RankingViewController") as! RankingViewController
        next.viewColor = view.backgroundColor!
        next.month = month
        next.day = day
        self.navigationController?.show(next, sender: self)
    }

    @IBAction func clickFavoriteButton(_ sender: UIBarButtonItem) {
        ActionSheetStringPicker.show(withTitle: "마이팀 설정", rows: ["KIA 타이거즈", "두산 베어스", "롯데 자이언츠", "NC 다이노스", "SK 와이번스", "LG 트윈스", "넥센 히어로즈", "한화 이글스", "삼성 라이온즈", "KT 위즈"], initialSelection: UserDefaults.standard.integer(forKey: "favoriteTeamIndex"), doneBlock: { (picker, index, value) in
            UserDefaults.standard.set(index, forKey: "favoriteTeamIndex")
            let team: String = String(describing: value!)
            UserDefaults.standard.set(team, forKey: "favoriteTeam")
            self.navigationItem.titleView = self.setTitle(title: team, subtitle: self.dateString)
            self.view.backgroundColor = getTeamColor(Team(rawValue: team)!)
            self.reloadDataAtFavoriteTeamChanged()
            self.resetNavigationView()
            if let defaults = UserDefaults(suiteName: "group.presto.ForBallparkLover"){
                let favoriteTeam = UserDefaults.standard.string(forKey: "favoriteTeam") ?? "없음"
                defaults.set(favoriteTeam, forKey: "favoriteTeam")
                if(self.areas.count == 0){
                    defaults.set(false, forKey: "isMatchExist")
                } else {
                    defaults.set(self.favoriteTeams[0], forKey: "awayTeam")
                    defaults.set(self.favoriteTeams[1], forKey: "homeTeam")
                    defaults.set(favoriteTeam, forKey: "favoriteTeam")
                    defaults.set(self.favoriteAreas[0], forKey: "area")
                    defaults.set(true, forKey: "isMatchExist")
                }
                defaults.synchronize()
            }
            self.tableView.reloadData()
        }, cancel: { ActionStringCancelBlock  in return }, origin: sender)
    }
    
    @IBAction func clickRefreshButton(_ sender: UIBarButtonItem) {
        //오늘자 경기 일정 새로고침
        resetNavigationView()
        reloadSchedule()
        tableView.reloadData()
        //1. 마이팀 설정 안되었을 때 마이팀 설정 해달라고 하는 문장 표시해야 함
        //2. 오늘 경기 없을 때 경기가 없다고 위젯에 표시해야함 안그러면 인덱스 넘어가는 오류 뜸
        if let defaults = UserDefaults(suiteName: "group.presto.ForBallparkLover"){
            let favoriteTeam = UserDefaults.standard.string(forKey: "favoriteTeam") ?? "없음"
            if(favoriteTeam == "없음"){
                defaults.set("없음", forKey: "favoriteTeam")
            }
            else if(self.areas.count == 0){
                defaults.set(false, forKey: "isMatchExist")
            } else {
                defaults.set(self.favoriteTeams[0], forKey: "awayTeam")
                defaults.set(self.favoriteTeams[1], forKey: "homeTeam")
                defaults.set(favoriteTeam, forKey: "favoriteTeam")
                defaults.set(self.favoriteAreas[0], forKey: "area")
                defaults.set(true, forKey: "isMatchExist")
            }
            defaults.synchronize()
        }
    }
    
    func reloadSchedule() {
        teams.removeAll()
        areas.removeAll()
        let tempDate = dateString.split(separator: " ")
        month = String(tempDate[0].characters.dropLast())
        day = String(tempDate[1].characters.dropLast())
        var queryDate: String = ""
        if(month.count == 1){
            queryDate += "0" + month
        }
        else{
            queryDate += month
        }
        if(day.count == 1){
            queryDate += "0" + day
        }
        else{
            queryDate += day
        }
        let object = realm.objects(Schedule.self).filter("date = '"+queryDate+"'")
        if(object.count != 0){
            let result = object.first!
            teams.append(result.awayTeam1)
            teams.append(result.homeTeam1)
            teams.append(result.awayTeam2)
            teams.append(result.homeTeam2)
            teams.append(result.awayTeam3)
            teams.append(result.homeTeam3)
            teams.append(result.awayTeam4)
            teams.append(result.homeTeam4)
            teams.append(result.awayTeam5)
            teams.append(result.homeTeam5)
            areas.append(result.area1)
            areas.append(result.area2)
            areas.append(result.area3)
            areas.append(result.area4)
            areas.append(result.area5)
            scheduleType = result.scheduleType
            tableView.separatorStyle = .singleLine
        }
        else{
            tableView.separatorStyle = .none
            scheduleType = -1
        }
        matchTime.text = { () -> String in
            switch(scheduleType){
            case 0:
                return "18:30"
            case 1:
                if(month == "7" || month == "8"){
                    return "18:00"
                }
                else{
                    return "17:00"
                }
            case 2:
                if(month == "6"){
                    return "17:00"
                }
                else if(month == "7" || month == "8"){
                    return "18:00"
                }
                else{
                    return "14:00"
                }
            case 3:
                return "14:00"
            default:
                return ""
            }
        }()
    }
    
    func reloadDataAtFavoriteTeamChanged() {
        favoriteTeams.removeAll()
        favoriteAreas.removeAll()
        notFavoriteAreas.removeAll()
        notFavoriteTeams.removeAll()
        let myTeam: String = UserDefaults.standard.string(forKey: "favoriteTeam") ?? "없음"
        if(!teams.contains(myTeam)){
            notFavoriteTeams = teams
            notFavoriteAreas = areas
        }
        else{
            let myTeamIndex: Int = teams.index(of: myTeam)!
            let myTeamCompetitionIndex: Int
            if(myTeamIndex % 2 == 0){
                myTeamCompetitionIndex = myTeamIndex + 1
                favoriteTeams.append(teams[myTeamIndex])
                favoriteTeams.append(teams[myTeamCompetitionIndex])
            }
            else{
                myTeamCompetitionIndex = myTeamIndex - 1
                favoriteTeams.append(teams[myTeamCompetitionIndex])
                favoriteTeams.append(teams[myTeamIndex])
            }
            favoriteAreas.append(areas[myTeamIndex / 2])
            for index in 0 ..< teams.count{
                if(index != myTeamIndex && index != myTeamCompetitionIndex){
                    notFavoriteTeams.append(teams[index])
                }
            }
            for index in 0 ..< teams.count / 2{
                if(index != myTeamIndex / 2){
                    notFavoriteAreas.append(areas[index])
                }
            }
        }
    }
    
    func resetNavigationView() {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "M월 d일 eeee"
        dateString = dateFormatter.string(from: today)
        self.navigationItem.titleView = setTitle(title: UserDefaults.standard.string(forKey: "favoriteTeam") ?? "마이팀 설정 ->", subtitle: dateString)
        let complementaryColor = getComplementaryForColor(color: self.view.backgroundColor!)
        self.navigationItem.leftBarButtonItem?.tintColor = complementaryColor
        self.navigationItem.rightBarButtonItems?[0].tintColor = complementaryColor
        self.navigationItem.rightBarButtonItems?[1].tintColor = complementaryColor
        self.navigationItem.backBarButtonItem?.tintColor = complementaryColor
    }
    
    func setTitle(title:String, subtitle:String) -> UIView {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: -2, width: 0, height: 0))
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.text = title
        titleLabel.sizeToFit()
        let subtitleLabel = UILabel(frame: CGRect(x: 0, y: 18, width: 0, height: 0))
        subtitleLabel.backgroundColor = UIColor.clear
        subtitleLabel.font = UIFont.systemFont(ofSize: 12)
        subtitleLabel.text = subtitle
        subtitleLabel.sizeToFit()
        if(title == "두산 베어스" || title == "KT 위즈"){
            titleLabel.textColor = .white
            subtitleLabel.textColor = .white
            matchTime.textColor = .white
            UIApplication.shared.statusBarStyle = .lightContent
        }
        else{
            titleLabel.textColor = .black
            subtitleLabel.textColor = .black
            matchTime.textColor = .black
            UIApplication.shared.statusBarStyle = .default
        }
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: max(titleLabel.frame.size.width, subtitleLabel.frame.size.width), height: 30))
        titleView.addSubview(titleLabel)
        titleView.addSubview(subtitleLabel)
        let widthDiff = subtitleLabel.frame.size.width - titleLabel.frame.size.width
        if widthDiff < 0 {
            let newX = widthDiff / 2
            subtitleLabel.frame.origin.x = abs(newX)
        } else {
            let newX = widthDiff / 2
            titleLabel.frame.origin.x = newX
        }
        return titleView
    }
}

extension MatchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MatchViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchCell") as! MatchCell
        let favoriteTeam = UserDefaults.standard.string(forKey: "favoriteTeam") ?? "없음"
        let awayTeamNameCell: UILabel = cell.awayTeamName!
        let homeTeamNameCell: UILabel = cell.homeTeamName!
        if(indexPath.section == 0){
            awayTeamNameCell.text = favoriteTeams[indexPath.row * 2]
            homeTeamNameCell.text = favoriteTeams[indexPath.row * 2 + 1]
            cell.matchArea.text = favoriteAreas[indexPath.row]
            
        }
        else{
            awayTeamNameCell.text = notFavoriteTeams[indexPath.row * 2]
            homeTeamNameCell.text = notFavoriteTeams[indexPath.row * 2 + 1]
            cell.matchArea.text = notFavoriteAreas[indexPath.row]
        }
        let awayTeamName: String = awayTeamNameCell.text!
        let homeTeamName: String = homeTeamNameCell.text!
        awayTeamNameCell.layer.borderWidth = 2
        homeTeamNameCell.layer.borderWidth = 2
        awayTeamNameCell.layer.borderColor = getTeamColor(Team(rawValue: awayTeamName)!).cgColor
        homeTeamNameCell.layer.borderColor = getTeamColor(Team(rawValue: homeTeamName)!).cgColor
        awayTeamNameCell.layer.cornerRadius = 5
        homeTeamNameCell.layer.cornerRadius = 5
        if(awayTeamName == favoriteTeam){
            cell.awayTeamFavorite.image = UIImage(named: "FavoriteButton")
        } else{
            cell.awayTeamFavorite.image = UIImage()
        }
        if(homeTeamName == favoriteTeam){
            cell.homeTeamFavorite.image = UIImage(named: "FavoriteButton")
        } else{
            cell.homeTeamFavorite.image = UIImage()
        }
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if(teams.isEmpty){
            return 0
        }
        return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            return "    마이팀"
        } else{
            return "    타구장"
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(teams.isEmpty){
            return 0
        }
        if(section == 0){
            return favoriteTeams.count / 2
        } else{
            return notFavoriteTeams.count / 2
        }
    }
}

extension MatchViewController: DZNEmptyDataSetDelegate {
    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView!) -> Bool {
        return false
    }
}
extension MatchViewController: DZNEmptyDataSetSource {
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "iconInfo")
    }
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "오늘은 경기가 없습니다.", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 20)])
    }
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "저도 야구 보고 싶어요...😢", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14)])
    }
}





