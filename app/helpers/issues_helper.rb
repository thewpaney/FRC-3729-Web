module IssuesHelper
  def index_issue_table
    out = ""
    done = []
    queue.each do |issue|
      unless done.include?(issue)
        out << "<tr>#{issue.id} - #{issue.name}</tr>"
        subtasks = Issue.where(parent: issue.id)
        subtasks.each do |s|
          puts "----#{s.id} - #{s.name}"
          done << s
        end
      end
    end
    
  end
end
