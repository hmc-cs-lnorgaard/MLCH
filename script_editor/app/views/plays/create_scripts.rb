require 'nokogiri'

# plays = ["MND", "AWW", "Ant", "AYL", "Cor", "Cym", "Ham", "1H4", "2H4", "H5", "1H6", "2H6", "3H6", "H8", "JC", 
#         "Jn", "Lr", "LLL", "Luc", "Mac", "MM", "Ado", "Oth", "Per", "R2", "R3", "Rom", "Son", "Shr", "Err", 
#         "MV", "Wiv", "PhT", "Tmp", "TGV", "TNK", "WT", "Tim", "Tit", "Tro", "TN", "Ven"]

def createAllScripts()
    testplays = [['MND', 'a_midsummer_nights_dream'], ['AWW', 'alls_well_that_ends_well'], ['Ant', 'test123']]

    testplays.each do |play|
        text = createScript(play[0])
        filename = '../../../edited_' + play[1] + '.html'
        File.open(filename, "w") {|f| f.write(text)}
    end 
end

def createScript(title)

    doctitle = "../../../../FolgerDigitalTexts_XML_Complete/" + title.to_s + ".xml"

    doc = Nokogiri::XML(File.open(doctitle))

    # doc = Nokogiri::XML(File.open("../../../../FolgerDigitalTexts_XML_Complete/MND.xml"))
    
    htmlstring = ""

    currAct = 1
    currScene = 1
    currIndex = 1  

    acts = doc.css('//div1')
    acts.each do |act|
        if Nokogiri::XML(act.to_s).css('head').first != nil
            actname = "Diva" + currAct.to_s
            actheadname = "a" + currAct.to_s
            actstring = '<div class="actDiv" id="' + actname + '"><button class="acthead" id="a' + actheadname + '" data-cut="false" data-display="true">' + Nokogiri::XML(act.to_s).css("head").first.inner_text + '</button><br></b>'
            htmlstring << actstring
        end
        
        currAct = currAct + 1
        scenes = Nokogiri::XML(act.to_s).css('//div2')
        currScene = 1
        scenes.each do |scene|
            
            if Nokogiri::XML(scene.to_s).css('head').first != nil
                scenename = "Divs" + currScene.to_s
                sceneheadname = "s" + currScene.to_s
                scenestring = '<div class="sceneDiv" id="'+ scenename + '"><button class="scenehead" id="' + sceneheadname + '" data-cut="false" data-display="true">' +  Nokogiri::XML(scene.to_s).css('head').first.inner_text + '</button><br>'
                htmlstring << scenestring
            end
            
            currScene = currScene + 1
            currIndex = currIndex + 1

            lines = Nokogiri::XML(scene.to_s).css('//sp')
            stages = Nokogiri::XML(scene.to_s).css('stage').to_a

            lines.each do |line|
            # DISPLAY STAGE DIRECTIONS
                # Get line id
                lineN = line.attr("xml:id").to_s.gsub("sp-","").to_i

                stages.each do |stage|
                    # Get stage direction id
                    stageN = stage.attr('xml:id').to_s.gsub("stg-","").to_i
                    # If there is a stage dir that comes before the line
                    if (stageN < lineN) and (stageN >= lineN-1.0)
                        # display stage direction
                        stagestring = '<br><button class="stage" data-cut="false" data-display="true">' + stage.inner_text + '</button> <br>'
                        htmlstring << stagestring
                        stages.delete(stage)
                    end
                end

                # Getting all the info needed for each line
                speaker = Nokogiri::XML(line.to_s).css('speaker')
                milestones = Nokogiri::XML(line.to_s).css('milestone')
                spwords = Nokogiri::XML(line.to_s).css('w','c','pc')

                # DISPLAY SPEAKER
                speakerstring = '<br><p class="speaker">' + speaker.inner_text + '</p><br>'
                htmlstring << speakerstring

                # DISPLAY LINES
                milestones.each do |ms|

                    msN = ms.attr("xml:id").to_s.gsub("ftln-","").to_f
                    stages.each do |stage|
                        # Get stage direction id
                        stageN = stage.attr('xml:id').to_s.gsub("stg-","").to_f
                        # If there is a stage dir inside speech
                        if (stageN <= msN) and (stageN >= msN-1.0)
                        # display stage direction
                            stagestring = '<button class="stage inside" data-cut="false" data-display="true">' + stage.inner_text + '</button> <br>'
                            htmlstring << stagestring
                            stages.delete(stage)
                        end
                    end

                    # get line number
                    lineNum = ms.attr("n").to_s.split(".")[2]
                    # get corresps per milestone in array
                    wordIDs = ms.attr("corresp").to_s.split(" ")
                    # remove #s
                    wordIDs = wordIDs.map { |w| w.gsub("#","")}
                    # Search spwords for corresponding w/c/pc
                    
                    # DISPLAY LINE NUMBER
                    if lineNum.to_i % 5 == 0
                        linenumstring = '<p class="lineNum">' + lineNum.to_s + '</p>'
                        htmlstring << linenumstring
                    end

                    wordIDs.each do |id|
                        spwords.each do |word|
                            if word.attr('xml:id').to_s == id
                            # DISPLAY EACH WORD
                            if (word.inner_text == ".") || (word.inner_text == ",") || (word.inner_text == "?") || (word.inner_text == "!") || (word.inner_text == ";") || (word.inner_text == ":")
                                wordstring = '<button class="punc" data-cut="false" data-display="true">' + word.inner_text + '</button> '
                                htmlstring << wordstring
                            else
                                if word.inner_text != "" && word.inner_text != " "
                                    wordstring = '<button class="word" data-cut="false" data-display="true">' + word.inner_text + '</button> '
                                    htmlstring << wordstring
                                end
                            end
                        end
                    end
                end

                # BREAK FOR NEW LINE
                htmlstring << '<br>'


                stages.each do |stage|
                    # Get stage direction id
                    stageN = stage.attr('xml:id').to_s.gsub("stg-","").to_f
                    # If there is a stage dir inside speech
                    if (stageN >= msN) and (stageN < msN+1.0)
                        # display stage direction
                        stagestring = '<button class="stage inside" data-cut="false" data-display="true">' + stage.inner_text + '</button> <br>'
                        htmlstring << stagestring
                        stages.delete(stage)
                    end
                end

            end
            end

            htmlstring << '<br>'
            stages.each do |stage|
                stagestring = '<button class="stage" data-cut="false" data-display="true">' + stage.inner_text + '</button> <br>'
                htmlstring << stagestring
                stages.delete(stage)
            end
        end
        htmlstring << '</div>'
        htmlstring << '<br>'
    end
    htmlstring << '</div>'

    return htmlstring

end

createAllScripts()
