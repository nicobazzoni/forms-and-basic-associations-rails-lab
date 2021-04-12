
  class Song < ActiveRecord::Base
    belongs_to :artist
    belongs_to :genre
    
  
     def artist_name
       self.artist ? self.artist.name : nil
     end
    
    
      def artist_name=(name)
        self.artist = Artist.find_or_create_by(name: name)
      end
   
      def genre_name=(name)
        self.genre = Genre.find_or_create_by(name: name)
      end
    
      def genre_name
        self.genre ? self.genre.name : nil
      end
      
      def note_contents
        self.notes.collect(&:content)
      end
    
      def note_contents=(note_contents)
        note_contents.each do |content|
          unless content.empty?
            self.notes << Note.create(content: content)
            self.save
          end
        end
      end
  
    
        has_many :notes
  # add associations here
end
 