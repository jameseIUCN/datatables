class Datatable

    def initialize(view)
      @view = view
    end
    
    def as_json(options = {}) {
        recordsTotal: OldTable.count,
        TotalDisplayRecords: old_tables.total_entries,
        data: data
    
    }
    end
    
    privatte
    
    def data
    old_tables.map do |table |
       [
          data: title
          data: username
          data: name
          data: email
          data: hometown
       ]
    end
    
    def old_tables
      @old_tables || = fetch_old_tables
    end
    
    def fetch_old_tables
      old_tables = OldTable.order("#{sort_column} #{sort_direction}")
      old_tables = old_tables.page(page).per_page(per_page)# if params[: search].present ? #old_tables = old_tables.where
    end
    
    def page
      params[: iDisplayLength].to_i / per_page + 1
    end
    
    def sort_column
      columns = % w[title name hometown]
      columns[params[: iSortCol_0].to_i]
    end
    
      def sort_direction
          params[: sSortDir_0] == "desc" ? "desc" : "asc"
      end
    end