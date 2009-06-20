
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin


Copyright (c) 2001-2003 World Wide Web Consortium, 
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
#  The method getNamespaceURI returns the namespace URI of this node, or null if it is unspecified
#  For nodes of any type other than ELEMENT_NODE and ATTRIBUTE_NODE and nodes created with 
#  a DOM Level 1 method, such as createElement from the Document interface, this is always null.
#   
#  Ceate two new element nodes and atribute nodes, with and without namespace prefixes.
#  Retreive their namespaceURI's using getNamespaceURI and verrify if it is correct.
# @author IBM
# @author Neil Delima
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-NodeNSname]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=259]
##
DOMTestCase('nodegetnamespaceuri03') do

  ###
  # Constructor.
  # @param factory document factory, may not be null
  # @throws org.w3c.domts.DOMTestIncompatibleException Thrown if test is not compatible with parser configuration
  ##
  def setup
=begin
      org.w3c.domts.DocumentBuilderSetting[] settings = 
          new org.w3c.domts.DocumentBuilderSetting[] {
org.w3c.domts.DocumentBuilderSetting.namespaceAware
        };
        DOMTestDocumentBuilderFactory testFactory = factory.newInstance(settings)
        setFactory(testFactory)
=end

    ##
    ##   check if loaded documents are supported for content type
    ##
    contentType = getContentType()
    preload(contentType, "staff", false)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_nodegetnamespaceuri03
    doc = nil
    element = nil
    elementNS = nil
    attr = nil
    attrNS = nil
    elemNSURI = nil
    elemNSURINull = nil
    attrNSURI = nil
    attrNSURINull = nil
    nullNS = nil;

    doc = load_document("staff", false)
      
      
      
      
      
      
      
      
      assert_equal("http://www.w3.org/DOM/Test/elem", elemNSURI, "nodegetnamespaceuri03_elemNSURI")
            assert_nil(elemNSURINull, "nodegetnamespaceuri03_1")
      assert_equal("http://www.w3.org/DOM/Test/attr", attrNSURI, "nodegetnamespaceuri03_attrNSURI")
            assert_nil(attrNSURINull, "nodegetnamespaceuri03_2")
      
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/nodegetnamespaceuri03"
  end
end

