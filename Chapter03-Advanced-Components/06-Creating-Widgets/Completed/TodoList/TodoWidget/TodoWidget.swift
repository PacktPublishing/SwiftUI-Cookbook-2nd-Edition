//
//  TodoWidget.swift
//  TodoWidget
//
//  Created by Edgar Nzokwe on 8/20/21.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), task:tasks[0])
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), task: tasks[0])
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        let currentDate = Date()
        let filteredTasks = tasks.sorted(by: {$0.priority > $1.priority})
        for index in 0..<filteredTasks.count {
            let task = filteredTasks[index]
            let entryDate = Calendar.current.date(byAdding: .second, value: index*10, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, task:task)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let task: Task
}

struct TodoWidgetEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        Text(entry.task.description)
    }
}

@main
struct TodoWidget: Widget {
    let kind: String = "TodoWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            TodoWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Task List Widget")
        .description("Shows next pressing item on a todo list")
    }
}

struct TodoWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            TodoWidgetEntryView(entry: SimpleEntry(date: Date(), task: tasks[0]))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            TodoWidgetEntryView(entry: SimpleEntry(date: Date(), task: tasks[0]))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
 
        }
    }
}
