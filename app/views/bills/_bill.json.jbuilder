json.extract! bill, :id, :email_id, :name, :amount_paid, :shop_id, :created_at, :updated_at
json.url bill_url(bill, format: :json)
