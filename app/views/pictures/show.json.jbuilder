json.id @picture.id
json.image_url @picture.image_url
json.thumbnail @picture.image_url(:thumbnail)
json.medium @picture.image_url(:medium_size)