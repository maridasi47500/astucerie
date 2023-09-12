json.extract! tip, :id, :user_id, :title, :image, :content, :created_at, :updated_at
json.url tip_url(tip, format: :json)
