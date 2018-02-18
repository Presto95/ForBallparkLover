//
//  Calendar.swift
//  ForBallparkLover
//
//  Created by Presto on 2018. 2. 15..
//  Copyright © 2018년 Presto. All rights reserved.
//

import RealmSwift

class Schedule: Object {
    @objc dynamic var date: String = ""
    @objc dynamic var scheduleType: Int = 0
    @objc dynamic var awayTeam1: String = ""
    @objc dynamic var homeTeam1: String = ""
    @objc dynamic var area1: String = ""
    @objc dynamic var awayTeam2: String = ""
    @objc dynamic var homeTeam2: String = ""
    @objc dynamic var area2: String = ""
    @objc dynamic var awayTeam3: String = ""
    @objc dynamic var homeTeam3: String = ""
    @objc dynamic var area3: String = ""
    @objc dynamic var awayTeam4: String = ""
    @objc dynamic var homeTeam4: String = ""
    @objc dynamic var area4: String = ""
    @objc dynamic var awayTeam5: String = ""
    @objc dynamic var homeTeam5: String = ""
    @objc dynamic var area5: String = ""
}

/*
 *야구경기시간시작
 
 평일 : 1830 고정
 
 토요일(파란날)
 - 개막전 3월 24일 1400
 - 7, 8월 1800
 - 나머지 1700
 
 일요일/공휴일(빨간날)
 - 3, 4, 5, 9월 14시
 - 6월 17시
 - 7, 8월 18시
 */

