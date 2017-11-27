require 'ethereum'

namespace :eth do
  desc 'create contract address'
  task :create_address do
    address = Figaro.env.eth_exchanger_address
    file = Rails.root.join('contracts', 'transfer.sol').to_s
    client = Ethereum::HttpClient.new(Figaro.env.eth_rpc)

    client.default_account = address
    contract = Ethereum::Contract.create(client: client, file: file)
    client.personal_unlock_account(address, Figaro.env.eth_exchanger_password)
    address = contract.deploy_and_wait(Figaro.env.eth_exchanger_address)
  end
end
