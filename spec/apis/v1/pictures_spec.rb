require "spec_helper"

describe "get /api/pictures", :type => :api do

  before :each do
  end

  it "provides a valid response" do
    picture = Picture.create(remote_image_url: "http://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Taylor_Swift,_2012.jpg/220px-Taylor_Swift,_2012.jpg")
    url = "http://www.example.com/api/pictures/#{picture.id}"
    get "#{url}"

    last_response.status.should == 200
  end

  it "provides a link to the full size image from Amazon S3" do
    picture = Picture.create(remote_image_url: "http://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Taylor_Swift,_2012.jpg/220px-Taylor_Swift,_2012.jpg")
    url = "http://www.example.com/api/pictures/#{picture.id}"
    get "#{url}"

    image = JSON.parse(last_response.body)
    full_size = image["image"]["url"]
    full_size.class.should == String
  end

  it "provides a link to a thumbnail sized image from Amazon S3" do
    picture = Picture.create(remote_image_url: "http://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Taylor_Swift,_2012.jpg/220px-Taylor_Swift,_2012.jpg")
    url = "http://www.example.com/api/pictures/#{picture.id}"
    get "#{url}"

    image = JSON.parse(last_response.body)
    thumbnail =  image["image"]["thumbnail"]["url"]
    thumbnail.class.should == String
  end

  it "provides a link to a medium sized image from Amazon S3" do
    picture = Picture.create(remote_image_url: "http://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Taylor_Swift,_2012.jpg/220px-Taylor_Swift,_2012.jpg")
    url = "http://www.example.com/api/pictures/#{picture.id}"
    get "#{url}"

    image = JSON.parse(last_response.body)
    medium =  image["image"]["medium_size"]["url"]
    medium.class.should == String
  end
end

describe "post /api/v1/pictures", :type => :api do
  it "creates a valid entry" do
    url = "http://www.example.com/api/pictures"
    post "#{url}.json", :picture => {
                          :remote_image_url => "http://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Taylor_Swift,_2012.jpg/220px-Taylor_Swift,_2012.jpg"}
    

    last_response.status.should == 201
  end

  it "returns a full size image hosted on Amazon S3" do
    url = "http://www.example.com/api/pictures"
    post "#{url}.json", :picture => {
                          :remote_image_url => "http://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Taylor_Swift,_2012.jpg/220px-Taylor_Swift,_2012.jpg"}
    

    image = JSON.parse(last_response.body)
    full_size = image["image"]["url"]
    full_size.class.should == String
  end

  it "returns a medium size image hosted on Amazon S3" do
    url = "http://www.example.com/api/pictures"
    post "#{url}.json", :picture => {
                          :remote_image_url => "http://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Taylor_Swift,_2012.jpg/220px-Taylor_Swift,_2012.jpg"}
    

    image = JSON.parse(last_response.body)
    medium =  image["image"]["medium_size"]["url"]
    medium.class.should == String
  end

  it "returns a thumbnail image hosted on Amazon S3" do
    url = "http://www.example.com/api/pictures"
    post "#{url}.json", :picture => {
                          :remote_image_url => "http://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Taylor_Swift,_2012.jpg/220px-Taylor_Swift,_2012.jpg"}
    

    image = JSON.parse(last_response.body)
    thumbnail =  image["image"]["thumbnail"]["url"]
    thumbnail.class.should == String
  end
end

