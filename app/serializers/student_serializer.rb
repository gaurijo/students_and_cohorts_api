class StudentSerializer
  include JSONAPI::Serializer 
  attributes :first_name, :last_name, :preferred_name, :pronouns, :email, :github_username, :slack_username
end
