require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'If adding with similar params' do

    let(:password) { "mD1234" }
    
    before(:each) do
      User.create!(email: "example@ex.ru", password: password)
    end

    context 'adding not unique record' do
      it 'should return error' do
        expect { User.create!(email: "example@ex.ru",  password: password) }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context 'when record is exist' do
      it 'should return false on nil-checcking' do
        expect(User.find_by(email: "example@ex.ru").nil?).to eq(false)
      end
    end
    
    context 'when record is removed from db' do
      it 'should return true on nil-checcking' do
        user = User.find_by(email: "example@ex.ru")
        user.delete
        expect(User.find_by(email: "example@ex.ru").nil?).to eq(true)
      end
    end
  end
end
