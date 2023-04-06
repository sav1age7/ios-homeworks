//
//  PostModel.swift
//  Navigation
//
//  Created by Юзер on 09.02.2023.
//

import Foundation

struct Post {
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
}

extension Post {
    static func make() -> [Post] {
        [
            Post(author: "vedmak.official", description: "Ведьмак Геральт, мутант и убийца чудовищ, на своей верной лошади по кличке Плотва путешествует по Континенту. За тугой мешочек чеканных монет этот мужчина избавит вас от всякой настырной нечисти — хоть от чудищ болотных, оборотней и даже заколдованных принцесс. В сельской глуши местную девушку Йеннифэр, которой сильно не повезло с внешностью, зато посчастливилось иметь способности к магии, отец продаёт колдунье в ученицы. А малолетняя наследница королевства Цинтра по имени Цири вынуждена пуститься в бега, когда их страну захватывает империя Нильфгаард. Судьбы этих троих окажутся тесно связаны, но скоро сказка сказывается, да не скоро дело делается.", image: "vedmak", likes: 999, views: 9999),
            Post(author: "EngLess", description: "London is the capital and largest city of England and the United Kingdom, with a population of just under 9 million. It stands on the River Thames in south-east England at the head of a 50-mile (80 km) estuary down to the North Sea, and has been a major settlement for two millennia. The City of London, its ancient core and financial centre, was founded by the Romans as Londinium and retains its medieval boundaries. The City of Westminster, to the west of the City of London, has for centuries hosted the national government and parliament. Since the 19th century, the name \"London\" has also referred to the metropolis around this core, historically split between the counties of Middlesex, Essex, Surrey, Kent, and Hertfordshire, which since 1965 has largely comprised Greater London, which is governed by 33 local authorities and the Greater London Authority.", image: "englessLondon", likes: 88, views: 888),
            Post(author: "japanCars", description: "Автолюбители часто сходятся во мнении: 90-е годы 20-го века были золотым веком японских спортивных автомобилей. Некоторые модели популярны и в наши дни и любимы многими автолюбителями. Несмотря на то, что эти спортивные автомобили были выпущены более 30 лет назад, они по-прежнему обладают поразительной скоростью и не уступают современным моделям автомобилей. Вам интересно узнать об этих легендарных спортивных автомобилях?", image: "japanCars90", likes: 777, views: 7777),
            Post(author: "GeoInterest", description: "Снимок, на котором вы видите одного из последних тасманских тигров. Считаются вымершими с 1936 года", image: "geoTiger", likes: 55, views: 5555)
        ]
    }
}
