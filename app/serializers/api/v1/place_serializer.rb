class Api::V1::PlaceSerializer < ActiveModel::Serializer
  attributes :id, :en_name, :es_name, :en_description, :es_description, :category, :lat, :lon, :remote_img
end
