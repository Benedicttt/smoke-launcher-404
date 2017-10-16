
When /^The creation of an application for withdrawal for WireCapital/ do
  $pool.post do
    Payouts.new.include(:wire, "422345...0026", "4223450000000026")
  end
end

When /^The creation of an application for withdrawal for CreditCard/ do
  $pool.post do
    Payouts.new.include(:bank_card, "555555...4444", "5555555555554444")
  end
end

When /^The creation of an application for withdrawal for CardPay/ do
  $pool.post do
    Payouts.new.include(:pay, "400000...0002", "4000000000000002")
  end
end
