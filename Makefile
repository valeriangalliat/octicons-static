OCTICONS_PATH=$(shell node -p 'path.dirname(require.resolve("@primer/octicons"))')/build/svg
SOURCE_ICONS=$(shell find $(OCTICONS_PATH) -name '*.svg')
ICONS=$(SOURCE_ICONS:$(OCTICONS_PATH)/%=svg/%)

all: svg $(ICONS)

svg/%: $(OCTICONS_PATH)/%
	@sed 's/<svg /<svg id="icon" /' $< > $@

svg:
	@mkdir svg
