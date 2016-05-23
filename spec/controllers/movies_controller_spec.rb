require "rails_helper"

describe MoviesController do
  describe "GET #index" do
    get "/movies", {}, { "Accept" => "application/json" }
  end
end
