require 'csv'

namespace :import_csv_data do
  task :create_csv => :environment do
    csvs=
      [[Customer, 'customers'],
        [Merchant,'merchants'],
        [Item, 'items'],
        [Invoice, 'invoices'],
        [Transaction, 'transactions'],
        [InvoiceItem, 'invoice_items']
      ]

    csvs.each do |model, csv|
      file = "lib/assets/#{csv}.csv"
      CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
        model.find_or_create_by(row.to_hash)
      end
      puts "#{model} data imported"
    end
  end
end
