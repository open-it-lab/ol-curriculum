SOURCES = $(wildcard *.dot)
OBJECTS = $(SOURCES:.dot=.doto)
IMAGES  = $(SOURCES:.dot=.png)

all: $(IMAGES)

%.png: %.doto
	dot -Tpng $< > $@

%.doto: %.dot
	./mixin.sh $< $@
	gvpr -c 'N[$$.degree==0]{delete(NULL,$$)}' $@ > $@.tmp
	mv $@.tmp $@

clean:
	-rm $(IMAGES)
	-rm $(OBJECTS)
	-rm *~