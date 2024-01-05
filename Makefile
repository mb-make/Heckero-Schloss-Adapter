
all: print.stl projection.svg

%.stl: %.scad $(wildcard *.scad)
	openscad $< -o $@

%.svg: %.scad $(wildcard *.scad)
	openscad $< -o $@

clean:
	@rm -vf print.stl projection.svg
