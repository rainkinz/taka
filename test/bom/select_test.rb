require 'helper'

## Change to BOMTestCase?
DOMTestCase('HTMLSelectElement01') do

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
    preload(contentType, "select", false)
  end  

  # dom/level1/html/test_htmlselectelement01.rb
  def test_selected_element
    doc = load_document("select", false) 
    select = doc.getElementById('selectId')
    # nodeList = doc.getElementsByTagName("select")
    # select = nodeList.first
    assert select
    assert_equal 0, select.selectedIndex
    select.selectedIndex = 2
    assert_equal 2, select.selectedIndex
  end
  
end
