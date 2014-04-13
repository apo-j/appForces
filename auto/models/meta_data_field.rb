class MetaDataField < ActiveRecord::Base
  #relationship
  belongs_to :obj, class_name: 'MetaData', foreign_key: :obj_id
  #scopes
  scope :all_fields, ->{select('field_id, field_name as name, field_type as type, field_num as num').joins('left outer join meta_data on meta_data.obj_id = meta_data_fields.obj_id')}
  scope :by_org_obj_name,    ->(org,name){where('meta_data.obj_name = ? and meta_data.org_id = ?',name,org)}
  scope :by_obj_id,      ->(id){where('meta_data.obj_id = ?',id)}
  #validations
  validates :org_id, :field_name, :field_type, :field_num, presence: {message: Auto::MSG::Model::MSG[:presence]}
  validates :field_name, uniqueness: {scope: :obj, message: Auto::MSG::Model::MSG[:unique]}
  validates :field_num, uniqueness: {scope: :obj, message: Auto::MSG::Model::MSG[:unique]}
  validates :field_name, length: {in:3..100, message: Auto::MSG::Model::MSG[:len]}
  validates :field_name, format: {with: /\A[a-zA-Z0-9]+\z/, message: Auto::MSG::Model::MSG[:format]}
end
