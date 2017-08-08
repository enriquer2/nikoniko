# frozen_string_literal: true

json.extract! feeling, :id, :day, :status, :user_id, :created_at, :updated_at
json.url feeling_url(feeling, format: :json)
