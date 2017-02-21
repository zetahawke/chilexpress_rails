# This class will retreive some information according to param
module ChilexpressRails
  require 'chilexpress_rails/order'
  require 'nokogiri'
  require 'open-uri'

  def self.search_order(tracking_number)
    puts 'hi...'
    url = "http://www.chilexpress.cl/Views/ChilexpressCL/Resultado-busqueda.aspx?DATA=#{tracking_number}"
    doc = Nokogiri::HTML(open(url))
    return 'No se obtuvo respuesta' unless doc
    attributes = shipping_info(doc).merge!(receiver_info(doc))
    Order.new(attributes)
  end

  def self.shipping_info(html_doc)
    puts html_doc.at_css('title').text
    widget_content = html_doc.css('.wigdet-content')
    li = widget_content[0].css('li')
    return 'El sitio web parece haber modificado su estructura' unless li
    {
      track_number: li[1].text.to_s.split(':')[1].strip,
      product: li[2].text.to_s.split(':')[1].strip,
      service: li[3].text.to_s.split(':')[1].strip,
      status: li[4].text.to_s.split(':')[1].strip
    }
  end

  def self.receiver_info(html_doc)
    widget_content = html_doc.css('.wigdet-content')
    li = widget_content[1].css('li')
    return 'El sitio web parece haber modificado su estructura' unless li
    date = li[2].text.to_s.split(':')[1].strip
    hour = " #{li[3].text.to_s.split(':')[1].strip}:#{li[3].text.to_s.split(':')[2].strip}"
    {
      receiver: li[1].text.to_s.split(':')[1].strip,
      datetime: date + hour,
      receiver_name: li[4].text.to_s.split(':')[1].split(' ').first(2).join(' ')
    }
  end
end
