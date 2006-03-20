module Vpim
  class Icalendar
    module Property
      module Location
        # Physical location information relevant to the component, or nil if
        # there is no LOCATION property.
        def location
          proptext 'LOCATION'
        end

        # Array of Float, +[ latitude, longitude]+.
        #
        # North or equator is postive latitude, East of meridian is positive logitude.
        #
        # See RFC2445 for more info... there are lots of special cases.
        def geo
          prop = @properties.detect { |f| f.name? 'GEO' }
          if prop
            prop = Vpim.decode_list(prop.value_raw, ';') do |item| item.to_f end
          end
          prop
        end

      end
    end
  end
end


