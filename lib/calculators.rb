class ProjectStatistics
    # attr_accessor :id
    def initialize(id)
        @id = id
        #get the specific project
        @project = Project.find(@id)
        #calculate this only once
        @project_issues_count = @project.issues.count
    end

    def count_resolved_issues 
        @resolved_issues = 0
        @project.issues.each do |issue|
            if issue.status.downcase! == "resolved"
                @resolved_issues += 1
            end
        end
        @resolved_issues
    end

    def count_issues 
        @project_issues_count
    end

    def comments_per_project
        @project_comments_count = 0
        @project.issues.each do |issue|
            issue.comments.each do |comment|
                @project_comments_count += 1
            end
        end
        @project_comments_count
    end

    def mean_comments_per_issue
        if @project_issues_count == 0
            return 0
        else
            # p
            # p "@project_issues_count"
            # p @project_issues_count
            # p
            (comments_per_project.to_f / @project_issues_count).round 2
        end
    end

    def percentage_of_resolved_issues
        if @project_issues_count == 0
            return 0
        else
            (100 * count_resolved_issues.to_f / @project_issues_count).round 2
        end
    end

end