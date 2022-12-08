class GuestSerializer < ActiveModel::Serializer
  attributes :id, :name, :occupation
  has_many :episodes
end
