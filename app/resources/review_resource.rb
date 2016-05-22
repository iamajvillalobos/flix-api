class ReviewResource < JSONAPI::Resource
  attributes :name, :stars, :comment

  has_one :movie
end
