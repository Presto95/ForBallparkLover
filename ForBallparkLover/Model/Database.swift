//
//  Database.swift
//  ForBallparkLover
//
//  Created by Presto on 2018. 2. 15..
//  Copyright © 2018년 Presto. All rights reserved.
//

import RealmSwift

class Database {
    let realm: Realm
    let kia = Team.kia.rawValue
    let doosan = Team.doosan.rawValue
    let lotte = Team.lotte.rawValue
    let nc = Team.nc.rawValue
    let sk = Team.sk.rawValue
    let lg = Team.lg.rawValue
    let nexen = Team.nexen.rawValue
    let hanwha = Team.hanwha.rawValue
    let samsung = Team.samsung.rawValue
    let kt = Team.kt.rawValue
    let jamsil = AreaPosition.jamsil.rawValue
    let gwangju = AreaPosition.gwangju.rawValue
    let masan = AreaPosition.masan.rawValue
    let suwon = AreaPosition.suwon.rawValue
    let sajik = AreaPosition.sajik.rawValue
    let daejeon = AreaPosition.daejeon.rawValue
    let daegu = AreaPosition.daegu.rawValue
    let gochuk = AreaPosition.gochuk.rawValue
    let moonhak = AreaPosition.moonhak.rawValue
    let black = ScheduleType.black.rawValue
    let blue = ScheduleType.blue.rawValue
    let red = ScheduleType.red.rawValue
    let opening = ScheduleType.opening.rawValue
    
    
    init() {
        realm = try! Realm()
        //데이터베이스 하드코딩흐흑
        //테스트케이스
        //addSchedule("0219", opening, samsung, doosan, jamsil, hanwha, nexen, gochuk, lotte, sk, moonhak, kt, kia, gwangju, lg, nc, masan)
        //진짜
        addSchedule("0324", opening, samsung, doosan, jamsil, hanwha, nexen, gochuk, lotte, sk, moonhak, kt, kia, gwangju, lg, nc, masan)
        addSchedule("0325", red, samsung, doosan, jamsil, hanwha, nexen, gochuk, lotte, sk, moonhak, kt, kia, gwangju, lg, nc, masan)
        addSchedule("0327", black, lotte, doosan, jamsil, lg, nexen, gochuk, kt, sk, moonhak, samsung, kia, gwangju, hanwha, nc, masan)
        addSchedule("0328", black, lotte, doosan, jamsil, lg, nexen, gochuk, kt, sk, moonhak, samsung, kia, gwangju, hanwha, nc, masan)
        addSchedule("0329", black, lotte, doosan, jamsil, lg, nexen, gochuk, kt, sk, moonhak, samsung, kia, gwangju, hanwha, nc, masan)
        addSchedule("0330", black, kia, lg, jamsil, doosan, kt, suwon, sk, hanwha, daejeon, nexen, samsung, daegu, nc, lotte, sajik)
        addSchedule("0331", blue, kia, lg, jamsil, doosan, kt, suwon, sk, hanwha, daejeon, nexen, samsung, daegu, nc, lotte, sajik)
        addSchedule("0401", red, kia, lg, jamsil, doosan, kt, suwon, sk, hanwha, daejeon, nexen, samsung, daegu, nc, lotte, sajik)
        addSchedule("0403", black, lg, doosan, jamsil, kt, nexen, gochuk, kia, sk, moonhak, lotte, hanwha, daejeon, samsung, nc, masan)
        addSchedule("0404", black, lg, doosan, jamsil, kt, nexen, gochuk, kia, sk, moonhak, lotte, hanwha, daejeon, samsung, nc, masan)
        addSchedule("0405", black, lg, doosan, jamsil, kt, nexen, gochuk, kia, sk, moonhak, lotte, hanwha, daejeon, samsung, nc, masan)
        addSchedule("0406", black, nc, doosan, jamsil, samsung, sk, moonhak, hanwha, kt, suwon, nexen, kia, gwangju, lg, lotte, sajik)
        addSchedule("0407", blue, nc, doosan, jamsil, samsung, sk, moonhak, hanwha, kt, suwon, nexen, kia, gwangju, lg, lotte, sajik)
        addSchedule("0408", red, nc, doosan, jamsil, samsung, sk, moonhak, hanwha, kt, suwon, nexen, kia, gwangju, lg, lotte, sajik)
        addSchedule("0410", black, sk, lg, jamsil, kia, hanwha, daejeon, doosan, samsung, daegu, nexen, lotte, sajik, kt, nc, masan)
        addSchedule("0411", black, sk, lg, jamsil, kia, hanwha, daejeon, doosan, samsung, daegu, nexen, lotte, sajik, kt, nc, masan)
        addSchedule("0412", black, sk, lg, jamsil, kia, hanwha, daejeon, doosan, samsung, daegu, nexen, lotte, sajik, kt, nc, masan)
        addSchedule("0413", black, kt, lg, jamsil, doosan, nexen, gochuk, nc, sk, moonhak, samsung, hanwha, daejeon, lotte, kia, gwangju)
        addSchedule("0414", blue, kt, lg, jamsil, doosan, nexen, gochuk, nc, sk, moonhak, samsung, hanwha, daejeon, lotte, kia, gwangju)
        addSchedule("0415", red, kt, lg, jamsil, doosan, nexen, gochuk, nc, sk, moonhak, samsung, hanwha, daejeon, lotte, kia, gwangju)
        addSchedule("0417", black, hanwha, doosan, jamsil, nc, nexen, gochuk, sk, kt, suwon, lg, kia, gwangju, samsung, lotte, sajik)
        addSchedule("0418", black, hanwha, doosan, jamsil, nc, nexen, gochuk, sk, kt, suwon, lg, kia, gwangju, samsung, lotte, sajik)
        addSchedule("0419", black, hanwha, doosan, jamsil, nc, nexen, gochuk, sk, kt, suwon, lg, kia, gwangju, samsung, lotte, sajik)
        addSchedule("0420", black, kia, doosan, jamsil, nexen, hanwha, daejeon, kt, samsung, daegu, sk, lotte, sajik, lg, nc, masan)
        addSchedule("0421", blue, kia, doosan, jamsil, nexen, hanwha, daejeon, kt, samsung, daegu, sk, lotte, sajik, lg, nc, masan)
        addSchedule("0422", red, kia, doosan, jamsil, nexen, hanwha, daejeon, kt, samsung, daegu, sk, lotte, sajik, lg, nc, masan)
        addSchedule("0424", black, nexen, lg, jamsil, doosan, sk, moonhak, lotte, kt, suwon, nc, samsung, daegu, hanwha, kia, gwangju)
        addSchedule("0425", black, nexen, lg, jamsil, doosan, sk, moonhak, lotte, kt, suwon, nc, samsung, daegu, hanwha, kia, gwangju)
        addSchedule("0426", black, nexen, lg, jamsil, doosan, sk, moonhak, lotte, kt, suwon, nc, samsung, daegu, hanwha, kia, gwangju)
        addSchedule("0427", black, samsung, lg, jamsil, sk, nexen, gochuk, kia, kt, suwon, hanwha, lotte, sajik, doosan, nc, masan)
        addSchedule("0428", blue, samsung, lg, jamsil, sk, nexen, gochuk, kia, kt, suwon, hanwha, lotte, sajik, doosan, nc, masan)
        addSchedule("0429", red, samsung, lg, jamsil, sk, nexen, gochuk, kia, kt, suwon, hanwha, lotte, sajik, doosan, nc, masan)
        addSchedule("0501", black, kt, doosan, jamsil, lg, hanwha, daejeon, sk, samsung, daegu, kia, lotte, sajik, nexen, nc, masan)
        addSchedule("0502", black, kt, doosan, jamsil, lg, hanwha, daejeon, sk, samsung, daegu, kia, lotte, sajik, nexen, nc, masan)
        addSchedule("0503", black, kt, doosan, jamsil, lg, hanwha, daejeon, sk, samsung, daegu, kia, lotte, sajik, nexen, nc, masan)
        addSchedule("0504", black, doosan, lg, jamsil, lotte, sk, moonhak, nexen, kt, suwon, hanwha, samsung, daegu, nc, kia, gwangju)
        addSchedule("0505", red, doosan, lg, jamsil, lotte, sk, moonhak, nexen, kt, suwon, hanwha, samsung, daegu, nc, kia, gwangju)
        addSchedule("0506", red, doosan, lg, jamsil, lotte, sk, moonhak, nexen, kt, suwon, hanwha, samsung, daegu, nc, kia, gwangju)
        addSchedule("0508", black, lotte, lg, jamsil, hanwha, nexen, gochuk, samsung, kt, suwon, doosan, kia, gwangju, sk, nc, masan)
        addSchedule("0509", black, lotte, lg, jamsil, hanwha, nexen, gochuk, samsung, kt, suwon, doosan, kia, gwangju, sk, nc, masan)
        addSchedule("0510", black, lotte, lg, jamsil, hanwha, nexen, gochuk, samsung, kt, suwon, doosan, kia, gwangju, sk, nc, masan)
        addSchedule("0511", black, nexen, doosan, jamsil, lg, sk, moonhak, nc, hanwha, daejeon, kia, samsung, daegu, kt, lotte, sajik)
        addSchedule("0512", blue, nexen, doosan, jamsil, lg, sk, moonhak, nc, hanwha, daejeon, kia, samsung, daegu, kt, lotte, sajik)
        addSchedule("0513", red, nexen, doosan, jamsil, lg, sk, moonhak, nc, hanwha, daejeon, kia, samsung, daegu, kt, lotte, sajik)
        addSchedule("0515", black, sk, doosan, jamsil, kia, nexen, gochuk, kt, hanwha, daejeon, lg, samsung, daegu, lotte, nc, masan)
        addSchedule("0516", black, sk, doosan, jamsil, kia, nexen, gochuk, kt, hanwha, daejeon, lg, samsung, daegu, lotte, nc, masan)
        addSchedule("0517", black, sk, doosan, jamsil, kia, nexen, gochuk, kt, hanwha, daejeon, lg, samsung, daegu, lotte, nc, masan)
        addSchedule("0518", black, hanwha, lg, jamsil, samsung, nexen, gochuk, nc, kt, suwon, sk, kia, gwangju, doosan, lotte, sajik)
        addSchedule("0519", blue, hanwha, lg, jamsil, samsung, nexen, gochuk, nc, kt, suwon, sk, kia, gwangju, doosan, lotte, sajik)
        addSchedule("0520", red, hanwha, lg, jamsil, samsung, nexen, gochuk, nc, kt, suwon, sk, kia, gwangju, doosan, lotte, sajik)
        addSchedule("0522", red, nc, lg, jamsil, nexen, sk, moonhak, doosan, hanwha, daejeon, lotte, samsung, daegu, kt, kia, gwangju)
        addSchedule("0523", black, nc, lg, jamsil, nexen, sk, moonhak, doosan, hanwha, daejeon, lotte, samsung, daegu, kt, kia, gwangju)
        addSchedule("0524", black, nc, lg, jamsil, nexen, sk, moonhak, doosan, hanwha, daejeon, lotte, samsung, daegu, kt, kia, gwangju)
        addSchedule("0525", black, samsung, doosan, jamsil, lotte, nexen, gochuk, hanwha, sk, moonhak, lg, kt, suwon, kia, nc, masan)
        addSchedule("0526", blue, samsung, doosan, jamsil, lotte, nexen, gochuk, hanwha, sk, moonhak, lg, kt, suwon, kia, nc, masan)
        addSchedule("0527", red, samsung, doosan, jamsil, lotte, nexen, gochuk, hanwha, sk, moonhak, lg, kt, suwon, kia, nc, masan)
        addSchedule("0529", black, sk, doosan, jamsil, nc, hanwha, daejeon, kt, samsung, daegu, nexen, kia, gwangju, lg, lotte, sajik)
        addSchedule("0530", black, sk, doosan, jamsil, nc, hanwha, daejeon, kt, samsung, daegu, nexen, kia, gwangju, lg, lotte, sajik)
        addSchedule("0531", black, sk, doosan, jamsil, nc, hanwha, daejeon, kt, samsung, daegu, nexen, kia, gwangju, lg, lotte, sajik)
        addSchedule("0601", black, nexen, lg, jamsil, kt, sk, moonhak, doosan, kia, gwangju, hanwha, lotte, sajik, samsung, nc, masan)
        addSchedule("0602", blue, nexen, lg, jamsil, kt, sk, moonhak, doosan, kia, gwangju, hanwha, lotte, sajik, samsung, nc, masan)
        addSchedule("0603", red, nexen, lg, jamsil, kt, sk, moonhak, doosan, kia, gwangju, hanwha, lotte, sajik, samsung, nc, masan)
        addSchedule("0605", black, hanwha, lg, jamsil, doosan, nexen, gochuk, samsung, sk, moonhak, kia, kt, suwon, lotte, nc, masan)
        addSchedule("0606", red, hanwha, lg, jamsil, doosan, nexen, gochuk, samsung, sk, moonhak, kia, kt, suwon, lotte, nc, masan)
        addSchedule("0607", black, hanwha, lg, jamsil, doosan, nexen, gochuk, samsung, sk, moonhak, kia, kt, suwon, lotte, nc, masan)
        addSchedule("0608", black, nc, doosan, jamsil, nexen, kt, suwon, sk, hanwha, daejeon, lg, samsung, daegu, kia, lotte, sajik)
        addSchedule("0609", blue, nc, doosan, jamsil, nexen, kt, suwon, sk, hanwha, daejeon, lg, samsung, daegu, kia, lotte, sajik)
        addSchedule("0610", red, nc, doosan, jamsil, nexen, kt, suwon, sk, hanwha, daejeon, lg, samsung, daegu, kia, lotte, sajik)
        addSchedule("0612", black, kt, doosan, jamsil, hanwha, nexen, gochuk, sk, kia, gwangju, samsung, lotte, sajik, lg, nc, masan)
        addSchedule("0613", red, kt, doosan, jamsil, hanwha, nexen, gochuk, sk, kia, gwangju, samsung, lotte, sajik, lg, nc, masan)
        addSchedule("0614", black, kt, doosan, jamsil, hanwha, nexen, gochuk, sk, kia, gwangju, samsung, lotte, sajik, lg, nc, masan)
        addSchedule("0615", black, kia, lg, jamsil, samsung, nexen, gochuk, lotte, sk, moonhak, doosan, hanwha, daejeon, kt, nc, masan)
        addSchedule("0616", blue, kia, lg, jamsil, samsung, nexen, gochuk, lotte, sk, moonhak, doosan, hanwha, daejeon, kt, nc, masan)
        addSchedule("0617", red, kia, lg, jamsil, samsung, nexen, gochuk, lotte, sk, moonhak, doosan, hanwha, daejeon, kt, nc, masan)
        addSchedule("0619", black, nexen, doosan, jamsil, lotte, kt, suwon, lg, hanwha, daejeon, sk, samsung, daegu, nc, kia, gwangju)
        addSchedule("0620", black, nexen, doosan, jamsil, lotte, kt, suwon, lg, hanwha, daejeon, sk, samsung, daegu, nc, kia, gwangju)
        addSchedule("0621", black, nexen, doosan, jamsil, lotte, kt, suwon, lg, hanwha, daejeon, sk, samsung, daegu, nc, kia, gwangju)
        addSchedule("0622", black, lotte, lg, jamsil, kia, nexen, gochuk, sk, kt, suwon, doosan, samsung, daegu, hanwha, nc, masan)
        addSchedule("0623", blue, lotte, lg, jamsil, kia, nexen, gochuk, sk, kt, suwon, doosan, samsung, daegu, hanwha, nc, masan)
        addSchedule("0624", red, lotte, lg, jamsil, kia, nexen, gochuk, sk, kt, suwon, doosan, samsung, daegu, hanwha, nc, masan)
        addSchedule("0626", black, kt, lg, jamsil, kia, sk, moonhak, samsung, hanwha, daejeon, nexen, lotte, sajik, doosan, nc, masan)
        addSchedule("0627", black, kt, lg, jamsil, kia, sk, moonhak, samsung, hanwha, daejeon, nexen, lotte, sajik, doosan, nc, masan)
        addSchedule("0628", black, kt, lg, jamsil, kia, sk, moonhak, samsung, hanwha, daejeon, nexen, lotte, sajik, doosan, nc, masan)
        addSchedule("0629", black, kia, doosan, jamsil, lg, sk, moonhak, nc, kt, suwon, lotte, hanwha, daejeon, nexen, samsung, daegu)
        addSchedule("0630", blue, kia, doosan, jamsil, lg, sk, moonhak, nc, kt, suwon, lotte, hanwha, daejeon, nexen, samsung, daegu)
        addSchedule("0701", red, kia, doosan, jamsil, lg, sk, moonhak, nc, kt, suwon, lotte, hanwha, daejeon, nexen, samsung, daegu)
        addSchedule("0703", black, nc, lg, jamsil, sk, nexen, gochuk, samsung, kt, suwon, hanwha, kia, gwangju, doosan, lotte, sajik)
        addSchedule("0704", black, nc, lg, jamsil, sk, nexen, gochuk, samsung, kt, suwon, hanwha, kia, gwangju, doosan, lotte, sajik)
        addSchedule("0705", black, nc, lg, jamsil, sk, nexen, gochuk, samsung, kt, suwon, hanwha, kia, gwangju, doosan, lotte, sajik)
        addSchedule("0706", black, samsung, doosan, jamsil, nc, nexen, gochuk, hanwha, sk, moonhak, lg, kia, gwangju, kt, lotte, sajik)
        addSchedule("0707", blue, samsung, doosan, jamsil, nc, nexen, gochuk, hanwha, sk, moonhak, lg, kia, gwangju, kt, lotte, sajik)
        addSchedule("0708", red, samsung, doosan, jamsil, nc, nexen, gochuk, hanwha, sk, moonhak, lg, kia, gwangju, kt, lotte, sajik)
        addSchedule("0710", black, sk, lg, jamsil, doosan, kt, suwon, nexen, hanwha, daejeon, lotte, samsung, daegu, kia, nc, masan)
        addSchedule("0711", black, sk, lg, jamsil, doosan, kt, suwon, nexen, hanwha, daejeon, lotte, samsung, daegu, kia, nc, masan)
        addSchedule("0712", black, sk, lg, jamsil, doosan, kt, suwon, nexen, hanwha, daejeon, lotte, samsung, daegu, kia, nc, masan)
        addSchedule("0717", black, lotte, doosan, jamsil, lg, nexen, gochuk, nc, sk, moonhak, hanwha, kt, suwon, samsung, kia, gwangju)
        addSchedule("0718", black, lotte, doosan, jamsil, lg, nexen, gochuk, nc, sk, moonhak, hanwha, kt, suwon, samsung, kia, gwangju)
        addSchedule("0719", black, lotte, doosan, jamsil, lg, nexen, gochuk, nc, sk, moonhak, hanwha, kt, suwon, samsung, kia, gwangju)
        addSchedule("0720", black, doosan, lg, jamsil, hanwha, samsung, daegu, kt, kia, gwangju, sk, lotte, sajik, nexen, nc, masan)
        addSchedule("0721", blue, doosan, lg, jamsil, hanwha, samsung, daegu, kt, kia, gwangju, sk, lotte, sajik, nexen, nc, masan)
        addSchedule("0722", red, doosan, lg, jamsil, hanwha, samsung, daegu, kt, kia, gwangju, sk, lotte, sajik, nexen, nc, masan)
        addSchedule("0724", black, samsung, lg, jamsil, kt, nexen, gochuk, doosan, sk, moonhak, kia, hanwha, daejeon, nc, lotte, sajik)
        addSchedule("0725", black, samsung, lg, jamsil, kt, nexen, gochuk, doosan, sk, moonhak, kia, hanwha, daejeon, nc, lotte, sajik)
        addSchedule("0726", black, samsung, lg, jamsil, kt, nexen, gochuk, doosan, sk, moonhak, kia, hanwha, daejeon, nc, lotte, sajik)
        addSchedule("0727", black, hanwha, doosan, jamsil, lotte, nexen, gochuk, lg, kt, suwon, kia, samsung, daegu, sk, nc, masan)
        addSchedule("0728", blue, hanwha, doosan, jamsil, lotte, nexen, gochuk, lg, kt, suwon, kia, samsung, daegu, sk, nc, masan)
        addSchedule("0729", red, hanwha, doosan, jamsil, lotte, nexen, gochuk, lg, kt, suwon, kia, samsung, daegu, sk, nc, masan)
        addSchedule("0731", black, lg, doosan, jamsil, nexen, sk, moonhak, kt, hanwha, daejeon, nc, samsung, daegu, lotte, kia, gwangju)
        addSchedule("0801", black, lg, doosan, jamsil, nexen, sk, moonhak, kt, hanwha, daejeon, nc, samsung, daegu, lotte, kia, gwangju)
        addSchedule("0802", black, lg, doosan, jamsil, nexen, sk, moonhak, kt, hanwha, daejeon, nc, samsung, daegu, lotte, kia, gwangju)
        //7.31 ~ 8.2 경기 연기 시 8.3 예비일 편성
        addSchedule("0804", black, lg, doosan, jamsil, nexen, sk, moonhak, kt, hanwha, daejeon, nc, samsung, daegu, lotte, kia, gwangju)
        addSchedule("0804", blue, sk, lg, jamsil, nexen, kt, suwon, nc, hanwha, daejeon, doosan, kia, gwangju, samsung, lotte, sajik)
        addSchedule("0805", red, sk, lg, jamsil, nexen, kt, suwon, nc, hanwha, daejeon, doosan, kia, gwangju, samsung, lotte, sajik)
        addSchedule("0807", black, hanwha, doosan, jamsil, kia, nexen, gochuk, samsung, sk, moonhak, lg, lotte, sajik, kt, nc, masan)
        addSchedule("0808", black, hanwha, doosan, jamsil, kia, nexen, gochuk, samsung, sk, moonhak, lg, lotte, sajik, kt, nc, masan)
        addSchedule("0809", black, samsung, lg, jamsil, doosan, kt, suwon, nexen, hanwha, daejeon, lotte, kia, gwangju, sk, nc, masan)
        addSchedule("0810", black, samsung, lg, jamsil, doosan, kt, suwon, nexen, hanwha, daejeon, lotte, kia, gwangju, sk, nc, masan)
        addSchedule("0811", blue, lotte, doosan, jamsil, lg, nexen, gochuk, kia, sk, moonhak, kt, hanwha, daejeon, nc, samsung, daegu)
        addSchedule("0812", red, lotte, doosan, jamsil, lg, nexen, gochuk, kia, sk, moonhak, kt, hanwha, daejeon, nc, samsung, daegu)
        addSchedule("0814", black, sk, doosan, jamsil, nc, kt, suwon, nexen, samsung, daegu, lg, kia, gwangju, hanwha, lotte, sajik)
        addSchedule("0815", black, sk, doosan, jamsil, nc, kt, suwon, nexen, samsung, daegu, lg, kia, gwangju, hanwha, lotte, sajik)
        //아시안게임 기간 리그 중단 (8.16 ~ 9.3)
        addSchedule("0904", black, kia, doosan, jamsil, nexen, sk, moonhak, lg, kt, suwon, lotte, hanwha, daejeon, samsung, nc, masan)
        addSchedule("0905", black, kia, doosan, jamsil, nexen, sk, moonhak, lg, kt, suwon, lotte, hanwha, daejeon, samsung, nc, masan)
        addSchedule("0906", black, nc, lg, jamsil, hanwha, kt, suwon, doosan, samsung, daegu, nexen, kia, gwangju, sk, lotte, sajik)
        addSchedule("0907", black, nc, lg, jamsil, hanwha, kt, suwon, doosan, samsung, daegu, nexen, kia, gwangju, sk, lotte, sajik)
        addSchedule("0908", blue, hanwha, lg, jamsil, kt, nexen, gochuk, doosan, sk, moonhak, samsung, kia, gwangju, lotte, nc, masan)
        addSchedule("0909", red, hanwha, lg, jamsil, kt, nexen, gochuk, doosan, sk, moonhak, samsung, kia, gwangju, lotte, nc, masan)
        addSchedule("0911", black, nexen, lg, jamsil, kt, sk, moonhak, hanwha, samsung, daegu, doosan, lotte, sajik, kia, nc, masan)
        addSchedule("0912", black, nexen, lg, jamsil, kt, sk, moonhak, hanwha, samsung, daegu, doosan, lotte, sajik, kia, nc, masan)
        addSchedule("0913", black, kt, doosan, jamsil, sk, hanwha, daejeon, lg, samsung, daegu, kia, lotte, sajik, nexen, nc, masan)
        addSchedule("0914", black, kt, doosan, jamsil, sk, hanwha, daejeon, lg, samsung, daegu, kia, lotte, sajik, nexen, nc, masan)
        addSchedule("0915", blue, nc, doosan, jamsil, samsung, kt, suwon, lg, hanwha, daejeon, sk, kia, gwangju, nexen, lotte, sajik)
        addSchedule("0916", red, nc, doosan, jamsil, samsung, kt, suwon, lg, hanwha, daejeon, sk, kia, gwangju, nexen, lotte, sajik)
        addSchedule("0918", black, lotte, lg, jamsil, doosan, nexen, gochuk, sk, kt, suwon, kia, samsung, daegu, hanwha, nc, masan)
        addSchedule("0919", black, lotte, lg, jamsil, doosan, nexen, gochuk, sk, kt, suwon, kia, samsung, daegu, hanwha, nc, masan)
        addSchedule("0920", black, doosan, lg, jamsil, samsung, nexen, gochuk, hanwha, sk, moonhak, nc, kia, gwangju, kt, lotte, sajik)
        addSchedule("0921", black, doosan, lg, jamsil, samsung, nexen, gochuk, hanwha, sk, moonhak, nc, kia, gwangju, kt, lotte, sajik)
        addSchedule("0922", blue, kt, lg, jamsil, sk, nexen, gochuk, kia, hanwha, daejeon, lotte, samsung, daegu, doosan, nc, masan)
        addSchedule("0923", red, kt, lg, jamsil, sk, nexen, gochuk, kia, hanwha, daejeon, lotte, samsung, daegu, doosan, nc, masan)
        addSchedule("0925", red, nexen, doosan, jamsil, lg, sk, moonhak, kia, kt, suwon, samsung, hanwha, daejeon, nc, lotte, sajik)
        addSchedule("0926", red, nexen, doosan, jamsil, lg, sk, moonhak, kia, kt, suwon, samsung, hanwha, daejeon, nc, lotte, sajik)
        addSchedule("0927", black, kia, lg, jamsil, lotte, nexen, gochuk, nc, sk, moonhak, doosan, hanwha, daejeon, kt, samsung, daegu)
        addSchedule("0928", black, kia, lg, jamsil, lotte, nexen, gochuk, nc, sk, moonhak, doosan, hanwha, daejeon, kt, samsung, daegu)
        addSchedule("0929", blue, lg, doosan, jamsil, nc, nexen, gochuk, lotte, kt, suwon, sk, samsung, daegu, hanwha, kia, gwangju)
        addSchedule("0930", red, lg, doosan, jamsil, nc, nexen, gochuk, lotte, kt, suwon, sk, samsung, daegu, hanwha, kia, gwangju)
        
    }
    func addSchedule(_ date: String, _ scheduleType: Int, _ awayTeam1: String, _ homeTeam1: String, _ area1: String, _ awayTeam2: String, _ homeTeam2: String, _ area2: String, _ awayTeam3: String, _ homeTeam3: String, _ area3: String, _ awayTeam4: String, _ homeTeam4: String, _ area4: String, _ awayTeam5: String, _ homeTeam5: String, _ area5: String){
        let object = Schedule()
        object.date = date; object.scheduleType = scheduleType
        object.awayTeam1 = awayTeam1; object.homeTeam1 = homeTeam1; object.area1 = area1
        object.awayTeam2 = awayTeam2; object.homeTeam2 = homeTeam2; object.area2 = area2
        object.awayTeam3 = awayTeam3; object.homeTeam3 = homeTeam3; object.area3 = area3
        object.awayTeam4 = awayTeam4; object.homeTeam4 = homeTeam4; object.area4 = area4
        object.awayTeam5 = awayTeam5; object.homeTeam5 = homeTeam5; object.area5 = area5
        try! realm.write {
            realm.add(object)
        }
        
    }
}
