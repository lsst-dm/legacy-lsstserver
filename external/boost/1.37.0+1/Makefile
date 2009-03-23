BJAM=./tools/jam/src/bin.linuxx86_64/bjam
BJAM_CONFIG=
prefix=/home/rplante/blds/18feb2/Linux64/external/boost/1.37.0+1
exec_prefix=$(prefix)
libdir=$(exec_prefix)/lib
includedir=$(prefix)/include
LIBS=

all: .dummy
	@echo "$(BJAM) $(BJAM_CONFIG) --user-config=user-config.jam $(LIBS)"
	@$(BJAM) $(BJAM_CONFIG) -d 4 --user-config=user-config.jam $(LIBS) || \
	echo "Not all Boost libraries built properly."

clean: .dummy
	rm -rf bin.v2

distclean: clean
	rm -rf Makefile config.log

check: .dummy
	@cd status && ../$(BJAM) $(BJAM_CONFIG) --user-config=../user-config.jam || echo "Some Boost regression tests failed. This is normal for many compilers."

install: .dummy
	@echo "$(BJAM) $(BJAM_CONFIG) --user-config=user-config.jam --prefix=$(prefix) --exec-prefix=$(exec_prefix) --libdir=$(libdir) --includedir=$(includedir) $(LIBS) install"
	@$(BJAM) $(BJAM_CONFIG) --user-config=user-config.jam --prefix=$(prefix) --exec-prefix=$(exec_prefix) --libdir=$(libdir) --includedir=$(includedir) $(LIBS) install || echo "Not all Boost libraries built properly."

.dummy:

