class Store < ActiveRecord::Base
  
  after_validation :fetch_place
  


  def fetch_place(address)
    Geocoder.configure(language: "ja", units: "km", :lookup => :google)
    Geocoder.search('address')
  end
end
