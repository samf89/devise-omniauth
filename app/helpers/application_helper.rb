module ApplicationHelper
  
  def header(text) 
    content_for(:header) do
      text.to_s
    end
  end

end
