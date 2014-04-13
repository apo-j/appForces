class UiHeaderTop < ActiveRecord::Base
 belongs_to :header, class_name: 'UiHeader', foreign_key: 'header_id'
end
