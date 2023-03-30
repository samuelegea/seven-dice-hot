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

def create_weapon_properties
  weapon_properties = JSON.parse(File.read('db/sources/5e-SRD-Weapon-Properties.json'))

  weapon_properties.each do |weapon_property|
    next if WeaponProperty.all.find_by(name: weapon_property['name'])
    p "Creating #{weapon_property['name']}"

    WeaponProperty.create(
      name: weapon_property['name'],
      desc: weapon_property['desc']&.join('. ') || '',
      properties: weapon_property['properties'] || {}
    )
  end
end


def create_items
  items = JSON.parse(File.read('db/sources/5e-SRD-Equipment.json'))
  items.each do |item|
    next if Item.all.find_by(name: item['name'])

    p "Creating #{item['name']}"
    i = Item.create(
      name: item['name'],
      desc: item['desc']&.join('. ') || '',
      cost_cp: item.dig('cost', 'quantity') * (item.dig('cost', 'unit') == 'cp' ? 1 : item.dig('cost', 'unit') == 'sp' ? 10 : 100),
      damage: item.dig('damage', 'damage_dice')&.downcase,
      range_normal: item.dig('range', 'normal'),
      damage_type: item.dig('damage', 'damage_type', 'name')&.downcase,
      range_long: item.dig('range', 'long'),
      weight: item.dig('weight'),
      throw_range_normal: item.dig('thow_range', 'normal'),
      throw_range_long: item.dig('thow_range', 'long'),
      two_handed_damage: item.dig('two_handed_damage', 'damage_dice'),
      two_handed_damage_type: item.dig('two_handed_damage', 'damage_type', 'name')&.downcase,
      custom: { "special": item.dig('special') },
      armor_class: item.dig('armor_class', 'base'),
      ac_dex_bonus: item.dig('armor_class', 'dex_bonus'),
      max_bonus: item.dig('armor_class', 'max_dex_bonus'),
      str_minimum: item.dig('str_minimum'),
      stealth_disadvantage: item.dig('stealth_disadvantage'),
      speed: item.dig('speed', 'quantity'),
      speed_unit: item.dig('speed', 'unit'),
      capacity: item.dig('capacity').nil? ? nil : item.dig('capacity').split(' ')[0].to_i
    )

    i.weapon_properties << item.dig('properties').map { |property| WeaponProperty.find_by_name(property['name']) } unless item.dig('properties').nil?

    i.equipment_categories << EquipmentCategory.find_by_name!(item.dig('equipment_category', 'name')) unless item.dig('equipment_category', 'name').nil?
    i.equipment_categories << EquipmentCategory.find_by_name!(item.dig('armor_category'))             unless item.dig('armor_category').nil?
    i.equipment_categories << EquipmentCategory.find_by_name!(item.dig('weapon_category'))            unless item.dig('weapon_category').nil?
    i.equipment_categories << EquipmentCategory.find_by_name!(item.dig('weapon_range'))               unless item.dig('weapon_range').nil?
    i.equipment_categories << EquipmentCategory.find_by_name!(item.dig('tool_category'))              unless item.dig('tool_category').nil?
    i.equipment_categories << EquipmentCategory.find_by_name!(item.dig('vehicle_category'))           unless item.dig('vehicle_category').nil?
    i.equipment_categories << EquipmentCategory.find_by_name!(item.dig('gear_category', 'name'))      unless item.dig('gear_category', 'name').nil?

  end
end

def create_magic_items
  magic_items = JSON.parse(File.read('db/sources/5e-SRD-Magic-Items.json'))

  magic_items.each do |magic_item|
    next if MagicItem.find_by_name(magic_item['name']).present?
    p "Creating #{magic_item['name']}"

    mi = MagicItem.create(
      name: magic_item['name'],
      desc: magic_item['desc']&.join('. ') || '',
      rarity: magic_item.dig('rarity', 'name')&.downcase,
      variant: magic_item['variant'],
      properties: magic_item['properties'] || {}
    )
    mi.equipment_categories << EquipmentCategory.find_by_name(magic_item.dig('equipment_category', 'name'))
  end
end

def create_skills
  skills = JSON.parse(File.read('db/sources/5e-SRD-Skills.json'))

  skills.each do |skill|
    next if Skill.find_by_name(skill['name']).present?
    p "Creating #{skill['name']}"

    Skill.create(
      name: skill['name'],
      desc: skill['desc']&.join('. ') || '',
      ability_score: Skill.absc_to_i(skill.dig('ability_score', 'name'))
    )
  end
end

def create_equipment_categories
  equipment_categories = JSON.parse(File.read('db/sources/5e-SRD-Equipment-Category.json'))

  equipment_categories.each do |equipment_category|
    next if EquipmentCategory.find_by_name(equipment_category['name']).present?

    p "Creating #{equipment_category['name']}"
    EquipmentCategory.create(name: equipment_category['name'])
  end
end


create_equipment_categories
create_weapon_properties
create_languages
create_items
create_magic_items
create_skills

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development? && AdminUser.find_by(email: 'admin@example.com').nil?


