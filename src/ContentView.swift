/* FILE = ContentView.swift
 AUTHOR = Berk Dogan
 PROJECT = Infinity
 URL = https://github.com/berkiyo/infinity
 */

import SwiftUI

/********************
 Struct for Tracking Activities
 */
struct Task: Identifiable {
    let id = UUID() // the identifier
    let name: String // the name of the task
    var isCompleted: Bool = false // whether it is completed or not
}

/********************
 Sections for the app
 */

enum Sections: String, CaseIterable {
    case pending = "Pending"
    case completed = "Completed"
}

/********************
 Main view 
 
 */
struct ContentView: View {
    
    // Hardcoded tasks, just for testing purposes
    @State private var tasks = [Task(name: "Mow the lawn", isCompleted: true),
                                Task(name:"Wash the car", isCompleted: false),
                                Task(name: "Feed Piffin")]
    
    // Property for pending tasks
    var pendingTasks: [Binding<Task>] {
        $tasks.filter { !$0.isCompleted.wrappedValue } // the ! indicates logical "NOT"
    }

    // Property for completed tasks
    var completedTasks: [Binding<Task>] {
        $tasks.filter { $0.isCompleted.wrappedValue } 
    }
    
    // MAIN BODY START
    var body: some View {
        List {
            ForEach(Sections.allCases, id: \.self) {
                section in Section {
                    ForEach(section == .pending ? pendingTasks: completedTasks) { $task in TaskViewCell(task: $task)} 
                    // if section = pending, then display pending, else, display completed
                } header: {
                    Text(section.rawValue)
                }
            }
        }
    }
   
}

/********************
 TaskViewCell
 */
struct TaskViewCell: View {
    
    @Binding var task: Task
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.square": "square") // task.isComplete
                .onTapGesture {
                    withAnimation(.easeIn) {
                        task.isCompleted.toggle()    
                    }
                }
            Text(task.name)
            
        }
    }
}
