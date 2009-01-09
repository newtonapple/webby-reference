# if try_require('maruku', 'maruku')
#   Webby::Filters.register :markdown do |input|
#     Maruku.new(input).to_html
#   end
# elsif try_require('rdiscount', 'rdiscount')
if try_require('bluecloth', 'BlueCloth')

  Webby::Filters.register :md do |input|
    BlueCloth.new(input).to_html  # use bluecloth instead rdiscount can't handle ultraviolet (and so is maruku)
  end

# Otherwise raise an error if the user tries to use markdown
else
  Webby::Filters.register :md do |input|
    raise Webby::Error, "'rdiscount' must be installed to use the markdown filter"
  end
end

# EOF
