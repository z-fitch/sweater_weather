class UserSerializer
  include JSONAPI::Serializer

  attributes :email, :api_key

  attribute :api_key do 
    SecureRandom.hex
  end
end