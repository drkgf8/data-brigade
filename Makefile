build:
	rm -rf public
	hugo 

deploy: build
	aws s3 sync public/ s3://data-brigade --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E2YJC1IWXS89DQ --paths '/*'
	

	