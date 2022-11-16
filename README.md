
<h2> Presentation </h2>

<p>

Hello, this is a simple app to present RabbitMQ with Ruby on Rails. With then you can create producers and consumers, and send messages in a queue to be consumed. This repository is used into https://blog.codeminer42.com/event-driven-architecture-2-our-first-app-with-rabbitmq/

</p>

  

<h1> Setup </h2>

Requirements:

  

- Docker and Docker compose

  

To install and run the containers execute them in your terminal:

  

`$ docker-compose build` and `$ docker-compose up`

  

and now you have executed a container with ruby and another one with RabbitMQ service.

<h2> Usage </h2>

  

➡️ To open the container with ruby bash you can use `docker exec -it CONTAINER_NAME bash`. After opening the container bash, you can open a Rails console instance and then use the app classes/methods.

  

➡️ To open an rails console: `./bin/rails c`

  

➡️ To send a message to the queue you can execute it in a rails console:

`RabbitMq::Client::Publisher.new.publish_message 'hey' `

  

➡️ To listen to the messages, you can execute them in another Rails console instance:

`RabbitMq::Client::Receiver.new.listen_messages`

<h2> Testing </h2>

To run the tests you can execute them in a console instance:

`bundle exec rspec`
