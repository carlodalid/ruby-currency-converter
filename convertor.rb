#!/usr/local/bin/ruby

require 'open-uri'
require 'rexml/document'

class Convertor
  def getCurrConversion( fromCurr, toCurr )
    xmlstring = ""
    begin
      open("http://www.webservicex.net/CurrencyConvertor.asmx/ConversionRate?FromCurrency=#{fromCurr}&ToCurrency=#{toCurr}") {|resp|
        xmlstring = REXML::Document.new resp.string
      }
    rescue
       return false
    end

    return xmlstring.root.get_text
  end
end
