require 'rails_helper'

describe Movie do
  it "is valid with a title, released date, description, total gross, image filename and rating" do
    movie = FactoryGirl.build(:movie)
    # movie = Movie.new(
    #   title: 'Iron Man',
    #   description: 'When wealthy industrialist Tony Sdtart is forced to build',
    #   image_file_name: 'ironman.jpg',
    #   released_on: '2008-05-02',
    #   rating: 'PG-13',
    #   total_gross: 318_412_101
    # )
    expect(movie).to be_valid
  end

  it "is invalid without a title" do
    movie = Movie.new(title: nil)
    movie.valid?
    expect(movie.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a released date" do
    movie = Movie.new(released_on: nil)
    movie.valid?
    expect(movie.errors[:released_on]).to include("can't be blank")
  end

  it "is invalid when the description is less than 25 characters" do
    movie = Movie.new(description: "asd")
    movie.valid?
    expect(movie.errors[:description]).to include("is too short (minimum is 25 characters)")
  end

  it "is invalid when the total gross is less than 0" do
    movie = Movie.new(total_gross: -1)
    movie.valid?
    expect(movie.errors[:total_gross]).to include("must be greater than or equal to 0")
  end

  it "is invalid when image filename is not either GIF, PNG, or JPG" do
    movie = Movie.new(image_file_name: "something.not")
    movie.valid?
    expect(movie.errors[:image_file_name]).to include("must reference a GIF, JPG, or PNG image")
  end

  it "is invalid when the rating is not from the accepted options" do
    movie = Movie.new(rating: "PG-14")
    movie.valid?
    expect(movie.errors[:rating]).to include("is not included in the list")
  end
end
