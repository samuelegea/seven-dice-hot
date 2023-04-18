require 'json'

def create_languages
  languages = JSON.parse(File.read('db/sources/5e-SRD-Languages.json'))
  languages.each do |language|
    next if Language.find_by(name: language['name'])
    p "Creating language -> #{language['name']}"

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
    p "Creating weapon property -> #{weapon_property['name']}"

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

    p "Creating Item -> #{item['name']}"
    i = Item.create(
      name: item['name'],
      desc: item['desc']&.join('. ') || '',
      cost_cp: item.dig('cost', 'quantity') * (item.dig('cost', 'unit') == 'cp' ? 1 : item.dig('cost', 'unit') == 'sp' ? 10 : 100),
      damage: item.dig('damage', 'damage_dice')&.downcase,
      range_normal: item.dig('range', 'normal'),
      damage_type: item.dig('damage', 'damage_type', 'name')&.downcase,
      range_long: item.dig('range', 'long'),
      weight: item['weight'],
      throw_range_normal: item.dig('thow_range', 'normal'),
      throw_range_long: item.dig('thow_range', 'long'),
      two_handed_damage: item.dig('two_handed_damage', 'damage_dice'),
      two_handed_damage_type: item.dig('two_handed_damage', 'damage_type', 'name')&.downcase,
      custom: { "special": item['special'] },
      armor_class: item.dig('armor_class', 'base'),
      ac_dex_bonus: item.dig('armor_class', 'dex_bonus'),
      max_bonus: item.dig('armor_class', 'max_dex_bonus'),
      str_minimum: item['str_minimum'],
      stealth_disadvantage: item['stealth_disadvantage'],
      speed: item.dig('speed', 'quantity'),
      speed_unit: item.dig('speed', 'unit'),
      capacity: item['capacity'].nil? ? nil : item['capacity'].split(' ')[0].to_i
    )

    i.weapon_properties << item['properties'].map { |property| WeaponProperty.find_by_name(property['name']) } unless item['properties'].nil?

    i.equipment_categories << EquipmentCategory.find_by_name!(item.dig('equipment_category', 'name')) unless item.dig('equipment_category', 'name').nil?
    i.equipment_categories << EquipmentCategory.find_by_name!(item['armor_category'])             unless item['armor_category'].nil?
    i.equipment_categories << EquipmentCategory.find_by_name!(item['weapon_category'])            unless item['weapon_category'].nil?
    i.equipment_categories << EquipmentCategory.find_by_name!(item['weapon_range'])               unless item['weapon_range'].nil?
    i.equipment_categories << EquipmentCategory.find_by_name!(item['tool_category'])              unless item['tool_category'].nil?
    i.equipment_categories << EquipmentCategory.find_by_name!(item['vehicle_category'])           unless item['vehicle_category'].nil?
    i.equipment_categories << EquipmentCategory.find_by_name!(item.dig('gear_category', 'name'))      unless item.dig('gear_category', 'name').nil?

  end
end

def create_magic_items
  magic_items = JSON.parse(File.read('db/sources/5e-SRD-Magic-Items.json'))

  magic_items.each do |magic_item|
    next if MagicItem.find_by_name(magic_item['name']).present?
    p "Creating Magic Item ->  #{magic_item['name']}"

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
    p "Creating Skill -> #{skill['name']}"

    Skill.create(
      name: skill['name'],
      desc: skill['desc']&.join('. ') || '',
      ability_score: skill.dig('ability_score', 'name')
    )
  end
end

def create_equipment_categories
  equipment_categories = JSON.parse(File.read('db/sources/5e-SRD-Equipment-Category.json'))

  equipment_categories.each do |equipment_category|
    next if EquipmentCategory.find_by_name(equipment_category['name']).present?

    p "Creating Equipment Category -> #{equipment_category['name']}"
    EquipmentCategory.create(name: equipment_category['name'])
  end
end

def create_proficiencies
  proficiencies = JSON.parse(File.read('db/sources/5e-SRD-Proficiencies.json'))

  proficiencies.each do |proficiency|
    next if Proficiency.find_by_name(proficiency['name']).present?

    p "Creating Proficiency -> #{proficiency['name']}"
    Proficiency.create(
      name: proficiency['name'],
      skill: Skill.find_by_name(proficiency.dig('reference', 'name')),
      equipment_category: EquipmentCategory.find_by_name(proficiency.dig('reference', 'name')),
      item: Item.find_by_name(proficiency.dig('reference', 'name')),
      ability_score: proficiency.dig('reference', 'name'),
    )
  end
end

def create_traits
  traits = JSON.parse(File.read('db/sources/5e-SRD-Traits.json'))

  traits.each do |trait|
    next if Trait.find_by_name(trait['name']).present?

    p "Creating Trait -> #{trait['name']}"
    t = Trait.create(
      name: trait['name'],
      desc: trait['desc']&.join('. ') || '',
      properties: trait['properties'] || {}
    )

    trait['proficiencies'].each do |proficiency|
      t.proficiencies << Proficiency.find_by_name(proficiency['name'])
    end
  end
end

def create_races
  races = JSON.parse(File.read('db/sources/5e-SRD-Races.json'))

  races.each do |race|
    next if Race.find_by_name(race['name'])

    p "Creating race -> #{race['name']}"

    r = Race.create(
      name: race['name'],
      desc: [race['desc'], race['alignment'], race['age'], race['size_description'], race['language_desc']].flatten&.join('. ') || '',
      speed: race['speed'],
      size: race['size'].downcase,
    )

    race['starting_proficiencies'].each do |proficiency|
      r.proficiency_sources.create! proficiency: Proficiency.find_by_name(proficiency['name'])
    end

    race['languages'].each do |language|
      r.languages.append(Language.find_by_name(language['name']))
    end

    race['ability_bonuses'].each do |ability_bonus|
      r.ability_score_increases.create(
        ability: ability_bonus.dig('ability_score', 'name'),
        bonus: ability_bonus['bonus']
      )
    end

    race['traits'].each do |trait|
      r.traits.append(Trait.find_by_name(trait['name']))
    end
  end
end

def create_subraces
  sub_races = JSON.parse(File.read('db/sources/5e-SRD-Subraces.json'))

  sub_races.each do |sub_race|
    next if Race.find_by_name(sub_race['name'])

    p "creating sub-race -> #{sub_race['name']}"

    parent_race = Race.find_by_name(sub_race.dig('race', 'name'))
    r = Race.create(
      name: sub_race['name'],
      desc: sub_race['desc'] || '',
      speed: parent_race.speed,
      size: parent_race.size,
    )

    sub_race.dig('starting_proficiencies').each do |proficiency|
      r.proficiency_sources.create! proficiency: Proficiency.find_by_name(proficiency['name'])
    end

    sub_race.dig('languages')&.each do |language|
      r.languages.append(Language.find_by_name(language['name']))
    end

    sub_race.dig('ability_bonuses')&.each do |ability_bonus|
      r.ability_score_increases.create(
        ability: ability_bonus.dig('ability_score', 'name'),
        bonus: ability_bonus['bonus']
      )
    end

    sub_race.dig('traits')&.each do |trait|
      r.traits.append(Trait.find_by_name(trait['name']))
    end
  end
end

def create_spells
  spells = JSON.parse(File.read('db/sources/5e-SRD-Spells.json'))

  spells.each do |spell|
    next if Spell.find_by_name(spell['name']).present?

    p "Creating spell -> #{spell['name']}"

    Spell.create(
      name: spell['name'],
      desc: spell['desc']&.join('. ') || '',
      school: spell.dig('school', 'name').downcase,
      components: spell['components'],
      ritual: spell['ritual'],
      concentration: spell['concentration'],
      material: spell['material'] || '',
      duration_number: get_duration(spell['duration'])[0] || 0,
      duration_unit: get_duration(spell['duration'])[1],
      duration_delimiter: get_duration(spell['duration'])[2],
      casting_time_unit: spell['casting_time']&.split(' ')[1..-1]&.join('_')&.downcase.singularize,
      casting_time_number: spell['casting_time'].split(' ').first.to_i,
      level: spell['level'],
      attack_type_melee: spell['attack_type'] == 'melee',
      saving_throw: spell.dig('dc', 'dc_type', 'name').nil? ? nil : Spell.st_to_i(spell.dig('dc', 'dc_type', 'name')),
      dc_success: spell.dig('dc', 'dc_success'),
      dc_desc: spell.dig('dc', 'desc') || '',
      aoe_type: spell.dig('area_of_effect', 'type')&.downcase,
      aoe_size: spell.dig('area_of_effect', 'size'),
    )
  end
end

def get_duration(duration)
  delimiter = case duration.downcase
  when /up to/
    'up_to'
  when /special/
    'special'
  when /instantaneous/
    'instantaneous'
  when /until dispelled/
    'until_dispelled'
  else
    'exact'
  end

  duration = duration.downcase.gsub(/up to|special|instantaneous|until dispelled/, '').strip
  duration = duration.split(' ')

  return [0, 0, delimiter] if duration.empty?

  unit = duration.last.singularize
  number = duration.first.to_i

  [number, unit, delimiter]
end

# --------------------------------------------

create_equipment_categories
create_weapon_properties
create_languages
create_items
create_magic_items
create_skills
create_proficiencies
create_traits
create_races
create_subraces
create_spells

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development? && AdminUser.find_by(email: 'admin@example.com').nil?


