
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin


Copyright (c) 2001 World Wide Web Consortium, 
(Massachusetts Institute of Technology, Institut National de
Recherche en Informatique et en Automatique, Keio University).  All 
Rights Reserved.  This program is distributed under the W3C's Software
Intellectual Property License.  This program is distributed in the 
hope that it will be useful, but WITHOUT ANY WARRANTY; without even
the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 
PURPOSE.  

See W3C License http://www.w3.org/Consortium/Legal/ for more details.


=end
#

require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'helper'))

###
#  The method createAttributeNS raises an INVALID_CHARACTER_ERR if the specified 
#  qualified name contains an illegal character
#  
#  Invoke the createAttributeNS method on this Document object with a valid value for 
#  namespaceURI, and qualifiedNames that contain illegal characters.  Check if the an
#  INVALID_CHARACTER_ERR was thrown.
# @author IBM
# @author Neil Delima
# see[http://www.w3.org/TR/DOM-Level-2-Core/core]
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-DocCrAttrNS]
##
DOMTestCase('documentcreateattributeNS03') do

  ###
  # Constructor.
  # @param factory document factory, may not be null
  # @throws org.w3c.domts.DOMTestIncompatibleException Thrown if test is not compatible with parser configuration
  ##
  def setup
    ##
    ##   check if loaded documents are supported for content type
    ##
    contentType = getContentType()
    preload(contentType, "staffNS", false)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_documentcreateattributeNS03
    doc = nil
    attribute = nil
    namespaceURI = "http://www.w3.org/DOM/Test/Level2";
    qualifiedName = nil
    qualifiedNames = []
      qualifiedNames << "/"
      qualifiedNames << "//"
      qualifiedNames << "\\"
      qualifiedNames << ";"
      qualifiedNames << "&"
      qualifiedNames << "*"
      qualifiedNames << "]]"
      qualifiedNames << ">"
      qualifiedNames << "<"
      
    doc = load_document("staffNS", false)
      indexid2288634 = 0
    while (indexid2288634 < qualifiedNames.size())
      qualifiedName = qualifiedNames.get(indexid2288634)
    
    begin
      success = false;
      begin
        
      rescue Nokogiri::XML::DOMException => ex
        success = (ex.code == Nokogiri::XML::DOMException::INVALID_CHARACTER_ERR)
      end 
      assert(success, "documentcreateattributeNS03")
    end
indexid2288634 += 1
            end
      
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/documentcreateattributeNS03"
  end
end

