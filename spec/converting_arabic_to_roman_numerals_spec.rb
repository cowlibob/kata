def convert(arabic)
  result = ''
  numerals = {
    100 => 'C',
    50 => 'L',
    10 => 'X',
    5 => 'V',
    1 => 'I'
  }

  return '' if arabic == 0
  remainder = 0
  numerals.each do |a,r|
    while arabic >= a
      result << r
      arabic -= a
    end
    numerals.each do |aa, rr|
      if arabic > aa && arabic == a - aa
        result << rr << r
        arabic -= (a + (a - aa))
      end
    end
  end
  if arabic > 0
    result << 'I' * arabic
  end

  result
end

describe "Converting arabic numbers to roman numerals" do
  context "Romans didn't have a zero" do
    it "converts 0 to a blank string" do
      expect(convert(0)).to eq('')
    end
  end

  context "Romans had simple additive numbers" do
    it "converts 1 to an I" do
      expect(convert(1)).to eq('I')
    end

    it "converts 2 to an II" do
      expect(convert(2)).to eq('II')
    end

    it "converts 3 to an III" do
      expect(convert(3)).to eq('III')
    end

    it "converts 4 to an IV" do
      expect(convert(4)).to eq('IV')
    end

    it "converts 5 to an V" do
      expect(convert(5)).to eq('V')
    end

    it "converts 6 to an VI" do
      expect(convert(6)).to eq('VI')
    end

    it "converts 7 to an VII" do
      expect(convert(7)).to eq('VII')
    end

    it "converts 8 to an VIII" do
      expect(convert(8)).to eq('VIII')
    end

    it "converts 9 to an IX" do
      expect(convert(9)).to eq('IX')
    end

    it "converts 10 to an X" do
      expect(convert(10)).to eq('X')
    end

    it "converts 11 to an XI" do
      expect(convert(11)).to eq('XI')
    end

    it "converts 15 to an XV" do
      expect(convert(15)).to eq('XV')
    end

    it "converts 19 to an XIX" do
      expect(convert(19)).to eq('XIX')
    end

    it "converts 20 to an XX" do
      expect(convert(20)).to eq('XX')
    end

    it "converts 40 to an XL" do
      expect(convert(40)).to eq('XL')
    end

    it "converts 49 to an IL" do
      expect(convert(49)).to eq('IL')
    end

    it "converts 50 to an L" do
      expect(convert(50)).to eq('L')
    end


    it "converts 99 to an IC" do
      expect(convert(99)).to eq('IC')
    end



  end
end
