require "spec_helper"

describe "get /api/documents", :type => :api do


  it "provides a valid response" do
    document = Document.create(remote_file_url: "http://www.danpink.com/PDF/AWNMforbusiness.pdf")
    url = "http://www.example.com/api/documents/#{document.id}"
    get "#{url}"

    last_response.status.should == 200
  end

  it "provides a link to the file from Amazon S3" do
    document = Document.create(remote_file_url: "http://www.danpink.com/PDF/AWNMforbusiness.pdf")
    url = "http://www.example.com/api/documents/#{document.id}"
    get "#{url}"

    file = JSON.parse(last_response.body)
    file_url = file["file"]["url"]
    file_url.include?("skinnyfiles").should == true
  end
end

describe "post /api/v1/documents", :type => :api do
  it "creates a valid entry" do
    Document.any_instance.should_receive(:broadcast).and_return(double)
    url = "http://www.example.com/api/documents"
    post "#{url}.json", :document => {
                          :remote_file_url => "http://www.danpink.com/PDF/AWNMforbusiness.pdf"}
    last_response.status.should == 201

  end

end