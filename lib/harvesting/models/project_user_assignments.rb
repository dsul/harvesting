module Harvesting
  module Models
    class ProjectUserAssignments < HarvestRecordCollection

      def initialize(ref_project, attrs, query_opts = {}, opts = {})
        super(attrs.reject {|k,v| k == "user_assignments" }, query_opts, opts)
        @ref_project = ref_project
        @entries = attrs["user_assignments"].map do |entry|
          ProjectUserAssignment.new(ref_project, entry, client: opts[:client])
        end
      end

      def fetch_next_page
        query_opts = next_page_query_opts
        query_opts[:project] = @ref_project
        @entries += client.user_assignments(query_opts).entries
        @attributes['page'] = page + 1
      end
    end
  end
end
