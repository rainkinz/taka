
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin


Copyright (c) 2001-2004 World Wide Web Consortium, 
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
#     The "importNode(importedNode,deep)" method for a 
#    Document should import the given importedNode into that Document.
#    The importedNode is of type Entity_Reference.
#    Only the EntityReference is copied, regardless of deep's value.
#    If the Document provides a definition for the entity name, its value is assigned.
#    
#    Create an entity reference whose name is "ent3" in a different document.
#    Invoke method importNode(importedNode,deep) on this document with importedNode
#    being "ent3".
#    Method should return a node of type Entity_Reference whose first child's value is "Texas" as defined
#    in this document.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#Core-Document-importNode]
##
DOMTestCase('importNode11') do

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
    preload(contentType, "staff", true)
    preload(contentType, "staff", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_importNode11
    doc = nil
    aNewDoc = nil
    entRef = nil
    aNode = nil
    name = nil
    child = nil
    childValue = nil
    doc = load_document("staff", true)
      aNewDoc = load_document("staff", true)
      entRef = aNewDoc.createEntityReference("ent3")
      assert_not_nil(entRef, "createdEntRefNotNull")
      
      name = aNode.nodeName()
      assert_equal("ent3", name, "entityName")
            child = aNode.firstChild()
      assert_not_nil(child, "child")
      childValue = child.nodeValue()
      assert_equal("Texas", childValue, "childValue")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/importNode11"
  end
end

