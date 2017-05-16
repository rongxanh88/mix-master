module ArtistsHelper

  def create_artist_error?(artist)
    message = ""
    if artist.errors.any?
      pluralize(artist.errors.count, "error")
      message += "Prohibited this record from being saved: "

      artist.errors.full_messages.each do |err_message|
        message += "#{err_message} "
      end
    end
    message
  end
end
