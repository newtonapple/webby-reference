if try_require('bluecloth', 'BlueCloth')
  Webby::Filters.register :md do |input|
    BlueCloth.new(input).to_html  # use bluecloth instead rdiscount can't handle ultraviolet (and so is maruku)
  end
else
  Webby::Filters.register :md do |input|
    raise Webby::Error, "'Bluecloth' must be installed to use the md filter"
  end
end
