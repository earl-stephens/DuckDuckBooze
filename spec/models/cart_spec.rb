require 'rails_helper'

RSpec.describe 'Cart' do
  it 'can calculate the total number of items it holds' do
    cart = Cart.new({
      "Corona" => 1,
      "Bud Light => 2,
      })
  end

  

end
