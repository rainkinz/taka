
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
#    The importedNode is of type Entity.
#    
#    Retrieve entity "ent6" from staffNS.xml document.  
#    Invoke method importNode(importedNode,deep) on this document.
#    Method should return a node of type Entity whose publicId, systemId and
#    notationName attributes are copied.
#    The returned node should belong to this document whose systemId is "staff.dtd"
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#Core-Document-importNode]
##
DOMTestCase('importNode09') do

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
    preload(contentType, "staffNS", true)
    preload(contentType, "staffNS", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_importNode09
    doc = nil
    aNewDoc = nil
    doc1Type = nil
    entityList = nil
    entity2 = nil
    entity1 = nil
    ownerDocument = nil
    docType = nil
    system = nil
    entityName = nil
    publicVal = nil
    notationName = nil
    doc = load_document("staffNS", true)
      aNewDoc = load_document("staffNS", true)
      docType = aNewDoc.doctype()
      entityList = docType.entities()
      assert_not_nil(entityList, "entitiesNotNull")
      entity2 = entityList.getNamedItem("ent6")
      
      ownerDocument = entity1.ownerDocument()
      docType = ownerDocument.doctype()
      
      assertURIEquals("dtdSystemId", nil, nil, nil, "staffNS.dtd", nil, nil, nil, nil, system)
entityName = entity1.nodeName()
      assert_equal("ent6", entityName, "entityName")
            publicVal = entity1.publicId()
      assert_equal("uri", publicVal, "entityPublicId")
            system = entity1.systemId()
      assertURIEquals("entitySystemId", nil, nil, nil, "file", nil, nil, nil, nil, system)
notationName = entity1.notationName()
      assert_equal("notation2", notationName, "notationName")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/importNode09"
  end
end

