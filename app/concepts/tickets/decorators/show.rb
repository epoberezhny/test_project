module Tickets
  module Decorators
    class Show < SimpleDelegator
      def polygon
        @polygon ||= TestProject::Polygon.instance.parse(well_known_text)
      end

      def polygon_coordinates
        polygon.coordinates.map do |path|
          path.map do |coords|
            { lng: coords.first, lat: coords.last }
          end
        end
      end

      def polygon_center_coordinates
        centroid = polygon.centroid
        { lng: centroid.lon, lat: centroid.lat }
      end
    end
  end
end
