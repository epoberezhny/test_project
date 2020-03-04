module Pages
  module Tickets
    class ShowPage < SitePrism::Page
      set_url '/tickets/{id}'

      elements :fields, '.col-9'
    end
  end
end
