module Auto
  module ModelHelper
    extend ActiveSupport::Concern


    included do
      scope :page,      ->(page,n){offset(([page.to_i,1].max - 1)*([n.to_i,1].max)).limit([n.to_i,1].max)}
      scope :order_by,  ->(fields){order(fields.join(','))} do
        def reverse
          reverse_order
        end
      end

      def self.total_page(n)
        c = except(:offset, :limit, :order, :include)
        # a workaround to count the actual model instances on distinct query because count + distinct returns wrong value in some cases. see https://github.com/amatsuda/kaminari/pull/160
        uses_distinct_sql_statement = c.to_sql =~ /DISTINCT/i
        if uses_distinct_sql_statement
          c = c.length
        else
          # .group returns an OrderdHash that responds to #count
          c = c.count
          c = c.respond_to?(:count) ? c.count : c
        end
        return (c.to_f / n).ceil
      end

    end

    module ClassMethods

      def get_errors(obj)
        if obj.invalid?
          obj.errors.add(Auto::MSG::Model::RESPONSE, Auto::MSG::Model::MSG[:KO])
        else
          obj.errors.add(Auto::MSG::Model::RESPONSE, Auto::MSG::Model::MSG[:OK])
        end
        return obj.errors
      end

    end

  end

end