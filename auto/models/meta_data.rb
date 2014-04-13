class MetaData < ActiveRecord::Base
  include Auto::ModelHelper
  #relationship
  has_many :fields, class_name: 'MetaDataField', foreign_key: :obj_id, dependent: :delete_all
  has_many :instances, class_name: 'AppData', foreign_key: :obj_id, dependent: :delete_all
  #scopes
  scope :active,             ->{where('is_active > 0')}
  scope :by_name,            ->(org, name){where('org_id = ? and obj_name = ?',org, name)}
  scope :include_fields,     ->{includes(:fields)}
  scope :include_instances,  ->{includes(:instances)}
  scope :by_org,             ->(org = Auto::Org::SYS){where('org_id = ?',org)}
  #validations
  validates :org_id, :obj_name,  presence:{message: Auto::MSG::Model::MSG[:presence]}
  validates :obj_name, uniqueness: {scope: :org_id, message: Auto::MSG::Model::MSG[:unique]}
  validates :obj_name, length: {in:3..100, message: Auto::MSG::Model::MSG[:len]}
  validates :obj_name, format: {with: /\A[a-zA-Z0-9]+\z/, message: Auto::MSG::Model::MSG[:format]}

  def active?
    self.is_active
  end
end
