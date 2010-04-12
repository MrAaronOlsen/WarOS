require File.dirname(__FILE__) + "/../spec_helper"

describe Ship do
  before(:each) do
    @window = WarOS.new
    @ship   = Ship.new @window
  end

  it 'should instantiate a ship object with a image loaded' do
    @ship.instance_variable_get("@image").class.should eql(Gosu::Image)
  end

  context 'when moving to the right' do
    it 'should subtract the shipvelocity to the x position of the ship' do
      before_move_x = @ship.x
      @ship.move_right.should eql(before_move_x + Ship::VELOCITY)
    end

    it 'should not add value to x coordinate if is the end of the window size' do
      @ship.x = WarOS::HEIGHT-@ship.width
      @ship.move_right
      @ship.x.should eql(WarOS::HEIGHT-@ship.width)
    end
  end

  context 'when moving to the left' do
    it 'should add the shipvelocity to the x position of the ship' do
      before_move_x = @ship.x
      @ship.move_left.should eql(before_move_x - Ship::VELOCITY)
    end

    it 'should not subtract value of x coordinate if is the beggining of the window size' do
      @ship.x = Ship::SECUREMARGIN
      @ship.move_left
      @ship.x.should eql(Ship::SECUREMARGIN)
    end
  end

  it 'should return the actual x position of the ship' do
    x_position = @ship.x
    @ship.position.should eql(x_position..x_position+@ship.width) 
  end

  context 'for lin state' do
    it 'should set ship to the correct graphic image' do
      @ship.state = :lin
      graphics = @ship.instance_variable_get("@graphics")
      @ship.image.should eql(graphics[@ship.state])
    end
  end

  context 'for mac state' do
    it 'should set ship to the correct graphic image' do
      @ship.state = :mac
      graphics = @ship.instance_variable_get("@graphics")
      @ship.image.should eql(graphics[@ship.state])
    end
  end

  context 'for win state' do
    it 'should set ship to the correct graphic image' do
      @ship.state = :win
      graphics = @ship.instance_variable_get("@graphics")
      @ship.image.should eql(graphics[@ship.state])
    end
  end
end
