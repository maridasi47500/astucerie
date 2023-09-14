json.extract! myfav, :id, :user_id, :tip_id,:total_number,:addedtomyfav,:addedtomyfavyesno, :created_at, :updated_at
json.url myfav_url(myfav, format: :json)
