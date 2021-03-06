# This class will retreive some information according to param
module ChilexpressRails
  require 'chilexpress_rails/order'
  require 'nokogiri'
  require 'open-uri'

  def self.search_order(tracking_number)
    url = "http://www.chilexpress.cl/Views/ChilexpressCL/Resultado-busqueda.aspx?DATA=#{tracking_number}"
    doc = Nokogiri::HTML(open(url))
    return "The order doesn't exist" if doc.css('.section-title')[0].text.include?('No hemos encontrado')
    attributes = shipping_info(doc).merge!(receiver_info(doc))
    Order.new(attributes)
  end

  def self.shipping_info(html_doc)
    widget_content = html_doc.css('.wigdet-content')
    li = widget_content[0].css('li')
    return "Website's structure has change" unless li
    {
      track_number: li[1].text.to_s.split(':')[1].strip.gsub(/\A\p{Space}*/, ''),
      product: li[2].text.to_s.split(':')[1].strip.gsub(/\A\p{Space}*/, ''),
      service: li[3].text.to_s.split(':')[1].strip.gsub(/\A\p{Space}*/, ''),
      status: li[4].text.to_s.split(':')[1].strip.gsub(/\A\p{Space}*/, '')
    }
  rescue
    "Website's structure has change"
  end

  def self.receiver_info(html_doc)
    widget_content = html_doc.css('.wigdet-content')
    li = widget_content[1].css('li')
    return "Website's structure has change" unless li
    date = li[2].text.to_s.split(':')[1].strip.gsub(/\A\p{Space}*/, '')
    hour = " #{li[3].text.to_s.split(':')[1].strip.gsub(/\A\p{Space}*/, '')}:#{li[3].text.to_s.split(':')[2].strip.gsub(/\A\p{Space}*/, '')}"
    {
      receiver: li[1].text.to_s.split(':')[1].strip.gsub(/\A\p{Space}*/, ''),
      datetime: date + hour,
      receiver_name: li[4].text.to_s.split(':')[1].split(' ').first(2).join(' ').gsub(/\A\p{Space}*/, '')
    }
  rescue
    "Website's structure has change"
  end
end
