# typed: true

class Project < ApplicationRecord
  extend T::Sig

  validates :giturl, presence: true

  sig { returns(String) }
  def picture_url
    return T.must(more) if more.present?
    return T.must(weburl) if weburl.present?

    T.must(giturl)
  end

  sig { returns(T::Boolean) }
  def weburl?
    !weburl.empty?
  end

  sig { returns(T::Boolean) }
  def giturl?
    !giturl.empty?
  end
end
