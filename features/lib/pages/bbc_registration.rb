require 'capybara/dsl'

class BBC_Registration

  include Capybara::DSL

  #Constants
  OVER_THIRTEEN = "13 or over"
  DAY = "dateOfBirthDay"
  MONTH = "dateOfBirthMonth"
  YEAR = "dateOfBirthYear"
  DOB_BUTTON = '#submit-button'
  EMAIL_INPUT = 'Email'
  PASSWORD_INPUT = 'Password'
  POSTCODE = 'Postcode'
  REGISTRATION_SUBMIT = '#submit-button'
  WRONG_PASSWORD = "wrong1"
  PASSWORD_ERROR = "#form-message-password"
  EMAIL = "kaylii.chyanne@lm0k.com"
  INVALID_EMAIL = "hehemail.com"
  WRONG_POSTCODE = "222333"
  WRONG_POSTCODE_ERROR = "#form-message-postcode > p"
  LONG_POSTCODE = "Longer than expected"

# # Don't need initialize, because it is set up in rspec and it does this before pulling in fules.
# @session is set up in the test, so don't need to set it up
  # def initialize
  #   Capybara.register_driver :chrome do |app|
  #     Capybara::Selenium::Driver.new(app, :browser => :chrome)
  #   end
  #   @session = Capybara::Session.new(:chrome)
  # end

  def click_13_or_over
    click_link(OVER_THIRTEEN)
    sleep 1
  end

  def fill_in_date_of_birth
    fill_in DAY, with: "27"
    sleep 1
    fill_in MONTH, with: "07"
    sleep 1
    fill_in YEAR, with: "1994"
    sleep 1
  end

  def submit_dob
    find(DOB_BUTTON).click
    # @session.click_button 'Continue'
    sleep 1
  end

  def fill_in_email(email)
    fill_in EMAIL_INPUT, with: email
    sleep 1
  end

  def fill_in_existing_email
    fill_in EMAIL_INPUT, with: EMAIL
    sleep 1
  end

  def fill_in_invalid_email
    fill_in EMAIL_INPUT, with: INVALID_EMAIL
  end

  def find_error_email
    find("#form-message-email > p").text
  end

  def fill_in_password
    fill_in PASSWORD_INPUT, with: "Password@1"
    sleep 1
  end

  def fill_in_wrong_password
    fill_in PASSWORD_INPUT, with: WRONG_PASSWORD
    sleep 1
  end

  def find_wrong_password
    find(PASSWORD_ERROR).text
  end

  def fill_in_postcode
    fill_in POSTCODE, with: "TW10 6TF"
    sleep 1
  end

  def fill_in_wrong_postcode
    fill_in POSTCODE, with: WRONG_POSTCODE
  end

  def long_postcode
    fill_in POSTCODE, with: LONG_POSTCODE
  end

  def find_wrong_postcode
    find(WRONG_POSTCODE_ERROR).text
  end

  def choose_gender
    select 'Male', from: 'Gender'
    sleep 1
  end

  def opt_out
    # all('.button__text-wrapper')[1].click
    # @session.find_button("")
    all('.button__text-wrapper').each do |x|
      if x.text == "No, thanks"
        x.click[1]
      end
    end
    sleep 2
  end

  def registration_button
    find(REGISTRATION_SUBMIT).click
    sleep 5
  end

  def check_true
    find("#container > div > div > div > div.page__wrapper > div.page__grid-wrapper > div.page__content-wrapper > div > h1 > span").text
    # has_content?("Thanks. You're now signed in.")
  end

end
