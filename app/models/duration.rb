class Duration < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1時間未満' },
    { id: 3, name: '1時間~3時間' },
    { id: 4, name: '4時間~1日' },
    { id: 5, name: '2日以上' }
  ]

  include ActiveHash::Associations
  has_many :services
end
