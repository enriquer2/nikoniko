# frozen_string_literal: true

json.array! @feelings, partial: 'feelings/feeling', as: :feeling
