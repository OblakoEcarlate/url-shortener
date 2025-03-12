require "open_uri"
class Metadata
  attr_reader :doc
  def self.retrieve_from(url)
    new(URI.open(url))
  rescue StandardError
    new
  end

  def initialize(html)
    @doc = Nokogiri::HTML(html)
  end

  def attributes
    {
      title: title,
      description: description,
      image: image
    }
  end

  def title
    meta_tag_content "title"
  end

  def description
    meta_tag_content "description"
  end

  def image
    meta_tag_content "og:image", name_attribute: :property
  end

  def meta_tag_content(name, name_attribute: :name)
    doc.at_css("meta[property='#{name}']")&.attributes&.fetch("content", nil)&.text
  end
end