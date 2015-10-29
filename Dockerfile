FROM resin/rpi-raspbian:jessie

RUN apt-get update \
	&& apt-get install -y ruby git \
	# Remove package lists to free up space
	&& rm -rf /var/lib/apt/lists/*

ADD . /App

RUN bundle install

CMD ["ruby", "/App/train.rb"]
