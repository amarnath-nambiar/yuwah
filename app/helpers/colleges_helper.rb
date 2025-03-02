module CollegesHelper
  def display_address(college)
    address = "#{college.city}, #{college.state}"
    address += ", #{college.country}" unless college.country.downcase == "india"
    address
  end
end