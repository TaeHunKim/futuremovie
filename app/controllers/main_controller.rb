class MainController < ApplicationController
  def index
    vcheck
    @mains = Scraw.all
  end
  def vcheck
    lastitem = Main.find(1)
    last = lastitem.updated_at
    now = Time.new
    if now - last > 86400 then
      ScrawController.new.scrawl
      lastitem.update(last: now)
    end
  end
end
