class ChatbotsController < ApplicationController

    def search
      @query = params[:query]
      response = @client.chat(
        parameters: {
            model: "gpt-3.5-turbo-0613",
            messages: [{ role: "user", content: @query }],
        })
  
      Rails.logger.info(response) # レスポンスをログに出力
  
      @chats = response.dig("choices", 0, "message", "content")
  
      respond_to do |format|
        format.html # if it's a html request, it will still work the same way
        format.js # but we prefer a JS request
      end
    end
  end 