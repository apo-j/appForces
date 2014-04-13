class Relationship < ActiveRecord::Base
  #relationship
  belongs_to :instance, class_name: 'AppData', foreign_key: :instance_id
  #scopes
  scope :select_relationship_p_2_c, ->{select('id, org_id, obj_id, instance_id, target_obj_id, relation_id')}
  scope :by_org_data,               ->(org,ins){where('org_id = ? and instance_id = ?',org,ins)}
  scope :by_org_obj,                ->(org,obj){where('org_id = ? and obj_id = ?',org,obj)}
end
