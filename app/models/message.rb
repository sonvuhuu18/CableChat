class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
  validates :body,
    presence: true,
    length: {minimum: 2, maximum: 1000}
  after_create_commit :perform_broadcast_job

  private

  def perform_broadcast_job
    MessageBroadcastJob.perform_later self
  end
end
