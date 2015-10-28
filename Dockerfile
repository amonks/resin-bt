FROM resin/rpi-raspbian:jessie

RUN apt-get update \
	&& apt-get install -y ruby git \
	# Remove package lists to free up space
	&& rm -rf /var/lib/apt/lists/*

ADD . /App

RUN cd App \
	&& git submodule foreach pull origin master \
	&& bundle install

CMD ["ruby", "/App/train.rb"]
