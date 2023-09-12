json.extract! myfav, :id, :user_id, :tip_id, :created_at, :updated_at
json.url myfav_url(myfav, format: :json)
