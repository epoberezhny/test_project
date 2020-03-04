module Pages
  module Tickets
    class IndexPage < SitePrism::Page
      extend SitePrism::Table

      set_url '/tickets{?page,items}'

      table :tickets, '#tickets' do
        column :id
        column :request_number
        column :sequence_number
        column :request_type
        column :response_due_date_time
        column :created_at
        column :actions
      end
    end
  end
end
