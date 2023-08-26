json.extract! page, :id, :name, :about, :website, :phone, :whatsapp, :created_at, :updated_at
json.url page_url(page, format: :json)
