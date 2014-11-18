include ApplicationHelper

def fillup_form
  fill_in "from", with: "a"
  fill_in "to", with: "a"
  fill_in "date", with: "a"
end