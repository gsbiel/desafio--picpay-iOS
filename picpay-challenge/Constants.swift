//
//  Constants.swift
//  picpay-challenge
//
//  Created by user164622 on 2/28/20.
//  Copyright © 2020 GabrielGaspar. All rights reserved.
//

import Foundation

struct K {
    static let contactsViewBasicReusableHeaderView = "basicReusableView"
    static let contactsViewContactHeaderIdentifier = "contactsCollectionViewHeaderClass"
    static let contactsViewSearchHeaderIdentifier = "contactsCollectionViewReusableSearchHeaderClass"
    static let contactsViewCellIdentifier = "contactsViewCell"
    static let contactsBaseViewCellIdentifier = "basicCell"
    
    static let searchIconName = "lupa"
    static let searchTxtFieldPlaceHolder = "A quem voce deseja pagar?"
    
    // O cartao de credigo da tela de Priming foi feito usando gradientes.
    // De acordo com o que aprendi ate agora, objetos do tipo CAGradientLayer, que devem ser inseridos em UIViews como sublayers, nao podem ser dimensionados usando autolayout.
    // Entao, na hora de instanciar objetos CAGradientLayer, eu tenho que passar o seu frame, com width e height ja definidos.
    // Assim, para criar o desenho do cartao e ja configura-lo para reajustar suas dimensoes, de modo a manter a proporcao para qualquer tamanho de tela, tive que tirar do design do figma as dimensoes definidas pelo designer e criar fatores de escalonamento para calcular as dimensoes dos componentes criados no app.
    
    // Dimensoes e posicionamento do cartao desenhado no figma
    static let creditCardWidthRef = 100.0
    static let creditCardHeightRef = 70.24
    static let creditCardInnerCardSymbolWidthRef = 23.29
    static let creditCardInnerCardSymbolHeightRef = 17.29
    static let creditCardInnerCardTrailingAnchorRef = 8.96
    static let creditCardInnerCardTopAnchorRef = 9.01
    static let creditCardNumberFieldStrokeWidthRef = 14.71
    static let creditCardNumberFieldStrokeHeightRef = 5.85
    static let creditCardNameFieldStrokeWidthRef = 26.47
    static let creditCardNameFieldStrokeHeightRef = 5.85
    static let dataFieldStrokeLeadingAnchorRef = 8.82
    static let creditCardNumberFieldStrokeTopAnchorRef = 45.62
    static let creditCardNameFieldStrokeTopAnchorRef = 54.4
    
    // Dimensoes da tela usadadas no figma
    static let primingViewWidthRef = 320.0
    static let primingViewHeightRef = 568.0
    
}
