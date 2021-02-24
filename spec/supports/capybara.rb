RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :selenium_chrome_headless
  end
end
#System spec利用時のブラウザ立ち上げ防止用記述
#System Specの実行時には「Headless Chrome」を利用
