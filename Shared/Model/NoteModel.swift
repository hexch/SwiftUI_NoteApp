//
//  NoteModel.swift
//  NotesApp
//
//  Created by XIAOCHUAN HE on R 5/03/22.
//

import SwiftUI
struct NoteModel:Identifiable{
    var id = UUID().uuidString
    var note: String
    var date: Date
    var color: Color
}

fileprivate func getSampleDate(offset: Int)-> Date{
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    return date ?? Date()
}

var notes = [
    NoteModel(
        note: "The beginning of screenless UI desgin jobs to be taken...",
        date: getSampleDate(offset: 1),
        color: noteColors[0]
    ),
    NoteModel(
        note: "13 Things you should give up if you want to be a successfull UI/UX designer",
        date: getSampleDate(offset: -10),
        color: noteColors[1]
    ),
    NoteModel(
        note: "The psycology principles every UI/UX desginer needs to know",
        date: getSampleDate(offset: -15),
        color: noteColors[2]
    ),
    NoteModel(
        note: "52 research teams you need to know as a UI/UX designer",
        date: getSampleDate(offset: 10),
        color: noteColors[3]
    ),
    NoteModel(
        note: "10 UI & UX lessions from designing my own project",
        date: getSampleDate(offset: -3),
        color: noteColors[4]
    ),
]
