class ModelWithAttachment < ActiveRecord::Base
  has_attached_file :photo
end