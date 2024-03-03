NAME	=	Death
ARCH 	= 	x86_64
ENABLE_DEBUGGING = off
DISABLE_PTRACE = off

SRCS_ASM = 	_start.asm

OBJS_ASM    =  $(addprefix ${OBJDIR}/,${SRCS_ASM:.asm=.o})

ASMA    =   nasm
OBJDIR 	=	  .objs
AFLAGS 	= 	-g -D $(shell echo ${ARCH} | tr '[:lower:]' '[:upper:]')
LFLAGS 	= 	-g -e _start -s
ASMDIR 	= 	./src
INCS 	= 	${ASMDIR}

_GREY=	$'\033[30m
_RED=	$'\033[31m
_GREEN=	$'\033[32m
_YELLOW=$'\033[33m
_BLUE=	$'\033[34m
_PURPLE=$'\033[35m
_CYAN=	$'\033[36m
_WHITE=	$'\033[37m
_END= $'\033[37m

ifeq ($(ENABLE_DEBUGGING), on)
	AFLAGS += -D ENABLE_DEBUGGING
endif

ifeq ($(DISABLE_PTRACE), on)
	AFLAGS += -D DISABLE_PTRACE
endif
	
ifeq ($(ARCH),x86_32)
	AFLAGS += -f elf32
	LFLAGS += -m elf_i386
else
	AFLAGS += -f elf64
	LFLAGS += -m elf_x86_64
endif

all:		${NAME}

$(OBJDIR)/%.o: $(ASMDIR)/%.asm
	@mkdir -p ${OBJDIR}
	@printf "%-15s ${_CYAN}${_BOLD}$<${_END} for ${ARCH}...\n" "Compiling"
	@${ASMA} -i${ASMDIR} ${AFLAGS} $< -o $@

${NAME}:	init ${OBJS_ASM}
	@printf "%-15s ${_PURPLE}${_BOLD}${NAME}${_END} for ${ARCH}...\n" "Compiling"
	@ld ${LFLAGS} -o ${NAME} ${OBJS_ASM}
	@printf "\n${_GREEN}${_BOLD}Compilation done !${_END}\n"

clean:		
	@printf "%-15s ${_RED}${_BOLD}${NAME}'s object files${_END}...\n" "Deleting"
	@rm -rf ${OBJS} ${OBJDIR}

fclean:		clean
	@printf "%-15s ${_RED}${_BOLD}${NAME}${_END}...\n" "Deleting"
	@rm -f ${NAME}

init:
	@printf "%-15s ${_GREEN}${_BOLD}${NAME}${_END}...\n" "Initiating"
	@mkdir -p ${OBJDIR}

show:
	@echo "Project configuration:"
	@echo "  name:      ${NAME}"
	@echo "  sources:   ${SRCS_ASM}"
	@echo "  objects:   ${OBJS_ASM}"
	@echo "  includes:  ${INCS}"
	@echo "  compiler:  ${ASMA}"
	@echo "  flags:     ${AFLAGS}"

gdb: 	re
	@printf "%-15s ${_GREEN}${_BOLD}gdb${_END}...\n" "Running"
	@gdb -q --tui --eval-command="layout regs" --eval-command="set follow-fork-mode child" --eval-command="set disable-randomization off" ${NAME}

re:			fclean all

lab:	all
	@printf "%-15s ${_GREEN}${_BOLD}lab${_END}...\n" "Running"
	@docker build --tag virus_lab_image .
	@docker run --name virus_lab --init --cap-add=SYS_PTRACE -d virus_lab_image
	@docker cp ${HOME} virus_lab:/home
	@docker exec -it virus_lab "/bin/bash"

rmlab:
	@printf "%-15s ${_GREEN}${_BOLD}deleting lab${_END}...\n" "Running"
	@docker container stop virus_lab
	@docker container rm virus_lab
	@docker image rm virus_lab_image

lab32:	all
	@printf "%-15s ${_GREEN}${_BOLD}lab${_END}...\n" "Running"
	@docker build --tag virus_lab32_image --build-arg LAB_IMAGE=i386/debian .
	@docker run --name virus_lab32 --init --cap-add=SYS_PTRACE -d virus_lab32_image
	@docker cp ${HOME} virus_lab32:/home
	@docker exec -it virus_lab32 "/bin/bash"

rmlab32:
	@printf "%-15s ${_GREEN}${_BOLD}deleting lab${_END}...\n" "Running"
	@docker container stop virus_lab32
	@docker container rm virus_lab32
	@docker image rm virus_lab32_image

help:
	@echo "Available make rules:"
	@echo "  all:       Build the executable ${NAME}."
	@echo "  clean:     Remove object files and object directory."
	@echo "  fclean:    Remove object files, object directory, and the executable ${NAME}."
	@echo "  init:      Initialize directories for object files and dependencies."
	@echo "  show:      Display information about the project configuration."
	@echo "  gdb:       Build and run the executable ${NAME} in gdb."
	@echo "  help:      Display this help message."

.PHONY:		all fclean clean init show re gdb help
