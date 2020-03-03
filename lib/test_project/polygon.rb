module TestProject
  class Polygon
    include Singleton

    def parse(wkt)
      return unless wkt

      parsed_wkt = @factory.parse_wkt(wkt)
      parsed_wkt.geometry_type == RGeo::Feature::Polygon ? parsed_wkt : nil
    rescue RGeo::Error::ParseError, RGeo::Error::InvalidGeometry
      nil
    end

    private

    def initialize
      @factory = RGeo::Geographic.spherical_factory
    end
  end
end
