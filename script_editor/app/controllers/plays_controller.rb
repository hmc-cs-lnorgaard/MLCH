require 'nokogiri'
require_relative 'create_scripts'

class PlaysController < ApplicationController
  
  # POST /plays
  def save
    @data = params[:savedocument]
    @doctitle = params[:savetitle]
    @string = "edited_" + @doctitle + ".html"
    File.open(@string, "w") {|f| f.write(@data)}

  end

  def show


    plays = { "a_midsummer_nights_dream" => "MND", "alls_well_that_ends_well" => "AWW"}
    
    @doctitle = params[:play]
    
    @string = "edited_" + @doctitle + ".html"

    if File.exists?(@string)
      print "FILE FOUND. LOADING"
      @provideddocument = File.open(@string, "r")
      @provideddocument = File.read(@string)
    else 
      print "NO DOCUMENT PROVIDED. CREATING NEW ONE"
      @provideddocument = createScript(plays[@doctitle])  #perhaps here we can provide the html files we already have?
      #until then we can check in the HTML if this variable is equal to "" and if so parse it there
      File.open(@string, "w") {|f| f.write(@provideddocument)}
    end
  end
end
