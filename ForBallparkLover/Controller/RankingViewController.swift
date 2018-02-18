//
//  RankingViewController.swift
//  ForBallparkLover
//
//  Created by Presto on 2018. 2. 12..
//  Copyright © 2018년 Presto. All rights reserved.
//


//3월 24일 정규시즌 개막!
//3월 25일부터 팀순위 표시

import UIKit
import DZNEmptyDataSet
import Kanna
import MBProgressHUD

class RankingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewColor: UIColor = UIColor()
    var teams = [String]()
    var matchCounts = [String]()
    var winCounts = [String]()
    var loseCounts = [String]()
    var drawCounts = [String]()
    var winRate = [String]()
    var gameDistance = [String]()
    var month: String = ""
    var day: String = ""
    let url = URL(string: "http://sports.news.naver.com/kbaseball/record/index.nhn?category=kbo")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myTeam = UserDefaults.standard.string(forKey: "favoriteTeam") ?? "없음"
        view.backgroundColor = viewColor
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage=UIImage()
        navigationController?.navigationBar.isTranslucent=true
        navigationItem.title = "순위"
        if(myTeam == "두산 베어스" || myTeam == "KT 위즈"){
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        }
        else{
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
        }
        
        tableView.register(UINib(nibName: "RankingCell", bundle: nil), forCellReuseIdentifier: "rankingCell")

        //개막 후 3월 25일부터 랭킹 정보 파싱
        guard Int(month)! <= 3, Int(day)! <= 25 else {
            do{
                let doc = try HTML(url: url!, encoding: .utf8)
                let parsed = doc.xpath("//tbody[@id='regularTeamRecordList_table']//td//span")
                for i in 0..<10{
                    let index = i * 10
                    teams.append(parsed[index].text!)
                    matchCounts.append(parsed[index + 1].text!)
                    winCounts.append(parsed[index + 2].text!)
                    loseCounts.append(parsed[index + 3].text!)
                    drawCounts.append(parsed[index + 4].text!)
                    gameDistance.append(parsed[index + 5].text!)
                }
                let parsed2 = doc.xpath("//tbody[@id='regularTeamRecordList_table']//td//strong")
                for i in parsed2{
                    winRate.append(i.text!)
                }
            }
            catch{
                UIAlertController.alert(message: "통신 실패", cancelString: "확인").show(self)
                dismiss(animated: true, completion: nil)
            }
            return
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension RankingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension RankingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rankingCell") as! RankingCell
        UserDefaults.standard.set(indexPath.row + 1, forKey: teams[indexPath.row] + "ranking")
        cell.ranking.text = String(indexPath.row + 1)
        cell.teamName.text = teams[indexPath.row]
        cell.winningMatch.text = winCounts[indexPath.row]
        cell.losingMatch.text = loseCounts[indexPath.row]
        cell.drawMatch.text = drawCounts[indexPath.row]
        cell.distance.text = gameDistance[indexPath.row]
        cell.rate.text = winRate[indexPath.row]
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(teams.isEmpty){
            return 0
        }
        else{
            return 10
        }
    }
}
extension RankingViewController: DZNEmptyDataSetDelegate {
    func emptyDataSetDidAppear(_ scrollView: UIScrollView!) {
        tableView.separatorStyle = .none
    }
    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView!) -> Bool {
        return false
    }
}
extension RankingViewController: DZNEmptyDataSetSource {
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "iconInfo")
    }
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "시즌 개막 전입니다.", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 20)])
    }
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "2018 KBO 리그 개막일은 3월 24일입니다.", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14)])
    }
}
