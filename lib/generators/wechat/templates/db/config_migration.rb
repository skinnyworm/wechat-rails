class CreateWechatConfigs < ActiveRecord::Migration
  def change
    create_table :wechat_configs do |t|
      # account name
      t.string :account, null: false
      # app token
      t.string :token, null: false

      # public account
      t.string :appid
      t.string :secret

      # corp account
      t.string :corpid
      t.string :corpsecret
      t.string :agentid

      # when encrypt_mode is true, encoding_aes_key must be specified
      t.string :encrypt_mode
      t.string :encoding_aes_key

      # path to access token storage file
      t.string :access_token, null: false
      # path to jsapi ticket storage file
      t.string :jsapi_ticket, null: false
      # set to false if RestClient::SSLCertificateNotVerified is thrown
      t.string :skip_verify_ssl
      t.integer :timeout, default: 30
      t.string :trusted_domain_fullname

      t.timestamps null: false
    end

    add_index :wechat_configs, [:account], unique: true, length: {account: 100}
  end
end