//
//  Operations.swift
//  Mindbox Sample App
//
//  Created by Никитин Петр on 21.06.2021.
//

import Foundation
import Mindbox

func AuthorizeCustomer(){
    
    let body = OperationBodyRequest()
    
    body.customer =  .init(
        discountCard: .init(ids: ["number": "<Номер дисконтной карты>"]),
        birthDate: Date().asDateOnly,
        sex: .female,
        timeZone: TimeZone.current,
        lastName: "<Фамилия>",
        firstName: "<Имя>",
        middleName: "<Отчество>",
        area: .init(ids: ["externalId": "<Внешний идентификатор зоны>"]),
        email: "<Email>",
        mobilePhone: "<Мобильный телефон>",
        ids:  ["websiteid": "<Идентификатор на сайте>"],
        subscriptions: [
            .init(
                brand: "<Системное имя бренда подписки клиента>",
                pointOfContact: .sms,
                topic: "<Внешний идентификатор тематики подписки>",
                isSubscribed: true
            )
        ]
        
    )
    
    Mindbox.shared.executeAsyncOperation(
        operationSystemName: "Mobile.AuthorizeCustomer",
        operationBody:body
    )
}

func RegisterCustomer(){
    let body = OperationBodyRequest()
    
    body.customer =  .init(
        discountCard: .init(ids: ["number": "<Номер дисконтной карты>"]),
        birthDate: Date().asDateOnly,
        sex: .female,
        timeZone: TimeZone.current,
        lastName: "<Фамилия>",
        firstName: "<Имя>",
        middleName: "<Отчество>",
        area: .init(ids: ["externalId": "<Внешний идентификатор зоны>"]),
        email: "<Email>",
        mobilePhone: "<Мобильный телефон>",
        ids:  ["websiteid": "<Идентификатор на сайте>"],
        customFields: .init([
            "<Имя доп поля 1>" : "<Значение доп поля>",
            "<Имя доп поля 2>" : [
                "<Значение доп поля>",
                "<Значение доп поля>"
            ],
        ]),
        subscriptions: [
            .init(
                brand: "<Системное имя бренда подписки клиента>",
                pointOfContact: .email,
                topic: "<Внешний идентификатор тематики подписки>",
                isSubscribed: true
            )
        ]
    )
    
    Mindbox.shared.executeAsyncOperation(
        operationSystemName: "Mobile.RegisterCustomer",
        operationBody:body
    )
}

func ViewProduct(){
    let body = OperationBodyRequest()
    
    body.viewProduct = .init(
        product: .init(ids: ["website": "<Id product в Website>"])
    )
    
    Mindbox.shared.executeAsyncOperation(
        operationSystemName: "Mobile.RegisterCustomer",
        operationBody:body
    )
    
    
    ///
    
    ///
    
    let bodyGroup = OperationBodyRequest()
    
    bodyGroup.viewProduct = .init(
        productGroup: .init(ids: ["website": "<Id productGroup в Website>"])
    )
    
    Mindbox.shared.executeAsyncOperation(
        operationSystemName: "Mobile.RegisterCustomer",
        operationBody:bodyGroup
    )
}

func ViewProductCategory(){
    let body = OperationBodyRequest()
    
    body.viewProductCategory = .init(
        productCategory: .init(ids: ["website": "<Id product в Website>"])
    )
    
    Mindbox.shared.executeAsyncOperation(
        operationSystemName: "Mobile.RegisterCustomer",
        operationBody:body
    )
    
}


func SetCart(){
    let body = OperationBodyRequest()
    
    body.productListItems = [
        .init(
            product: .init(ids: ["website":"<Id Product в Website>"]),
            count: 10.0,
            pricePerItem: 1
        ),
        .init(
            product: .init(ids: ["website":"<Id Product в Website>"]),
            count: 10,
            priceOfLine: 100
        ),
        .init(
            productGroup: .init(ids: ["website":"<Id Product в Website>"]),
            count: 1,
            priceOfLine: 10
        )
    ]
    Mindbox.shared.executeAsyncOperation(
        operationSystemName: "Mobile.SetCart",
        operationBody:body
    )
    
}

func ClearCart(){
    let body = OperationBodyRequest()
    
    Mindbox.shared.executeAsyncOperation(
        operationSystemName: "Mobile.ClearCart",
        operationBody:body
    )
}

func SetCountWishList(){
    let body = OperationBodyRequest()
    
    body.setProductCountInList = .init(
        product: .init(ids: ["website":"<Id Product в Website>"]),
        pricePerItem: 10
    )
    
    Mindbox.shared.executeAsyncOperation(
        operationSystemName: "Mobile.SetCountWishList",
        operationBody:body
    )
}

func RemoveFromWishList(){
    let body = OperationBodyRequest()
    
    body.removeProductFromList = .init(
        product: .init(ids: ["website":"<Id Product в Website>"]),
        pricePerItem: 10
    )
    
    Mindbox.shared.executeAsyncOperation(
        operationSystemName: "Mobile.RemoveFromWishList",
        operationBody:body
    )
}

func createOrder(){
    let body = OperationBodyRequest()
    
    body.customer =  .init(
        discountCard: .init(ids: ["number": "<Номер дисконтной карты>"]),
        birthDate: Date().asDateOnly,
        sex: .female,
        timeZone: TimeZone.current,
        lastName: "<Фамилия>",
        firstName: "<Имя>",
        middleName: "<Отчество>",
        area: .init(ids: ["externalId": "<Внешний идентификатор зоны>"]),
        email: "<Email>",
        mobilePhone: "<Мобильный телефон>",
        ids:  ["websiteid": "<Идентификатор на сайте>"],
        customFields: .init([
            "<Имя доп поля 1>" : "<Значение доп поля>",
            "<Имя доп поля 2>" : [
                "<Значение доп поля>",
                "<Значение доп поля>"
            ],
        ]),
        subscriptions: [
            .init(
                brand: "<Системное имя бренда подписки клиента>",
                pointOfContact: .email,
                topic: "<Внешний идентификатор тематики подписки>",
                isSubscribed: true
            )
        ]
    )
    
    body.order = .init(
        ids:["websiteid": "<Идентификатор на сайте>"],
        cashdesk: .init(ids: ["websiteid": "<Идентификатор на сайте>"]),
        deliveryCost: 100,
        customFields: .init([
            "<Имя доп поля 1>" : "<Значение доп поля>",
            "<Имя доп поля 2>" : [
                "<Значение доп поля>",
                "<Значение доп поля>"
            ],
        ]),
        area: .init(ids: ["externalId": "<Внешний идентификатор зоны>"]),
        totalPrice:100,
        discounts: [
            .init(
                type: .externalPromoAction,
                externalPromoAction: .init(ids: ["externalId": "<Идентификатор промоакции>"]),
                amount: 100
            ),
            .init(
                type: .promoCode,
                promoCode: .init(ids: ["code": "<Идентификатор промокода>"]),
                amount: 100
            )
        ],
        lines: [
            .init(
                minPricePerItem: 100,
                costPricePerItem: 100,
                customFields: .init([
                    "<Имя доп поля 1>" : "<Значение доп поля>",
                    "<Имя доп поля 2>" : [
                        "<Значение доп поля>",
                        "<Значение доп поля>"
                    ],
                ]),
                basePricePerItem: 100,
                quantity: .double(10),
                discountedPricePerLine: 100,
                lineId: "1",
                lineNumber: 1,
                discounts: [
                    .init(
                        type: .externalPromoAction,
                        externalPromoAction: .init(ids: ["externalId": "<Идентификатор промоакции>"]),
                        amount: 100
                    ),
                    .init(
                        type: .promoCode,
                        promoCode: .init(ids: ["code": "<Идентификатор промокода>"]),
                        amount: 100
                    )
                ],
                product: .init(ids: ["website": "<Id Product в Website>"])
            )
        ],
        email: "<Email>",
        mobilePhone: "<Номер мобильного телефона без форматирования>"
        
    )
    
    Mindbox.shared.executeAsyncOperation(
        operationSystemName: "Mobile.CreateAuthorizedOrder",
        operationBody:body
    )
}
