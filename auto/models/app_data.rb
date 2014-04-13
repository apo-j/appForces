class AppData < ActiveRecord::Base
  #relationship
  belongs_to :obj, class_name: 'MetaData', foreign_key: :obj_id
  has_many :relationships, foreign_key: :instance_id, dependent: :delete_all
  #scopes
  scope :by_org,               ->(org){where('org_id = ?', org)}
  scope :active,              ->{where('is_active > 0')}
  scope :select_data,         ->(sql){select(sql)}
  scope :by_obj_id,           ->(obj_id){where('obj_id = ?', obj_id)}
  scope :by_node_type,        ->(*node_types){where(node_type: node_types)}
  #validations
  validates :org_id, :code, :node_type, :order_num,  presence:{message: Auto::MSG::Model::MSG[:presence]}
  validates :code, length: {in:3..100}, presence: {message: Auto::MSG::Model::MSG[:len]}
  validates :code, format: {with: /\A[a-zA-Z0-9]+\z/, message: Auto::MSG::Model::MSG[:format]}
end
