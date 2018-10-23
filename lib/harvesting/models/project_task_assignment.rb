module Harvesting
  module Models
    class ProjectTaskAssignment < HarvestRecord
      attributed :id,
                 :is_active,
                 :billable,
                 :hourly_rate,
                 :budget,
                 :created_at,
                 :updated_at

      modeled project: Project, task: Task

      def initialize(ref_project, attrs, opts = {})
        super(attrs, opts)
        @ref_project = ref_project
      end

      def path
        id.nil? ? "projects/#{@ref_project.id}/task_assignments" : "projects/#{@ref_project.id}/task_assignments/#{id}"
      end
    end
  end
end
