require 'spec_helper'

describe DnevnikApi::Configuration do
  let(:client_id) { "some_api_id" }
  let(:client_secret) { "some_api_secret" }
  let(:another_api_url_base) { "http://google.com/v1" }
  let(:another_oauth_url_base) { "http://yandex.ru/v1" }


  describe "#configure" do
    it("Sets arguments for later use") do
      atrrs = [:client_id, :client_secret]
      atrrs.each do |attr|
        expect(DnevnikApi.configuration.send(attr)).to be_nil
        DnevnikApi.configuration.send("#{attr}=", send(attr))
        expect(DnevnikApi.configuration.send(attr)).to eq(send(attr))
      end
    end

    it("Can change base url of oauth and api") do
      [:api_url_base, :oauth_url_base].each do |attr|
        another_attr = send("another_#{attr}")
        expect(DnevnikApi.configuration.send(attr)).to_not eq(another_attr)
        DnevnikApi.configuration.send("#{attr}=", another_attr)
        expect(DnevnikApi.configuration.send(attr)).to eq(another_attr)
      end
    end
  end
end