# encoding: utf-8

class PhonesInitDataParser

  PROPERTY_SEPARATOR = ':::::'

  def initialize
    @vendors = Vendor.all
    @case_types = CaseType.all
    @phone_types = PhoneType.all
    @platforms = Platform.all
    @screen_types = ScreenType.all
    @touch_screen_types = TouchScreenType.all

    @property_handlers = {}

    @property_handlers['Vendor'] = Proc.new do |property_value|
      {'vendor' => find_value(@vendors, property_value, :name)}
    end

    @property_handlers['Вес'] = Proc.new do |property_value|
      {'weight' => /(\d+)\s/.match(property_value)[1]}
    end

    @property_handlers['Тип корпуса'] = Proc.new do |property_value|
      {'case_type' => find_value(@case_types, property_value, :name)}
    end

    @property_handlers['Тип'] = Proc.new do |property_value|
      {'phone_type' => find_value(@phone_types, property_value, :name)}
    end

    platform_handler = Proc.new do |property_value|
      {'platform' => find_value(@platforms, property_value, :name)}
    end
    @property_handlers['Операционная система'] = platform_handler
    @property_handlers['Платформа'] = platform_handler

    @property_handlers['Диагональ'] = Proc.new do |property_value|
      size = /(\d*[.]*\d*)\s/.match(property_value)
      {'screen_size' => size.nil? ? nil : size[1]}
    end

    @property_handlers['Тип экрана'] = Proc.new do |property_value|
      {'screen_type' => find_value(@screen_types, property_value, :name),
       'contain_touch_screen' => property_value.include?('сенсорный')}
    end

    @property_handlers['Тип сенсорного экрана'] = Proc.new do |property_value|
      {'touch_screen_type' => find_value(@touch_screen_types, property_value, :name)}
    end

    @property_handlers['Стандарт'] = Proc.new do |property_value|
      {'contain_3g' => property_value.include?('3G')}
    end

    @property_handlers['Интерфейсы'] = Proc.new do |property_value|
      {'contain_wifi' => property_value.include?('Wi-Fi'),
       'contain_bluetooth' => property_value.include?('Bluetooth')}
    end

    @property_handlers['Спутниковая навигация'] = Proc.new do |property_value|
      {'contain_gps' => property_value.include?('GPS')}
    end

    @property_handlers['Поддержка  карт памяти'] = Proc.new do
      {'contain_memory_card' => true}
    end

    @property_handlers['Аудио'] = Proc.new do |property_value|
      {'contain_mp3_player' => property_value.include?('MP3'),
       'contain_radio' => property_value.include?('FM-радиоприемник')}
    end

    @property_handlers['Поддержка двух SIM-карт'] = Proc.new do |property_value|
      {'contain_double_sim_support' => property_value.include?('есть')}
    end

    @property_handlers['Фотокамера'] = Proc.new do
      {'contain_camera' => true}
    end
  end

  def parse_and_seed
    Dir['lib/phone_data/phones/*.txt'].each do |filename|
      phone = {}
      first_line = true
      File.open(filename, 'r:utf-8').each_line do |property|
        # first line is model name entirely
        if first_line
          phone['name'] = property.strip
          first_line = false
          next
        end

        p = property.split(PROPERTY_SEPARATOR)
        property_name = p[0]
        property_value = p[1]
        property_value.strip! unless property_value.nil?

        if @property_handlers.member? property_name
          parsed_properties = @property_handlers[property_name].call(property_value)
          parsed_properties.each do |k, v|
            phone[k] = v unless v.nil?
          end
        end
      end

      base_image_name = File.basename(filename, '.txt') + '.jpg'
      # image
      image_filename = 'img/' + base_image_name
      if File.file?('public/' + image_filename)
        phone['image'] = image_filename
      end

      # big image
      big_image_filename = 'img/big/' + base_image_name
      if File.file?('public/' + big_image_filename)
        phone['big_image'] = big_image_filename
      end

      # puts File.basename(filename, '.txt')
      # puts hash_as_string(phone_properties)
      # puts phone['type'].name unless phone['type'].nil?
      Phone.create(phone)
    end
  end

  private

  def find_value possible_values, parsed_value, field
    value = nil
    founded_values = []
    possible_values.each do |possible_value|
      if parsed_value.index(possible_value[field])
        founded_values << possible_value
      end
    end
    if founded_values.size > 1
      value = founded_values.max_by {|v| v[field].size}
    elsif founded_values.size == 1
      value = founded_values[0]
    end
    value
  end

end