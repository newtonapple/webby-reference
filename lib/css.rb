module CSSHelper

  # CSS3 rounded corner for Mozilla & Webkit
  # options are: topleft, topright, bottomleft, bottomright
  def css3_rounded_corners( options={} )
    if options[:all]
      topleft, topright, bottomleft, bottomright = [ options[:all] ] * 4
    else
      topleft, topright, bottomleft, bottomright = options[:topleft], options[:topright], options[:bottomleft], options[:bottomright]
    end
    output = ''
    output << "-moz-border-radius-topleft: #{topleft}; -webkit-border-top-left-radius: #{topleft};" if topleft
    output << "-moz-border-radius-topright: #{topright}; -webkit-border-top-right-radius: #{topright};" if topright
    output << "-moz-border-radius-bottomleft: #{bottomleft}; -webkit-border-bottom-left-radius: #{bottomleft};" if bottomleft
    output << "-moz-border-radius-bottomright: #{bottomright}; -webkit-border-bottom-right-radius: #{bottomright};" if bottomright
    output
  end
  
  def css3_box_shadow( dimensions, color )
    <<-CSS
      -o-box-shadow:      #{dimensions} #{color};
      -icab-box-shadow:   #{dimensions} #{color};
      -khtml-box-shadow:  #{dimensions} #{color};
      -moz-box-shadow:    #{dimensions} #{color};
      -webkit-box-shadow: #{dimensions} #{color};
      box-shadow:         #{dimensions} #{color};
    CSS
  end
  
end # module CSSHelper

Webby::Helpers.register(CSSHelper)