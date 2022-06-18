require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit questions_url
  #
  #   assert_selector "h1", text: "Questions"
  # end
  
  # Check page renders and the question is specified text in a p element
  test "visiting /ask renders the form" do
    visit ask_url
    assert_selector "p", text: "Ask your coach anything"
    take_screenshot
  end

  # Test response to "Hello"
  test "saying Hello yields a grumpy response from the coach" do
    visit ask_url
    fill_in "question", with: "Hello"
    click_on "Ask"

    take_screenshot

    assert_text "I don't care, get dressed and go to work!"
  end

  # Test response to "What?"
  test "saying What? yields a grumpy response from the coach" do
    visit ask_url
    fill_in "question", with: "What?"
    click_on "Ask"

    assert_text "Silly question, get dressed and go to work!"
  end
  
  # Test response to "I am going to work"
  test "saying I am going to work yields a posiitve response from the coach" do
    visit ask_url
    fill_in "question", with: "I am going to work"
    
    click_on "Ask"

    take_screenshot
    
    assert_text "Great!"
  end  
    
end
