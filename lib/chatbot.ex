defmodule Chatbot do
  @config %OpenAI.Config{api_key: "TODO"}

  def start(_type, _args) do
    loop()
  end

  defp loop() do
    # Get input from the user
    IO.write("👨 Me: ")
    user_input = IO.gets("") |> String.trim()

    # Create a message from the user input
    user_message = %{role: "user", content: user_input}

    # Get a reply from the AI
    {:ok, completion} = OpenAI.chat_completion([
        model: "gpt-4o",
        messages: [user_message]
      ],
      @config
    )
    %{choices: [%{"message" => assistant_message}]} = completion

    # Print the AI's reply
    IO.inspect(assistant_message)

    loop()
  end
end
