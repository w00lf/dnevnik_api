require 'spec_helper'

describe DnevnikApi::Client do
  let(:get_response) {
    double("Get response")
  }
  before(:each) do
    allow(get_response).to receive(:body).and_return(mock_data)
    allow_any_instance_of(Faraday::Connection).to receive(:get).and_return(get_response)
  end

  def mock_data
    {
      id: 1000001035608,
      personId: 1000000225123,
      name: "Для_партнёров Сотрудник",
      email: "test@test.test",
      login: "teacher.p",
      fullName: "Сотрудник Для_партнёров",
      fullNameInverse: "Сотрудник Для_партнёров",
      firstName: "Для_партнёров",
      middleName: "",
      lastName: "Сотрудник",
      locale: "ru-RU",
      sex: "Male",
      photoSmall: "https://test1.csdnevnik.ru/user-avatar/2731f602053042faa1019c69d35800a5.s.jpg?d=20150313063950",
      photoMedium: "https://test1.csdnevnik.ru/user-avatar/2731f602053042faa1019c69d35800a5.m.jpg?d=20150313063950",
      photoLarge: "https://test1.csdnevnik.ru/user-avatar/2731f602053042faa1019c69d35800a5.l.jpg?d=20150313063950",
      birthday: "1988-12-12T00:00:00",
      roles: ''
    }
  end

  describe "#user" do
    it "Makes request and returns hash data" do
      client = DnevnikApi::Client.new(debug: true, token: 'foo token')
      expect(client.user(id: 'me')).to eq(mock_data)
    end
  end
end