#DateTime Mixin
module DGM59NiceDateTime
  def nice_date
    return self.strftime("%d/%m/%Y")
  end
  
  def nice_time12
    return self.strftime("%I:%M%p")
  end
  
  def nice_time24
    return self.strftime("%H:%M")
  end
  
  alias_method :nice_time, :nice_time12

  def nice_datetime12
    return self.strftime("%d/%m/%Y %I:%M%p")
  end
  
  def nice_datetime24
    return self.strftime("%d/%m/%Y %H:%M")
  end
  
  alias_method :nice_datetime, :nice_datetime12

end

class ActiveSupport::TimeWithZone
  include DGM59NiceDateTime
end