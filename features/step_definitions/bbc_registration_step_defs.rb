Given("I access the bbc registration page") do
  @bbc_site = BBC_Site.new
  @bbc_site.get_temp_email.visit_minute_inbox
  @email = @bbc_site.get_temp_email.get_email
  @bbc_site.bbc_homepage.visit_home_page
  @bbc_site.bbc_homepage.click_sign_in_link
  @bbc_site.bbc_homepage.go_to_register
end

Given("I pick a valid age and date of birth and submit it") do
  @bbc_site.bbc_registration.click_13_or_over
  @bbc_site.bbc_registration.fill_in_date_of_birth
  @bbc_site.bbc_registration.submit_dob

end

Given("fill in the form") do
  @bbc_site.bbc_registration.fill_in_email(@email)
  @bbc_site.bbc_registration.fill_in_password
  @bbc_site.bbc_registration.fill_in_postcode
  @bbc_site.bbc_registration.choose_gender
  @bbc_site.bbc_registration.opt_out

end

When("I click to register") do
  @bbc_site.bbc_registration.registration_button
end

Then("I get redirected that confirms I have registered") do
  expect(@bbc_site.bbc_registration.check_true).to eql "Thanks. You're now signed in."
end

Given("fill in the form with a wrong password") do
  @bbc_site.bbc_registration.fill_in_email(@email)
  @bbc_site.bbc_registration.fill_in_wrong_password
  @bbc_site.bbc_registration.fill_in_postcode
  @bbc_site.bbc_registration.choose_gender
  @bbc_site.bbc_registration.opt_out
end

Then("find a password error message") do
  expect(@bbc_site.bbc_registration.find_wrong_password).to eql "Sorry, that password is too short. It needs to be eight characters or more."
end

Given("fill in the form with a existing email") do
  @bbc_site.bbc_registration.fill_in_existing_email
  @bbc_site.bbc_registration.fill_in_password
  @bbc_site.bbc_registration.fill_in_postcode
  @bbc_site.bbc_registration.choose_gender
  @bbc_site.bbc_registration.opt_out
end

Then("find a email error explaining user exists") do
  expect(@bbc_site.bbc_registration.find_error_email).to eql "Looks like you’ve already registered with this email. Want to sign in?"
end


Given("fill in the form with a invalid email address") do
  @bbc_site.bbc_registration.fill_in_invalid_email
  @bbc_site.bbc_registration.fill_in_password
  @bbc_site.bbc_registration.fill_in_postcode
  @bbc_site.bbc_registration.choose_gender
  @bbc_site.bbc_registration.opt_out
end

Then("find a email error explaining that the it isn't a proper email") do
  expect(@bbc_site.bbc_registration.find_error_email).to eql "Sorry, that email doesn’t look right. Please check it's a proper email."
end

Given("fill in the form with a invalid postcode") do
  @bbc_site.bbc_registration.fill_in_email(@email)
  @bbc_site.bbc_registration.fill_in_password
  @bbc_site.bbc_registration.fill_in_wrong_postcode
  @bbc_site.bbc_registration.choose_gender
  @bbc_site.bbc_registration.opt_out
end

Then("find a postcode error message explaining that it isn't a proper postcode") do
  expect(@bbc_site.bbc_registration.find_wrong_postcode).to eql "Sorry, that postcode isn't valid. Please check it's a proper postcode."
end

Given("fill in the form with a longer than expected postcode") do
  @bbc_site.bbc_registration.fill_in_email(@email)
  @bbc_site.bbc_registration.fill_in_password
  @bbc_site.bbc_registration.long_postcode
  @bbc_site.bbc_registration.choose_gender
  @bbc_site.bbc_registration.opt_out
end

Then("find a postcode error message explaining that the postcode is too long") do
  expect(@bbc_site.bbc_registration.find_wrong_postcode).to eql "Sorry, that postcode's too long. Please check it's a proper postcode."
end
