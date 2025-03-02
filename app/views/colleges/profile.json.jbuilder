json.id @college.id
json.name @college.name
json.city @college.city
json.state @college.state
json.country @college.country
json.description @college.description
json.website @college.website
json.profile_background_image_url url_for(@college.profile_background_image)
json.logo_url url_for(@college.logo)
json.courses @courses do |course|
  json.id course.id
  json.name course.name
  json.description course.description
  json.duration course.duration
  json.eligibility course.eligibility
  json.full_form course.full_form
end