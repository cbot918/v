NAME=sumnums
BIN=./tlv

# run: $(NAME).s
# 	$(BIN)

print:
	./tlv sumnums.tl

test: $(NAME).tl
	echo $($(BIN) $(NAME).tl) >> $(NAME).s

test2:
	$(BIN) $(NAME).tl

# clean: