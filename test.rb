class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end
  def red;            "\e[31m#{self}\e[0m" end
  def green;          "\e[32m#{self}\e[0m" end
  def yellow;         "\e[33m#{self}\e[0m" end
end


def first_input
  2.times { puts }
  puts "Page ONE".red
  print "First input: ".green
  while
    @word_f = gets.chomp
    if @word_f == '' then
      print " <= Строка не должна быть пустой для первого поля ".red
      print
    else
      break
    end
  end
  return @word_f
end

def last_input
  print "Last input: ".green
  while
    @word_l = gets.chomp
    if @word_l == '' then
      print " <= Строка не должна быть пустой для второго поля ".red
      print
    else
      break
    end
  end
  return @word_l
end


class FormManual
  def self.page_one
    puts; puts "Input in page ONE, and click forward page TWO:/n
    value 1 = #{first_input.green},".yellow + " value 2 = #{last_input.green}".yellow
    page_two
    puts
  end

  def self.addition_condition_string(first_input, last_input)
    one = first_input.split(/[0-9]/).compact.last
    two = last_input.split(/[0-9]/).compact.last

    if (one.class == String  || two.class == String) then
      puts "    Addition condition incorrect - one of variable them is a STRING".red
      puts
    else
      one = first_input.split(/[a-z]/).compact.last.to_i
      two = last_input.split(/[a-z]/).compact.last.to_i

      znaki = %w[* + - / % ** ]
      puts "Addition condition correct - all of variable them is a Integer".green
      print "Select only #{znaki},  Result => ".green
      addition = gets.strip

      puts "Worng symbol".red if !znaki.include?(addition)
      return if !znaki.include?(addition)
      if addition == "*"
        puts "#{one} * #{two} = " + "#{one * two}".yellow
      elsif addition == "/"
        puts one / two
      elsif addition == "+"
        puts one + two
      elsif addition == "-"
        puts one - two
      elsif addition == "%"
        puts one % two
      elsif addition == "**"
        puts one ** two
      end
    end
    # return
  end

  def self.page_two
    puts
    puts "Page TWO ".red
    addition_condition_string(@word_f, @word_l)

    print "Click (1) - to Back first page, any other value - exit ".green

    while
      back = gets.chomp
      if back == "1" then
        print "Move to first page ".red
        page_one

      elsif back != "1" then
        print "Exit".red
        exit 1
      end
    end
  end
end
################################################


class FormAuto
  def self.first_input(data_f)
    puts "Page ONE".red
    print "First input: ".green
    return puts @first_input = data_f
  end

  def self.last_input(data_l)
    print "Last input: ".green
    return puts @last_input = data_l
  end

  def self.page_one
    print "Input in page ONE, and click forward page TWO:
    value 1 = #{@first_input.green},".yellow + " value 2 = #{@last_input.green}".yellow
    page_two
    puts
  end

  def self.addition_condition_string(first_input, last_input)
    one = first_input.split(/[0-9]/).compact.last
    two = last_input.split(/[0-9]/).compact.last

    if (one.class == String  || two.class == String) then
      puts "    Addition condition incorrect - one of variable them is a STRING".red
      puts
    else
      one = first_input.split(/[a-z]/).compact.last.to_i
      two = last_input.split(/[a-z]/).compact.last.to_i

      znaki = %w[* + - / % ** ]
      puts "Addition condition correct - all of variable them is a Integer".green
      print "Select only #{znaki},  Result => ".green

      addition = ENV['addt'].to_s
      puts "Worng symbol".red if !znaki.include?(addition)
      return if !znaki.include?(addition)
      if addition == "*"
        puts "#{one} * #{two} = " + "#{one * two}".yellow
      elsif addition == "/"
        puts one / two
      elsif addition == "+"
        puts one + two
      elsif addition == "-"
        puts one - two
      elsif addition == "%"
        puts one % two
      elsif addition == "**"
        puts one ** two
      end
    end
  end

  def self.page_two
    puts
    puts "Page TWO ".red
    addition_condition_string(@first_input, @last_input)

    print "Back to first page ".red
  end

end
################################################



puts "!!! Вначале будет отправлятся два значения в полях, а затем их сложение с теми значениями, которые вы введете"
puts "    Числа должны быть целыми".red

sleep 5

puts
puts "!!!___1 позитивный сценарий (умножить 4 на 256)"
ENV['addt'] = "*"
addt = "#{ENV['addt']}"
FormAuto.first_input("4")
FormAuto.last_input("256")
FormAuto.page_one #From fast manual check

sleep 10

puts
puts "!!!___2 позитивный сценарий (поделить 32 на 1.6)"
ENV['addt'] = "/"
addt = "#{ENV['addt']}"
FormAuto.first_input("32")
FormAuto.last_input("13")
FormAuto.page_one #From fast manual check

sleep 10

puts
puts "!!!___3 позитивный сценарий (100 минус 32)"
ENV['addt'] = "-"
addt = "#{ENV['addt']}"
FormAuto.first_input("100")
FormAuto.last_input("32")
FormAuto.page_one #From fast manual check

sleep 10

puts
puts "!!!___1 неагтивынй сценарий (\"dsadad\" минус 32)"
ENV['addt'] = "-"
addt = "#{ENV['addt']}"
FormAuto.first_input("dsadad")
FormAuto.last_input("32")
FormAuto.page_one #From fast manual check

puts "Но это еще не все..."
sleep 10


2.times { puts }
puts "Затем, если вы хотите, можете сами в полуавтоматическом режиме внести значения в поля и выбрать, каким методом сложить их. Полученный результат будет выводится сразу же"
puts "Сложение строк запрещено!!".red
FormManual.page_one
