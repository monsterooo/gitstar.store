class RepoMetum < ApplicationRecord
  belongs_to :user

  def self.findByRepo(user_id, repo_id)
    where(user_id: user_id, repo_id: repo_id).first
  end
end
