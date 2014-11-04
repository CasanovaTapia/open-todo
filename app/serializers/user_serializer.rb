class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at,

  def email
    object.email
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
