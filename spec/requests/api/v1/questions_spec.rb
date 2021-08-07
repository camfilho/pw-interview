require 'rails_helper'

RSpec.describe "Api::V1::Questions", type: :request do
  describe "GET /index" do
    subject { get api_v1_questions_url, as: :json }
    it "returns http success" do
      subject
      expect(response).to have_http_status(:success)
    end

    it 'fetches all the questions' do
      user = User.create(name: 'anything')
      question = Question.create(user: user, title: 'Question?')
      Answer.create(body: 'body', question: question, user: user)

      subject
      result = JSON.parse(response.body)
      expect(result).to match_array(Question.all.includes(:answers).collect { _1.as_json.merge('answers' => _1.answers.as_json) })
    end
  end
end
