class UiHeaderItem < ActiveRecord::Base
  belongs_to :menu, class_name: 'UiHeaderMenu', foreign_key: 'menu_id'
  belongs_to :item, class_name: 'UiHeaderItem', foreign_key: 'item_id'
  has_many :items, class_name: 'UiHeaderItem', foreign_key: 'item_id'
end
