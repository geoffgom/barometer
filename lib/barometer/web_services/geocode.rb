module Barometer
  #
  # Web Service: Geocode
  #
  # uses Google Maps Geocoding service
  #
  class WebService::Geocode < WebService
    
    def self.fetch(query)
      raise ArgumentError unless _is_a_query?(query)
      puts "geocoding: #{query.q}" if Barometer::debug?
      return nil unless _has_geocode_key?
      location = self.get(
        "http://maps.google.com/maps/geo",
        :query => {
          :gl => query.country_code, :key => Barometer.google_geocode_key,
          :output => "json", :q => query.q, :sensor => "false"
        },
        :format => :json, :timeout => Barometer.timeout
      )
      location = location['kml']['Response'] if (location && location['kml'])
      location ? (geo = Data::Geo.new(location)) : nil
    end

    private
    
    def self._has_geocode_key?
      !Barometer.google_geocode_key.nil?
    end
    
  end
end


