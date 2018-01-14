
When /^The creation of an application for withdrawal for WireCapital/ do
  $pool.post do
    Payouts.new.include(:wire, "Credit card : 422345...0026", "4223450000000026") if ENV['stage'] == "s1"
    Payouts.new.include(:wire, "Credit card TR : 422345...0026", "4223450000000026") if ENV['stage'] == "s2"
  end
end

When /^The creation of an application for withdrawal for CreditCard/ do
  $pool.post do
    Payouts.new.include(:bank_card, "Credit card : 555555...4444", "5555555555554444") if ENV['stage'] == "s1"
    Payouts.new.include(:bank_card, "Credit card TR : 555555...4444", "5555555555554444") if ENV['stage'] == "s2"
  end
end

When /^The creation of an application for withdrawal for CardPay/ do
  $pool.post do
    Payouts.new.include(:card_pay, "Credit card : 400000...0002", "4000000000000002") if ENV['stage'] == "s1"
    Payouts.new.include(:card_pay, "Credit card TR : 400000...0002", "4000000000000002") if ENV['stage'] == "s2"
  end
end
