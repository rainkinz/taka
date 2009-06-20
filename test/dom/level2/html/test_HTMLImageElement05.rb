
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
#     The height attribute overrides the natural "height" of the image.
#     Retrieve the height attribute and examine it's value.  
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/DOM-Level-2-HTML/html#ID-91561496]
##
DOMTestCase('HTMLImageElement05') do

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
    preload(contentType, "img", false)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_HTMLImageElement05
    nodeList = nil
    testNode = nil
    vheight = nil
    doc = nil
    doc = load_document("img", false)
      nodeList = doc.getElementsByTagName("img")
      assertSize("Asize", 1, nodeList)
      testNode = nodeList.item(0)
      vheight = testNode.height()
      assert_equal(47, vheight, "heightLink")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/HTMLImageElement05"
  end
end

