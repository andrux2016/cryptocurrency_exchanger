require 'ethereum'

namespace :eth do
  desc 'create contract address'
  task create_address: :environment do
    address = Figaro.env.eth_exchanger_address
    file = Rails.root.join('contracts', 'transfer.sol').to_s
    client = Ethereum::HttpClient.new(Figaro.env.eth_rpc)
    client.default_account = address
    contract = Ethereum::Contract.create(client: client, file: file)

    response = client.personal_unlock_account(address, Figaro.env.eth_exchanger_password)
    unless response['result'] == true
      puts "Can'ot unlock account: #{address}, exited."
      puts response.inspect
      exit 1
    end

    puts 'Start create new address'

    started_at = Time.current
    new_address = contract.deploy_and_wait(Figaro.env.eth_exchanger_address)
    time = Time.current - started_at

    puts "Address created: [#{new_address}]"
    puts "time: #{time}"
  end
end
