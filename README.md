## Presentation
<p>
Hello, this is a simple app to present the RabbitMQ with Ruby on Rails. With then you can create producers and consumers, and send messages in a queue to be consumed.
</p>

##Setup
Requirements:

- Docker and Docker compose

To install and run the containers execute them in your terminal:

`$ docker-compose build` and `$ docker-compose up`

and now you have executed a container with ruby and another one with RabbitMQ service.

##Use

➡️ To open the container with ruby bash you can use `docker exec -it CONTAINER_NAME bash`. After open the container bash, you can open an Rails console instance and than use the app classes/methods.

➡️ To open an rails console: `./bin/rails c`

➡️ To send a message to the queue you can execute it in a rails console:
`Client::Publisher.new.publish_message 'hey' `

➡️ To listen to the messages you can execute them in another Rails console instance:
	`Client::Receiver.new.listen_messages`
