class Todo < ApplicationRecord
  belongs_to :user, optional: true

  CONVERT_TO_STATUS_TYPE = {
    do: "実行前",
    doing: "実行中",
    done: "終了",
  }

  validates :title, presence: true
  validates :status_type, presence: true

  enum status_type: {
    do: 10,
    doing: 20,
    done: 30,
  }, _prefix: true

  define_method :status_type_name do
    CONVERT_TO_STATUS_TYPE[status_type.to_sym].to_s
  end

  def title_with_status
    "#{title} (#{CONVERT_TO_STATUS_TYPE[status_type.to_sym]})"
  end
end
