class QuestionSerializer < ActiveModel::Serializer
  def attributes(*args)
    object.attributes.symbolize_keys
  end

  has_many :answers
end
