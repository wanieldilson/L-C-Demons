# ({} → nil) no code at all → code that employs nil
# (nil → constant)
# (constant → constant+) a simple constant to a more complex constant
# (constant → scalar) replacing a constant with a variable or an argument
# (statement → statements) adding more unconditional statements.
# (unconditional → if) splitting the execution path
# (scalar → array)
# (array → container)
# (statement → tail-recursion)
# (if → while)
# (statement → non-tail-recursion)
# (expression → function) replacing an expression with a function or algorithm
# (variable → assignment) replacing the value of a variable.
# (case) adding a case (or else) to an existing switch or if


describe "NumberToLCD" do
    it "gives a LCD 1 when given 1" do
        subject = NumberToLCD.new
        result = "\n|\n|"
        expect(subject.execute(1)).to eq result
    end

    it "gives a LCD 2 when given 2" do
        subject = NumberToLCD.new
        result = " _ \n _|\n|_ "
#  _
#  _|
# |_
        expect(subject.execute(2)).to eq result
    end

    it "gives a LCD 3 when given 3" do
      subject = NumberToLCD.new
      result = " _ \n _|\n _|"
#  _
#  _|
#  _|
      expect(subject.execute(3)).to eq result
  end

  it "gives a LCD 4 when given 4" do
    subject = NumberToLCD.new
    result = "   \n|_|\n  |"
#   
# |_|
#   |
    expect(subject.execute(4)).to eq result
    end

    it "gives a LCD 0 when given 0" do
      subject = NumberToLCD.new
      result = " _ \n| |\n|_|"
  #  _
  # | |
  # |_|
      expect(subject.execute(0)).to eq result
      end
    
      it "gives a LCD 22 when given 22" do
        subject = NumberToLCD.new
        result = " _  _ \n _| _|\n|_ |_ " 
#  _  _ 
#  _| _|
# |_ |_ 
        expect(subject.execute(22)).to eq result
    end

    it "gives a LCD 33 when given 33" do
      subject = NumberToLCD.new
      result = " _  _ \n _| _|\n _| _|"
#  _  _ 
#  _| _|
#  _| _|
      expect(subject.execute(33)).to eq result
    end

    it "gives a LCD 44 when given 44" do
        subject = NumberToLCD.new
        result = "      \n|_||_|\n  |  |"
#       
# |_||_|
#   |  |
        expect(subject.execute(44)).to eq result
    end

    it "gives a LCD 444 when given 444" do
        subject = NumberToLCD.new
        result = "      \n|_||_||_|\n  |  |  |"
#       
# |_||_||_|
#   |  |  |
        expect(subject.execute(444)).to eq result
    end
end

class NumberToLCD
  def execute(number)

    lcd_numbers = [
        [" _ ","| |","|_|"],
        ["", "|", "|"],
        [" _ "," _|","|_ "],
        [" _ "," _|"," _|"],
        ["   ","|_|","  |"]
    ]

    digits = number.digits.reverse

    if digits.length > 1 then
        return lcd_numbers[digits[0]][0] + lcd_numbers[digits[1]][0] + "\n"  \
             + lcd_numbers[digits[0]][1] + lcd_numbers[digits[1]][1] + "\n"  \
             + lcd_numbers[digits[0]][2] + lcd_numbers[digits[1]][2] 
    end

    lcd_numbers[number].join("\n")
  end
end
