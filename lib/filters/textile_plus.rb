# If RedCloth is installed, then configure the textile filter
if try_require('redcloth', 'RedCloth')

  Webby::Filters.register :textile_plus do |input|
    red = RedCloth.new( input, [:no_span_caps] )
    red.hard_breaks = false
    red.to_html
  end

else
  Webby::Filters.register :textile_plus do |input|
    raise Webby::Error, "'RedCloth' must be installed to use the textile filter"
  end
end
