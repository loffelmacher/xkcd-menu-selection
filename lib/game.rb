class Game
  def initialize
    @rolls = Array.new(21, 0)
    @currentRoll = 0
  end

  def roll(pins)
    @rolls[@currentRoll] = pins
    @currentRoll += 1
  end

	def score()
		score = 0 
    frameIndex = 0
    for frame in (0...10)
      if isStrike?(frameIndex)
        score += 10 + strikeBonus(frameIndex)
        frameIndex += 1
      elsif isSpare?(frameIndex)
        score += 10 + spareBonus(frameIndex)
        frameIndex += 2
      else
        score += sumOfBallsInFrame(frameIndex)
        frameIndex += 2
      end
    end
		score
  end

  private

  def isSpare?(frameIndex)
    @rolls[frameIndex] + @rolls[frameIndex+1] == 10
  end

  def isStrike?(frameIndex)
    @rolls[frameIndex] == 10
  end

  def spareBonus(frameIndex)
    @rolls[frameIndex+2]
  end

  def strikeBonus(frameIndex)
    @rolls[frameIndex+1] + @rolls[frameIndex+2]
  end

  def sumOfBallsInFrame(frameIndex) 
    @rolls[frameIndex] + @rolls[frameIndex+1]
  end
end
