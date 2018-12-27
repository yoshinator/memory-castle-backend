class MemorySerializer < ActiveModel::Serializer
  attributes :id, :text, :x, :y, :castle_id
end
