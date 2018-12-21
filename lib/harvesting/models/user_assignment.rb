module Harvesting
  module Models
    class UserAssignment < HarvestRecord
      attributed :id,
                 :is_active,
                 :is_project_manager,
                 :hourly_rate,
                 :budget,
                 :created_at,
                 :updated_at

      modeled project: Project,
              user: User

      def path
        base_url = "projects/#{project.id}/user_assignments"
        id.nil? ? base_url : "#{base_url}/#{id}"
      end
    end
  end
end
