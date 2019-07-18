module Mutations
  class CreateBook < BaseMutation
    argument :user_id, Integer, required: true
    argument :title, String, required: true

    field :user, Types::UserType, null: false
    field :books, Types::BookType, null: false
    field :errors, [String], null: false

    def resolve(user_id:, title:)
      user = User.find(user_id)
      user.books.build(title: title)
      if user.save
        # Successful creation, return the created object with no errors
        {
          user: user,
          errors: [],
        }
      else
        # Failed save, return the errors to the client
        {
          user: nil,
          errors: user.errors.full_messages
        }
      end
    end
  end
end