all:
	@echo "download:        download RFCs (best using several jobs with '-j10')"
	@echo "oauth.docset       create the docset"
	@echo "oauth.docset.tgz   create compressed docset for docset feed"


clean:
	rm -fr oauth.docset oauth.docset.tgz

##############################################################################
# targets to download HTML versions of the RFCs
##############################################################################

download:
	bash download_oauth_oidc.sh

##############################################################################
# target to create the docset
##############################################################################

oauth.docset:
	rm -fr oauth.docset
	python3 create_docset.py

oauth.docset.tgz: oauth.docset
	tar --exclude='.DS_Store' --options 'gzip:compression-level=9' -cvzf oauth.docset.tgz oauth.docset
