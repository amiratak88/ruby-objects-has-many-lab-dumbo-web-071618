require 'pry'
class Author
    attr_accessor :name, :posts
    @@all = []
    
    def initialize(name)
        @name = name
        @posts = []
        @@all << self
    end

    def self.all
        @@all
    end

    def add_post(post)
        post.author = self
        @posts << post
    end

    def add_post_by_title(title)
        n = Post.new(title)
        n.author = self
        @posts << n
    end

    def self.post_count
        self.all.map do |author|
            author.posts
        end.flatten.length
    end

end