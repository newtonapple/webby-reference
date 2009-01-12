if try_require('maruku', 'maruku')
  Webby::Filters.register :maruku do |input|
    Maruku.new(input).to_html
  end
else
  Webby::Filters.register :maruku do |input|
    raise Webby::Error, "Maruku must be installed to use the maruku filter"
  end
end