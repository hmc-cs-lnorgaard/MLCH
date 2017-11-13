require 'nokogiri'

class PlaysController < ApplicationController
  
  # POST /plays
  def save
    @data = params[:savedocument]
    # @doctitle = params[:savetitle]
    @string = "edited_" + "a_midsummer_nights_dream" + ".html"
    File.open(@string, "w") {|f| f.write(@data)}

  end

  def show
    
    @doctitle = params[:play]
    
    @string = "edited_" + @doctitle + ".html"

    if File.exists?(@string)
      @provideddocument = File.open(@string, "r")
      @provideddocument = File.read(@string)
    else 
      @provideddocument = ""  #perhaps here we can provide the html files we already have?
      #until then we can check in the HTML if this variable is equal to "" and if so parse it there
    end
    
    # These variables will change as we parse through the play
    #theSynopsis = doc.css('//div[type="synopsis"]').text
    #currentPlay = doc.css('//titleStmt/title').inner_text
    #currentLine = "default"
    #currentWord = "default"
    #wordId = "default"
    #currentSpeaker = "default"
    #speakerNameHasTwoWords = false
    #wordIsSpeaker = false
    #oneMoreAct = false
    #oneMoreScene = false

    # Add the title to the top of the page
    #title = Nokogiri::XML::Node.new "p", htmldoc
    #title['id'] = 'title'
    #title.content = currentPlay
    #titleP.add_next_sibling(title)

    # Add the synopsis text but hide it
    #hidden = Nokogiri::XML::Node.new "div", htmldoc
    #hidden['class'] = 'hidden-synopsis'
    #hidden.content = theSynopsis
    #navP.add_next_sibling(hidden)

    # Add a tab for synopsis in navigation bar
    #synopsis = Nokogiri::XML::Node.new "button", htmldoc
    #synopsis['class'] = 'nav-synopsis'
    #synopsis.content = "SYNOPSIS"
    #synopsis.parent = div
    #currentDiv = synopsis

    # Loop through all of the words in the play
  	#doc.css('w').each do |node|
  		#children = node.children

      #currentLine = node['n']
      #wordId = node['xml:id']
      #currentWord = children.inner_text

      # This loops checks if the word is a speaker and updates currentSpeaker
  		#if (currentWord == currentWord.upcase)
  			#if (currentWord.length > 2 and not(currentWord == "ACT") and not(currentWord == "EPILOGUE"))
  				#if (speakerNameHasTwoWords)
            #currentSpeaker += " " + currentWord
            #speakerNameHasTwoWords = false
          #elsif (currentWord == "FIRST" or currentWord == "SECOND" or currentWord == "THIRD")
            #currentSpeaker = currentWord
            #speakerNameHasTwoWords = true
          #else 
            #currentSpeaker = currentWord
          #end
          #wordIsSpeaker = true
        #else
          #wordIsSpeaker = false
  			#end
      #else
        #wordIsSpeaker = false
      #end

    



  	#end	
    #puts htmldoc
    #File.write("app/views/plays/show.html.erb", htmldoc)
  end
end
