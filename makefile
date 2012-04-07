SOURCES = $(wildcard *.dot)
OBJECTS = $(SOURCES:.dot=.doto)
IMAGES  = $(SOURCES:.dot=.png)

all: $(IMAGES)

%.png: %.doto
	dot -Tpng $< > $@

%.doto: %.dot
	cpp -P -undef -Wundef -std=c99 -nostdinc -Wtrigraphs \
	   -fdollars-in-identifiers -C < $< | \
		gvpr -c 'N[$$.degree==0]{delete(NULL,$$)}' > $@

clean:
	-rm $(IMAGES) $(OBJECTS) *~
