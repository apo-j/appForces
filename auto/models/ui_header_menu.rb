class UiHeaderMenu < ActiveRecord::Base
 has_many :navbarItems, class_name: 'UiHeaderItem', foreign_key: 'menu_id'
 belongs_to :header, class_name: 'UiHeader', foreign_key: 'header_id'
end
