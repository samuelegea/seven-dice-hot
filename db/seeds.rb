require 'json'

def create_languages
  languages = JSON.parse(File.read('db/sources/5e-SRD-Languages.json'))
  languages.each do |language|
    next if Language.find_by(name: language['name'])

    Language.create(
      name: language['name'],
      rarity: language['type'].downcase,
      script: language['script']&.downcase || 0,
    )
  end
end

def create_items
  items = JSON.parse(File.read('db/sources/5e-SRD-Equipment.json'))
  items.each do |item|
    next if Item.all.find_by(name: item['name'])

    p "Creating #{item['name']}"
    Item.create(
      name: item['name'],
      desc: item['desc']&.join('. ') || '',
      category: item.dig('equipment_category', 'name')&.downcase,
      weapon_category: item.dig('weapon_category')&.downcase,
      weapon_range: item.dig('weapon_range')&.downcase,
      cost_cp: item.dig('cost', 'quantity') * (item.dig('cost', 'unit') == 'cp' ? 1 : item.dig('cost', 'unit') == 'sp' ? 10 : 100),
      damage: item.dig('damage', 'damage_dice')&.downcase,
      range_normal: item.dig('range', 'normal'),
      damage_type: item.dig('damage', 'damage_type', 'name')&.downcase,
      range_long: item.dig('range', 'long'),
      weight: item.dig('weight'),
      # properties: item.dig('properties').map { |property| property['name'] },
      throw_range_normal: item.dig('thow_range', 'normal'),
      throw_range_long: item.dig('thow_range', 'long'),
      two_handed_damage: item.dig('two_handed_damage', 'damage_dice'),
      two_handed_damage_type: item.dig('two_handed_damage', 'damage_type', 'name')&.downcase,
      custom: { "special": item.dig('special') },
      armor_category: item.dig('armor_category')&.downcase,
      armor_class: item.dig('armor_class', 'base'),
      ac_dex_bonus: item.dig('armor_class', 'dex_bonus'),
      max_bonus: item.dig('armor_class', 'max_dex_bonus'),
      str_minimum: item.dig('str_minimum'),
      stealth_disadvantage: item.dig('stealth_disadvantage'),
      gear_category: item.dig('gear_category', 'name')&.downcase,
      tool_category: item.dig('tool_category')&.downcase,
      vehicle_category: item.dig('vehicle_category')&.downcase,
      speed: item.dig('speed', 'quantity'),
      speed_unit: item.dig('speed', 'unit'),
      capacity: item.dig('capacity').nil? ? nil : item.dig('capacity').split(' ')[0].to_i
    )
  end
end

def create_magic_items
  magic_items = JSON.parse(File.read('db/sources/5e-SRD-Magic-Items.json'))

  magic_items.each do |magic_item|
    next if MagicItem.find_by_name(magic_item['name']).present?
    p "Creating #{magic_item['name']}"

    MagicItem.create(
      name: magic_item['name'],
      desc: magic_item['desc']&.join('. ') || '',
      rarity: magic_item.dig('rarity', 'name')&.downcase,
      category: magic_item.dig('equipment_category', 'name')&.downcase,
      variant: magic_item['variant'],
      properties: magic_item['properties'] || {}
    )
  end
end

# create_items
# create_languages
create_magic_items

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development? && AdminUser.find_by(email: 'admin@example.com').nil?


