
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
#     The "getLocalName()" method for a Node
#     returns the local part of the qualified name of this node,
#     and for nodes of any type other than ELEMENT_NODE and ATTRIBUTE_NODE
#     and nodes created with a DOM Level 1 method, this is null.
#     
#     Retrieve the first employeeId node and get the first child of this node.
#     Since the first child is Text node invoking the "getLocalName()"   
#     method will cause "null" to be returned. 
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-NodeNSLocalN]
##
DOMTestCase('localName03') do

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
  def test_localName03
    doc = nil
    elementList = nil
    testEmployee = nil
    textNode = nil
    localName = nil
    doc = load_document("staffNS", false)
      elementList = doc.getElementsByTagName("employeeId")
      testEmployee = elementList.item(0)
      textNode = testEmployee.firstChild()
      
      assert_nil(localName, "textNodeLocalName")
      
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/localName03"
  end
end

