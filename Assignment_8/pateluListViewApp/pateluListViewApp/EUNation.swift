//
//  EUNation.swift
//  pateluListViewApp
//
//  Created by Urvi Patel on 2/20/16.
//  Copyright © 2016 Urvi Patel. All rights reserved.
//

import Foundation



let nations = [
				EUNation(name: "Austria",
                    joinDate: "1 January 1995",
                    capital: "Vienna",
                    size: "83,879",
                    population: "8,507,786",
                    currency: .Euro,
                    info: "Austria is a largely mountainous country due to its location at the eastern end of the Alps. This mountain range dominates the western and southern parts of Austria while the country’s lower-lying eastern provinces are in the Danube basin.  The most important sectors of Austria’s economy in 2014 were wholesale and retail trade, transport, accommodation and food services (22.8 %), industry (22.1 %) and public administration, defence, education, human health and social work activities (17.7 %).  Austria’s main export partners are Germany, Italy and the US, while its main import partners are Germany, Italy and Switzerland."),
				
				EUNation(name: "Belgium",
                    joinDate: "1 January 1958",
                    capital: "Brussels",
                    size: "30,528",
                    population: "11,203,992",
                    currency: .Euro,
                    info: "Belgium is a federal state divided into three regions: Dutch-speaking Flanders in the north, francophone Wallonia in the south and Brussels, the bilingual capital, where French and Dutch share official status. There is also a small German-speaking minority in the eastern part of the country. Belgium’s varied landscape includes: 67 kilometres of sea coast and flat coastal plains along the North Sea, a central plateau and the rolling hills and forests of the Ardennes region in the south"),
				
				EUNation(name: "Bulgaria",
                    joinDate: "1 January 2007",
                    capital: "Sofia",
                    size: "111,002",
                    population: "7,245,677",
                    currency: .BulgarianLev,
                    info: "Located in the southeast part of the Balkans, Bulgaria has a diverse topography. The north of the country is dominated by the vast lowlands of the Danube Plain with the river Danube defining the border with neighbouring Romania. The south of the country, by contrast, is dominated by highlands and elevated plains while, in the east, the Black Sea coast attracts tourists all year round."),
    
				EUNation(name: "Denmark",
                    joinDate: "1 January 1973",
                    capital: "Copenhagen",
                    size: "42,921",
                    population: "5,627,235",
                    currency: .DanishKrone,
                    info: "Denmark is the smallest as well as the most southerly and most low-lying of the three Scandinavian countries and consists of the peninsula of Jutland and an archipelago of more than 400 islands of which 72 are inhabited. Denmark borders Germany to the south, is connected to Sweden by a road and rail bridge and has a tidal coastline of 7 314 km."),
    
				EUNation(name: "Estonia",
                    joinDate: "1 May 2004",
                    capital: "Tallinn",
                    size: "45,227",
                    population: "1,315,819",
                    currency: .Euro,
                    info: "Estonia is the most northerly of the three Baltic States and is a predominantly flat country on the eastern shores of the Baltic Sea. The most important sectors of Estonia’s economy in 2014 were wholesale and retail trade, transport, accommodation and food services (22.5 %), industry (21.1 %) and public administration, defence, education, human health and social work activities (15.4 %)."),
    
				EUNation(name: "Finland",
                    joinDate: "1 January 1995",
                    capital: "Helsinki",
                    size: "338,435",
                    population: "5,451,270",
                    currency: .Euro,
                    info: "Finland is one of the five Nordic countries and the northernmost country in the EU. Finland is one of the most sparsely-populated countries in the EU and is bordered by Sweden to the west, Norway to the north and Russia to the east."),
    
				EUNation(name: "France",
                    joinDate: "1 January 1958",
                    capital: "Paris",
                    size: "632,833",
                    population: "65,856,609",
                    currency: .Euro,
                    info: "France is the largest country in the EU, stretching from the North Sea to the Mediterranean. The landscape is diverse, with mountains in the east and south, including the Alpine peak of Mont Blanc (4 810 m), which is western Europe's highest point."),
    
    
                EUNation(name: "Germany",
                joinDate: "1 January 1958",
                capital: "Berlin",
                size: "357,340",
                population: "80,780,000",
                currency: .Euro,
                info: "With a landmass that stretches from the North Sea and the Baltic Sea in the north to the Alps in the south, Germany has the largest population of any EU country. Germany borders Denmark to the north, Poland and the Czech Republic to the east, Austria and Switzerland to the south, France and Luxembourg to the southwest, and Belgium and the Netherlands to the northwest."),    
    
				EUNation(name: "Hungary",
                    joinDate: "1 May 2004",
                    capital: "Budapest",
                    size: "93,024",
                    population: "9,879,000",
                    currency: .HungarianForint,
                    info: "Hungary is a landlocked country in central Europe, which borders with no fewer than seven countries: Slovakia, Ukraine, Romania, Serbia, Croatia, Slovenia and Austria. The country is mostly flat, with low mountains in the north."),
    
				EUNation(name: "Ireland",
                    joinDate: "1 January 1973",
                    capital: "Dublin",
                    size: "69,797",
                    population: "4,604,029",
                    currency: .Euro,
                    info: "Ireland comprises five-sixths of the island of Ireland. The north-eastern part of the island is Northern Ireland which is part of the United Kingdom. Ireland has a long coastline. To the west is the northern Atlantic Ocean and to the south the Celtic Sea. To the east Ireland is separated from Great Britain by the Irish Sea."),
    
				EUNation(name: "Italy",
                    joinDate: "1 January 1958",
                    capital: "Rome",
                    size: "302,073",
                    population: "60,782,668",
                    currency: .Euro,
                    info: "To the north, Italy borders France, Switzerland, Austria, and Slovenia, and its borders are largely naturally defined by the Alpine watershed. To the south, it consists of the entirety of the Italian Peninsula and the two largest Mediterranean islands of Sicily and Sardinia as well as around 68 smaller islands. There are two small independent states within Italy: the Vatican City in Rome, and the Republic of San Marino."),
    
				EUNation(name: "Latvia",
                    joinDate: "1 May 2004",
                    capital: "Riga",
                    size: "64,573",
                    population: "2,001,468",
                    currency: .Euro,
                    info: "With a coastline of 531km along the Baltic Sea, Latvia is bordered by Estonia, Lithuania, Russia and Belarus. Woodlands cover over 40 % of this low-lying country. Latvia also counts more than 3 000 lakes and 12 000 rivers."),
    
                EUNation(name: "Lithuania",
                joinDate: "1 May 2004",
                capital: "Vilnuis",
                size: "65,300",
                population: "2,943,472",
                currency: .Euro,
                info: "Lithuania is the southernmost of the three Baltic States – and the largest and most populous of them. The country is predominantly flat, with a few low hills in the western uplands and eastern highlands. Forests cover just over 30 % of the country. "),
    
    
				EUNation(name: "Luxemborg",
                    joinDate: "1 January 1958",
                    capital: "Luxemborg",
                    size: "2,586",
                    population: "549,280",
                    currency: .Euro,
                    info: "The Grand Duchy of Luxembourg is a landlocked country in northern Europe surrounded by Belgium to the west, France to the south and Germany to the east. Per capita, it is the richest country in the EU as well as being one of its smallest. It is largely made up of rolling hills and forests."),
    
    
            EUNation(name: "Sweden",
            joinDate: "1 January 1995",
            capital: "Stockholm",
            size: "438,574",
            population: "9,644,864",
            currency: .DanishKrone,
                info: "Sweden has the largest population among the Nordic countries and is the third-largest country in the European Union by surface area. To the west, Sweden is separated from Norway by mountains and is connected to the south by a road and rail bridge to Denmark."),
    
]

class EUNation {
    
    enum Currency: String {
        case Euro = "euro"
        case BulgarianLev = "bgn"
        case CroatianKuna = "hrk"
        case DanishKrone = "dkk"
        case HungarianForint = "huf"
    }
    
    var name: String
    var jDate: String
    var cptl: String
    var area: String
    var pop: String
    var curr: Currency
    var data: String
    init(name: String, joinDate: String, capital: String, size: String, population: String, currency: Currency, info: String)
    {
        self.name = name;
        self.jDate = joinDate;
        self.cptl = capital;
        self.area = size;
        self.pop = population;
        self.curr = currency;
        self.data = info;
    }
}