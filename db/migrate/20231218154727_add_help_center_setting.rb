# frozen_string_literal: true

class AddHelpCenterSetting < ActiveRecord::Migration[7.1]
  def up
    Setting.create!(name: 'HelpCenter') unless Setting.exists?(name: 'HelpCenter')

    return if SiteSetting.exists?(setting: Setting.find_by(name: 'HelpCenter'))

    SiteSetting.create!(
      setting: Setting.find_by(name: 'HelpCenter'),
      value: '',
      provider: 'greenlight'
    )
  end

  def down
    Setting.find_by(name: 'HelpCenter')&.destroy
    SiteSetting.find_by(setting: Setting.find_by(name: 'HelpCenter')).destroy
  end
end
