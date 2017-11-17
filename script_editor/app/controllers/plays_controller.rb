require 'nokogiri'
require "create_scripts"

class PlaysController < ApplicationController
  
  # POST /plays
  def save
    @data = params[:savedocument]
    @doctitle = params[:savetitle]
    @string = "edited_" + @doctitle + ".html"
    File.open(@string, "w") {|f| f.write(@data)}

  end

  def show
    
    @doctitle = params[:play]
    
    @string = "edited_" + @doctitle + ".html"

    if File.exists?(@string)
      @provideddocument = File.open(@string, "r")
      @provideddocument = File.read(@string)
    else 
      print "NO DOCUMENT PROVIDED. CREATING NEW ONE"
      @provideddocument = ""  #perhaps here we can provide the html files we already have?
      #until then we can check in the HTML if this variable is equal to "" and if so parse it there
    end
  end
end
