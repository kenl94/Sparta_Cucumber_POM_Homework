Given("I access the bbc login page") do
  @bbc_site = BBC_Site.new
  @bbc_site.bbc_homepage.visit_home_page
  @bbc_site.bbc_homepage.click_sign_in_link

end

Given("I input incorrect username details") do
  @bbc_site.bbc_login.enter_wrong_email
end

Given("I input incorrect password details") do
  @bbc_site.bbc_login.enter_wrong_password
end

When("I try to Login") do
  @bbc_site.bbc_login.click_submit
end

Then("I receive an error") do
  expect(@bbc_site.bbc_login.no_such_account).to eql "Sorry, we can’t find an account with that email. You can register for a new account or get help here."
end

Given("I input correct username details") do
  @bbc_site.bbc_login.enter_email
end

Then("I receive an error of incorrect password") do
  expect(@bbc_site.bbc_login.find_password).to eql "Uh oh, that password doesn’t match that account. Please try again."
end

Given("I input short password details") do
  @bbc_site.bbc_login.short_password
end

Then("I receive an error of password is too short") do
  expect(@bbc_site.bbc_login.short_password_error).to eql "Sorry, that password is too short. It needs to be eight characters or more."
end
