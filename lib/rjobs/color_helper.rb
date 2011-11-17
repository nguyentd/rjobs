class String
  def colorize(text, color_code)
    "#{color_code}#{text}e[0m"
  end

  def red 
    colorize(self, "e[31m") 
  end
  def green 
    colorize(self, "e[32m")
  end
end
