require File.expand_path('../spec_helper', __FILE__)

describe "FormatterSan::Formatters::Simple" do
  it "should function properly" do
    [
      ["Word", "<p>Word</p>"],
      ["1\n\n2", "<p>1</p>\n\n<p>2</p>"],
      ["1\r\n\r\n2", "<p>1</p>\n\n<p>2</p>"],
      ["<div>Word</div>", "<div>Word</div>"],
      ["<div>Word\n\nWord</div>", "<div>Word\n\nWord</div>"],
      ["<div>\n\nSomething\n\n</div>Word", "<div>\n\nSomething\n\n</div>\n\n<p>Word</p>"],
      ["<pre>Words\n\nWords\n\nWords</pre><div>Word</div>",
          "<pre>Words\n\nWords\n\nWords</pre>\n\n<div>Word</div>"],
      ["<pre>Word Word</prei>\n\nWord\n\n<pre>Word</pre>\n\nWord",
        "<pre>Word Word</prei>\n\nWord\n\n<pre>Word</pre>\n\n<p>Word</p>"],
      ["Put your 'pants' on.", "<p>Put your &#8216;pants&#8217; on.</p>"],
      ["<div class=\"image\"></div>", "<div class=\"image\"></div>"],
      ["Here's a nice picture of us at EuroOSCON. I'm the one with the glasses, Manfred is the slightly fuzzier fellow wearing the brown shirt.

      <div class=\"image\">
      <a href=\"http://flickr.com/photos/x180/53597017/in/set-1145208\"><img src=\"http://www.fngtps.com/files/2/2005/12/53597017_ca9d21bff8_o-450px.jpg\" alt=\"Fingertips at EuroOSCON 2005\" /></a>
      <p class=\"caption\">Photo by <a href=\"http://duncandavidson.com/\">James Duncan Davidson</a>/O'Reilly Media</p>
      </div>", "<p>Here&#8217;s a nice picture of us at EuroOSCON. I&#8217;m the one with the glasses, Manfred is the slightly fuzzier fellow wearing the brown shirt.</p>\n\n      <div class=\"image\">\n      <a href=\"http://flickr.com/photos/x180/53597017/in/set-1145208\"><img src=\"http://www.fngtps.com/files/2/2005/12/53597017_ca9d21bff8_o-450px.jpg\" alt=\"Fingertips at EuroOSCON 2005\" /></a>\n      <p class=\"caption\">Photo by <a href=\"http://duncandavidson.com/\">James Duncan Davidson</a>/O&#8217;Reilly Media</p>\n      </div>"],
      ['<h2>Word</h2>', '<h2>Word</h2>'],
      ['<h8>Word</h8>', '<p><h8>Word</h8></p>'],
      ['<blockquote cite="http://martinfowler.com/bliki/EvaluatingRuby.html"><p>Too many things.</p></blockquote>', '<blockquote cite="http://martinfowler.com/bliki/EvaluatingRuby.html"><p>Too many things.</p></blockquote>'],
      ["'quoted text'<code>+----+</code>", "<p>&#8216;quoted text&#8217;<code>+----+</code></p>"],
      ["<param />\n\nword\n\nword", "<param />\n\n<p>word</p>\n\n<p>word</p>"]
    ].each do |input, expected|
      FormatterSan::Formatters::Simple.format(input).should == expected
    end
  end
end