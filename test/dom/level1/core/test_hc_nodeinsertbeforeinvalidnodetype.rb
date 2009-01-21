
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001-2003 World Wide Web Consortium,
(Massachusetts Institute of Technology, Institut National de
Recherche en Informatique et en Automatique, Keio University). All
Rights Reserved. This program is distributed under the W3C's Software
Intellectual Property License. This program is distributed in the
hope that it will be useful, but WITHOUT ANY WARRANTY; without even
the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.
See W3C License http://www.w3.org/Consortium/Legal/ for more details.

=end
#

require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'helper'))

###
#     The "insertBefore(newChild,refChild)" method raises a 
#     HIERARCHY_REQUEST_ERR DOMException if this node is of
#     a type that does not allow children of the type "newChild"
#     to be inserted.
#     
#     Retrieve the root node and attempt to insert a newly
#     created Attr node.   An Element node cannot have children
#     of the "Attr" type, therefore the desired exception
#     should be raised.
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#xpointer(id('ID-258A00AF')/constant[@name='HIERARCHY_REQUEST_ERR'])]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-952280727]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#xpointer(id('ID-952280727')/raises/exception[@name='DOMException']/descr/p[substring-before(.,':')='HIERARCHY_REQUEST_ERR'])]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-952280727]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=247]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=249]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=406]
##
DOMTestCase('hc_nodeinsertbeforeinvalidnodetype') do

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
    preload(contentType, "hc_staff", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_hc_nodeinsertbeforeinvalidnodetype
    doc = nil
    rootNode = nil
    newChild = nil
    elementList = nil
    refChild = nil
    insertedNode = nil
    doc = load_document("hc_staff", true)
      newChild = doc.createAttribute("title")
      elementList = doc.getElementsByTagName("p")
      refChild = elementList.item(1)
      rootNode = refChild.parentNode()
      
    begin
      success = false;
      begin
        insertedNode = rootNode.insertBefore(newChild, refChild)
      rescue Nokogiri::XML::DOMException => ex
        success = (ex.code == Nokogiri::XML::DOMException::HIERARCHY_REQUEST_ERR)
      end 
      assert(success, "throw_HIERARCHY_REQUEST_ERR")
    end

  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_nodeinsertbeforeinvalidnodetype"
  end
end
