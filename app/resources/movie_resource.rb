class MovieResource < JSONAPI::Resource
  attributes :title, :rating, :total_gross, :description, :released_on, :cast, :director, :duration, :image_file_name
end
