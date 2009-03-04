module FormatterSan
  # The formatter does a few things for you; it turns blocks of text into paragraphs and converts
  # several characters to nicer looking alternatives using Rubypants.
  class Formatter
    attr_accessor :input
    
    def initialize(input)
      @input = input
    end
    
    # Returns the formatted version of the input
    def format
      output = @input.to_s.dup
      output.gsub!(/(\r\n|\n|\r)/, "\n")
      output.gsub!(/\n\n+/, "\n\n")
      
      in_html = false
      endtag = ''
      blocklist = output.split("\n\n").collect do |part|
        # we're in an html block or in a normal block
        unless in_html
          # if we find an html block, set the flag for it
          if (match = /^\s*<(h[1-6]|address|blockquote|center|div|dl|ol|pre|p|table|ul)(\w*)([^>]*)>(.*)$/.match(part))
            endtag = "</#{match[1..2].join}>"
            
            end_tag_in_part = !part.index(endtag).nil?
            autoclosing_tag = (match[3][-1] == '/'[-1])
            
            unless end_tag_in_part or autoclosing_tag
              in_html = true
            end
            part
          else
            "<p>#{part}</p>"
          end
        else
          # If this block has the end tag for the html tag we discovered, we're no longer
          # in the html block. If there is some text after the html, create a new paragrapgh for
          # it.
          if (index = part.index(endtag))
            in_html = false
            endindex = index + endtag.length
            unless part.length == endindex
              part[0..(endindex-1)] + "\n\n" + part[endindex..-1].format.exiguous
            else
              part
            end
          else
            part
          end
        end
      end
      RubyPants.new(blocklist.join("\n\n")).to_html
    end
  end
end