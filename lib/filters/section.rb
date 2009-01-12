# Automatically split <h2> into <div class="section"> blocks
# Assumes flat format, i.e. h2 must be on first level and is not nested (this means you can only apply this to pages not layouts)
# A more robust implementation is possible

if try_require('facets/string')
  Webby::Filters.register :section do |input|
    output = []
    seen_h2 = false
    input.shatter( /\<.*?\>/ ).each do |token|
      if token['<h2']
        if seen_h2
          output << '</div>'  # close section
        else
          seen_h2 = true
        end
        output.concat ['<div class="section">', token]
      else
        output <<  token
      end
    end

    output << '</div>' if seen_h2
    output.join
  end
else
  Webby::Filters.register :section do |input|
    raise Webby::Error, "Facets must be installed"
  end
end