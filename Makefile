login:
	aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 225011078276.dkr.ecr.ap-northeast-1.amazonaws.com

build:
	docker build -t scala-ruby .

tag:
	docker tag scala-ruby:latest 225011078276.dkr.ecr.ap-northeast-1.amazonaws.com/scala-ruby:2.13.3_2.4.0_pg

push:
	docker push 225011078276.dkr.ecr.ap-northeast-1.amazonaws.com/scala-ruby:2.13.3_2.4.0_pg
