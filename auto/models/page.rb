class Page < ActiveRecord::Base
  has_one :pageSecurity
  belongs_to :pageConfig, class_name: 'PageConfig', foreign_key: 'pageConfig_id'
end
