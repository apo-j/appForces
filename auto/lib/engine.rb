module Auto
  module Engine
    module DataSearch
      private
      ARGUMENT_ERROR = 0
      OBJ_NOT_FOUND = 1
      FIELD_NOT_FOUND = 2
      ARGUMENT_NOT_VALID = 3
      OK = 4
      NO_RESULT = 5
      #verify if the array of the parameters is valid
      def verify_search_arguments(options)
        if options.nil? || options.empty?
          return ARGUMENT_ERROR
        end
        if options[:org].nil?
           return ARGUMENT_NOT_VALID
        end

        if options[:obj_name].nil? || options[:obj_id].nil?
           return ARGUMENT_NOT_VALID
        end
        if !options[:obj_id].nil? && (@obj = MetaData.active.find(options[:obj_id])).nil?
          return OBJ_NOT_FOUND
        elsif !options[:obj_name].nil? && (@obj = MetaData.active.by_name(options[:org], options[:obj_name])).nil?
          return OBJ_NOT_FOUND
        end
        if (@fields = MetaDataField.all_fields.by_id(@obj.obj_id)).nil?
          return FIELD_NOT_FOUND
        end
        return OK
      end
      #generate sql to get the object
      def generate_sql
        sql = 'guid, obj_id'
        @fields.each do |field|
          sql << ',v'
          sql << field.num.to_s
          sql << ' as '
          sql << field.name
        end
        return sql
      end


    end
  end
end