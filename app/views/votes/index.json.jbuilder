json.array!(@votes) do |vote|
  json.extract! vote, :id, :value, :user_id, :answer_id
  json.url vote_url(vote, format: :json)
end
