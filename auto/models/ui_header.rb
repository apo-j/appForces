class UiHeader < ActiveRecord::Base
 has_many :menu, class_name: 'UiHeaderMenu', foreign_key: 'header_id'
 has_many :top, class_name: 'UiHeaderTop', foreign_key: 'header_id'
end
