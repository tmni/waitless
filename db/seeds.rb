require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'items.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Item.new
  t.item_name = row['item_name']
  t.barcode_id = row['barcode_id']
  t.price = row['price']

  t.save
  puts "#{t.item_name} saved"
end

puts "There are now #{Item.count} rows in the transactions table"