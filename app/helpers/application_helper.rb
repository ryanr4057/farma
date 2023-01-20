module ApplicationHelper


  def current_venda
    if !session[:venda_id].nil?
      Venda.find(session[:venda_id])
    else
      Venda.new
    end
  end
end
