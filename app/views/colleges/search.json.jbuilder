json.id @college.id
json.name @college.name
json.description @college.description
json.display_address display_address(@college)
json.image_url url_for(@college.profile_background_image)