
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
# An created but not initialized event is passed to EventTarget.dispatchEvent().  Should raise 
# UNSPECIFIED_EVENT_TYPE_ERR EventException.
# @author Curt Arnold
# see[http://www.w3.org/TR/DOM-Level-2-Events/events#Events-EventTarget-dispatchEvent]
# see[http://www.w3.org/TR/DOM-Level-2-Events/events#xpointer(id('Events-EventTarget-dispatchEvent')/raises/exception[@name='EventException']/descr/p[substring-before(.,':')='UNSPECIFIED_EVENT_TYPE_ERR'])]
##
DOMTestCase('dispatchEvent02') do

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
  def test_dispatchEvent02
    doc = nil
    target = nil
    evt = nil
    preventDefault = nil
    doc = load_document("hc_staff", true)
      
      
    begin
      success = false;
      begin
        
      rescue EventException => ex
        success = (ex.code == EventException::UNSPECIFIED_EVENT_TYPE_ERR)
      end 
      assert(success, "throw_UNSPECIFIED_EVENT_TYPE_ERR")
    end 

  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/dispatchEvent02"
  end
end

