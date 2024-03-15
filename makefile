all:
	quarto render

publish:
	#rm -fr docs/*
	#cp -r _book/* docs/
	#git add docs
	git commit -a -m update
	git push

view:
	google-chrome _book/index.html
