class PageConfig < ActiveRecord::Base
  has_many :pages, class_name: 'Page', foreign_key: 'pageConfig_id'

  def status
    200
  end

end
