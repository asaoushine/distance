class User < ActiveRecord::Base
  
  # reverse_geocoded_by :latitude, :longitude
  # after_validation :reverse_geocode, if: Proc.new { |a| a.latitude_changed? or a.longitude_changed? }

  geocoded_by :address
  after_validation :geocode, if: Proc.new { |a| a.address_changed? }

  class << self
    def within_box(distance, latitude, longitude)
      distance = distance # 単位はマイル
      center_point = [latitude, longitude] # 緯度経度
      box = Geocoder::Calculations.bounding_box(center_point, distance)
      self.within_bounding_box(box)
    end
  end
end
