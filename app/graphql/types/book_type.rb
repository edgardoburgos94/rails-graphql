module Types
  class BookType < Types::BaseObject
    field :title, String, null: false
    field :id, Integer, null: false
  end
end
