
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
#     The deleteCell() method throws a INDEX_SIZE_ERR DOMException
#     if the specified index is greater than the number of cells. 
#  
#     Retrieve the fourth TR element which has six cells.  Try
#     to delete a cell using an index of seven.  This should throw
#     a INDEX_SIZE_ERR DOMException since there are only six cells.
# @author NIST
# @author Rick Rivello
# see[http://www.w3.org/TR/DOM-Level-2-HTML/html#ID-11738598]
# see[http://www.w3.org/TR/DOM-Level-2-HTML/html#xpointer(id('ID-11738598')/raises/exception[@name='DOMException']/descr/p[substring-before(.,':')='INDEX_SIZE_ERR'])]
##
DOMTestCase('HTMLTableRowElement17') do

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
    preload(contentType, "tablerow", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_HTMLTableRowElement17
    nodeList = nil
    testNode = nil
    doc = nil
    doc = load_document("tablerow", true)
      nodeList = doc.getElementsByTagName("tr")
      assertSize("Asize", 5, nodeList)
      testNode = nodeList.item(3)
      
    begin
      success = false;
      begin
        testNode.deleteCell(7)
      rescue Nokogiri::XML::DOMException => ex
        success = (ex.code == Nokogiri::XML::DOMException::INDEX_SIZE_ERR)
      end 
      assert(success, "HTMLTableRowElement17")
    end

  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/HTMLTableRowElement17"
  end
end

