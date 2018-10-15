class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :likes
  has_many :likes_recipes, through: :likes, source: :recipes
  
  def like(recipe)
    self.likes.find_or_create_by(recipe_id: recipe.id)
  end
  
  def unlike(recipe)
    like = self.likes.find_by(recipe_id: recipe.id)
    like.destroy if like
  end
  
  def like?(recipe)
    self.likes_recipes.include?(recipe)
  end
end