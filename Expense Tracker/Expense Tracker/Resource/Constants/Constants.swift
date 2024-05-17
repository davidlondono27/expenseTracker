//
//  Constants.swift
//  Expense Tracker
//
//  Created by David Santiago Londono Giraldo on 17/12/23.
//

import Foundation
import SwiftUI

let appTint: Color = .red //TODO: Add Color selector to Settings

class customApp {
    var color: Color
    var language: String
    
    init(color: Color, language: String) {
        self.color = color
        self.language = language
    }
}

class ConstantsText_ES {
    static let welcomeTextFTU = "Qué hay de nuevo en\nRastreador de Gastos"
    static let transactionTitle = "Transacciones"
    static let transactionSubTitle = "Lleva un registro de tus ingresos y gastos."
    static let chartsTitle = "Gráficas visuales"
    static let chartsSubTitle = "Revisa tus transacciones mediante una representación gráfica llamativa."
    static let filterTitle = "Filtros Avanzados"
    static let filterSubTitle = "Encuentra los gastos que deseas mediante búsquedas avanzadas y filtradas."
    static let continueButton = "Continuar"
    static let recentsText = "Recientes"
    static let filtersText = "Filtros"
    static let chartsText = "Gráficas"
    static let settingsText = "Ajustes"
    static let welcome = "Hola"
    static let to = "a"
    static let income = "Ingresos"
    static let expense = "Gastos"
    static let userName = "Nombre"
    static let nameTip = "Cuál es tu nombre?"
    static let appLock = "Seguridad de la App"
    static let authenticateBiometric = "Desbloquea la App con FaceID o tu Huella"
    static let unlockApp = "Desbloquear App"
    static let startDate = "Fecha Inicio"
    static let endDate = "Fecha Fin"
    static let cancel = "Cancelar"
    static let filter = "Filtrar"
    static let searchTransactions = "Buscar Transacciones"
    static let search = "Buscar"
    static let both = "Ambos"
    static let settings = "Ajustes"
    static let enableAppLock = "Habilitar bloqueo de App"
    static let enableLockBack = "Bloquear en segundo plano"
    static let preview = "Previsualizar"
    static let title = "Título"
    static let remarks = "Comentario"
    static let amountCategory = "Monto & Tipo de transacción"
    static let date = "Fecha"
    static let add = "Agregar"
    static let edit = "Editar"
    static let transaction = "Transacción"
    static let save = "Guardar"
    static let tipTitle = "Hamburguesa y papas"
    static let tipRemark = "Restaurante BurgerMax"
    static let graphs = "Gráficos"
    static let month = "Mes"
    static let category = "Categoría"
    static let yourMovements = "Detalles de"
}

class ConstantsText_EN {
    static let welcomeTextFTU = "What's New in the\nExpense Tracker"
    static let transactionTitle = "Transactions"
    static let transactionSubTitle = "Keep track of your earnings and expenses."
    static let chartsTitle = "Visual Charts"
    static let chartsSubTitle = "View your transactions using eye-catching graphic representation."
    static let filterTitle = "Advance Filters"
    static let filterSubTitle = "Find the expenses you want by advance search and filtering."
    static let continueButton = "Continue"
    static let recentsText = "Recents"
    static let filtersText = "Filters"
    static let chartsText = "Charts"
    static let settingsText = "Settings"
    static let welcome = "Welcome!"
    static let to = "to"
    static let income = "Income"
    static let expense = "Expense"
    static let userName = "User Name"
    static let nameTip = "What's your name?"
    static let appLock = "App Security"
    static let authenticateBiometric = "Please authenticate yourself to unlock App"
    static let unlockApp = "Unlock App"
    static let startDate = "Start Date"
    static let endDate = "End Date"
    static let cancel = "Cancel"
    static let filter = "Filter"
    static let searchTransactions = "Search Transactions"
    static let search = "Search"
    static let both = "Both"
    static let settings = "Settings"
    static let enableAppLock = "Enable App Lock"
    static let enableLockBack = "Lock When App Goes Background"
    static let preview = "Preview"
    static let title = "Title"
    static let remarks = "Remarks"
    static let amountCategory = "Amount & Category"
    static let date = "Date"
    static let add = "Add"
    static let edit = "Edit"
    static let transaction = "Transaction"
    static let save = "Save"
    static let tipTitle = "Magic Keyboard"
    static let tipRemark = "Apple Store Product"
    static let graphs = "Graphs"
    static let month = "Month"
    static let category = "Category"
    static let yourMovements = "Details on"
}
